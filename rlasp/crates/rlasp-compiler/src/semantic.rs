use crate::{Ast, CompilerError, CompilerResult, Expander};
use rlasp_reader::read_all_from_string;
use rlasp_runtime::header::{ObjectType, TypeHeader};
use rlasp_runtime::{LispObject, RString, Symbol};

macro_rules! semantic_id {
    ($name:ident) => {
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, PartialOrd, Ord)]
        pub struct $name(pub u32);
    };
}

semantic_id!(FormId);
semantic_id!(FunctionId);
semantic_id!(ConstId);
semantic_id!(LoadTimeValueId);
semantic_id!(LexicalSlotId);
semantic_id!(ClosedCellId);
semantic_id!(SpecialSlotId);
semantic_id!(BlockId);
semantic_id!(TagId);
semantic_id!(GenericDispatchSiteId);

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CompilationMode {
    Interpreter,
    MlirJit,
    Aot,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum CallKind {
    Unknown,
    SpecialOperator(String),
    GlobalLateBound(String),
    Direct(FunctionId),
    GenericDispatch(GenericDispatchSiteId),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MvOp {
    Values,
    ValuesList,
    MultipleValueCall,
    MultipleValueProg1,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum NlExitOp {
    Block(BlockId),
    Tag(TagId),
    Catch,
    Throw,
    UnwindProtect,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum PackageEffect {
    InPackage(String),
    Defpackage(String),
    UsePackage(Vec<String>),
    Export(Vec<String>),
    Import(Vec<String>),
    Shadow(Vec<String>),
    ShadowingImport(Vec<String>),
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct GenericDispatchSite {
    pub id: GenericDispatchSiteId,
    pub name: String,
}

#[derive(Debug, Clone)]
pub struct SemanticFunction {
    pub id: FunctionId,
    pub name: String,
    pub form_id: FormId,
}

#[derive(Debug, Clone)]
pub struct SemanticConstant {
    pub id: ConstId,
    pub value: LispObject,
}

#[derive(Debug, Clone)]
pub struct SemanticLoadTimeValue {
    pub id: LoadTimeValueId,
    pub value: LispObject,
}

#[derive(Debug, Clone)]
pub struct SemanticForm {
    pub id: FormId,
    pub original_form: LispObject,
    pub expanded_form: LispObject,
    pub ast: Option<Ast>,
    pub call_kind: CallKind,
    pub multiple_value_ops: Vec<MvOp>,
    pub non_local_exit_ops: Vec<NlExitOp>,
    pub package_effects: Vec<PackageEffect>,
    pub generic_dispatch_sites: Vec<GenericDispatchSiteId>,
}

#[derive(Debug, Clone)]
pub struct SemanticUnit {
    pub mode: CompilationMode,
    pub forms: Vec<SemanticForm>,
    pub functions: Vec<SemanticFunction>,
    pub constants: Vec<SemanticConstant>,
    pub load_time_values: Vec<SemanticLoadTimeValue>,
    pub generic_dispatch_sites: Vec<GenericDispatchSite>,
}

impl SemanticUnit {
    pub fn forms(&self) -> &[SemanticForm] {
        &self.forms
    }
}

pub fn compile_source_unit(source: &str, mode: CompilationMode) -> CompilerResult<SemanticUnit> {
    let forms = read_all_from_string(source)?;
    compile_unit(forms, mode)
}

pub fn compile_unit(forms: Vec<LispObject>, mode: CompilationMode) -> CompilerResult<SemanticUnit> {
    let expander = Expander::new();
    compile_unit_with_expander(forms, mode, &expander)
}

pub fn compile_expanded_unit(
    forms: Vec<LispObject>,
    mode: CompilationMode,
) -> CompilerResult<SemanticUnit> {
    let pairs = forms.into_iter().map(|form| (form, form)).collect();
    compile_expanded_unit_with_originals(pairs, mode)
}

pub fn compile_unit_with_expander(
    forms: Vec<LispObject>,
    mode: CompilationMode,
    expander: &Expander,
) -> CompilerResult<SemanticUnit> {
    let mut expanded_pairs = Vec::with_capacity(forms.len());
    for original_form in forms {
        let expanded_form = expander.macroexpand(original_form).map_err(|err| {
            CompilerError::MacroExpansionError {
                msg: err.to_string(),
            }
        })?;
        expanded_pairs.push((original_form, expanded_form));
    }
    compile_expanded_unit_with_originals(expanded_pairs, mode)
}

pub fn compile_expanded_unit_with_originals(
    forms: Vec<(LispObject, LispObject)>,
    mode: CompilationMode,
) -> CompilerResult<SemanticUnit> {
    let mut semantic_forms = Vec::with_capacity(forms.len());
    let mut functions = Vec::new();
    let constants = Vec::new();
    let load_time_values = Vec::new();
    let generic_dispatch_sites = Vec::new();

    for (idx, (original_form, expanded_form)) in forms.into_iter().enumerate() {
        let ast = Ast::from_lisp(expanded_form).ok();
        let form_id = FormId(idx as u32);
        if let Some(function_name) = top_level_function_name(expanded_form) {
            functions.push(SemanticFunction {
                id: FunctionId(functions.len() as u32),
                name: function_name,
                form_id,
            });
        }

        semantic_forms.push(SemanticForm {
            id: form_id,
            original_form,
            expanded_form,
            ast,
            call_kind: classify_call(expanded_form),
            multiple_value_ops: detect_multiple_value_ops(expanded_form),
            non_local_exit_ops: detect_non_local_exit_ops(expanded_form),
            package_effects: detect_package_effects(expanded_form),
            generic_dispatch_sites: Vec::new(),
        });
    }

    Ok(SemanticUnit {
        mode,
        forms: semantic_forms,
        functions,
        constants,
        load_time_values,
        generic_dispatch_sites,
    })
}

fn symbol_name(obj: LispObject) -> Option<String> {
    if !obj.is_general() {
        return None;
    }
    let ptr = obj.as_general_ptr::<u8>()?;
    if ptr.is_null() {
        return None;
    }
    match unsafe { TypeHeader::from_ptr(ptr) }? {
        ObjectType::Symbol => {
            let symbol = unsafe { &*(ptr as *const Symbol) };
            Some(symbol.name().to_string())
        }
        ObjectType::String => {
            let string = unsafe { &*(ptr as *const RString) };
            Some(string.as_str().to_string())
        }
        _ => None,
    }
}

fn list_elements(obj: LispObject) -> Option<Vec<LispObject>> {
    if obj.is_nil() {
        return Some(Vec::new());
    }
    let cons_ptr = obj.as_cons_ptr()?;
    if cons_ptr.is_null() {
        return None;
    }
    let cons = unsafe { &*cons_ptr };
    cons.to_vec()
}

fn top_level_call_head(form: LispObject) -> Option<String> {
    let elements = list_elements(form)?;
    if elements.is_empty() {
        return None;
    }
    symbol_name(elements[0])
}

fn top_level_function_name(form: LispObject) -> Option<String> {
    let elements = list_elements(form)?;
    if elements.len() < 2 {
        return None;
    }
    let head = symbol_name(elements[0])?;
    let base = head.rsplit(':').next().unwrap_or(head.as_str());
    if base.eq_ignore_ascii_case("defun") {
        if let Some(name) = symbol_name(elements[1]) {
            return Some(name);
        }
        let setf_parts = list_elements(elements[1])?;
        if setf_parts.len() == 2 {
            let setf_head = symbol_name(setf_parts[0])?;
            let setf_base = setf_head.rsplit(':').next().unwrap_or(setf_head.as_str());
            if setf_base.eq_ignore_ascii_case("setf") {
                let target = symbol_name(setf_parts[1])?;
                return Some(format!("(setf {})", target));
            }
        }
        return None;
    }

    if base.eq_ignore_ascii_case("progn") {
        for expr in elements.iter().skip(1) {
            if let Some(name) = top_level_function_name(*expr) {
                return Some(name);
            }
        }
        return None;
    }

    if base.eq_ignore_ascii_case("setq") {
        let name = symbol_name(elements[1])?;
        if !name.to_ascii_uppercase().starts_with("%FN%") {
            return None;
        }
        if elements.len() < 3 {
            return None;
        }
        let value_parts = list_elements(elements[2])?;
        if value_parts.is_empty() {
            return None;
        }
        let lambda_head = symbol_name(value_parts[0])?;
        let lambda_base = lambda_head
            .rsplit(':')
            .next()
            .unwrap_or(lambda_head.as_str());
        let lambda_form = if lambda_base.eq_ignore_ascii_case("top-level-function") {
            if value_parts.len() < 2 {
                return None;
            }
            value_parts[1]
        } else {
            elements[2]
        };
        let lambda_parts = list_elements(lambda_form)?;
        if lambda_parts.is_empty() {
            return None;
        }
        let lambda_head = symbol_name(lambda_parts[0])?;
        let lambda_base = lambda_head
            .rsplit(':')
            .next()
            .unwrap_or(lambda_head.as_str());
        if !lambda_base.eq_ignore_ascii_case("lambda") {
            return None;
        }
        return Some(name.trim_start_matches("%FN%").to_string());
    }

    None
}

fn classify_call(form: LispObject) -> CallKind {
    let Some(head) = top_level_call_head(form) else {
        return CallKind::Unknown;
    };
    let base = head.rsplit(':').next().unwrap_or(head.as_str());
    if matches!(
        base.to_ascii_lowercase().as_str(),
        "quote"
            | "if"
            | "progn"
            | "let"
            | "let*"
            | "lambda"
            | "setq"
            | "block"
            | "return-from"
            | "tagbody"
            | "go"
            | "catch"
            | "throw"
            | "unwind-protect"
            | "function"
    ) {
        return CallKind::SpecialOperator(base.to_string());
    }
    CallKind::GlobalLateBound(head)
}

fn detect_multiple_value_ops(form: LispObject) -> Vec<MvOp> {
    let Some(head) = top_level_call_head(form) else {
        return Vec::new();
    };
    match head
        .rsplit(':')
        .next()
        .unwrap_or(head.as_str())
        .to_ascii_lowercase()
        .as_str()
    {
        "values" => vec![MvOp::Values],
        "values-list" => vec![MvOp::ValuesList],
        "multiple-value-call" => vec![MvOp::MultipleValueCall],
        "multiple-value-prog1" => vec![MvOp::MultipleValueProg1],
        _ => Vec::new(),
    }
}

fn detect_non_local_exit_ops(form: LispObject) -> Vec<NlExitOp> {
    let Some(head) = top_level_call_head(form) else {
        return Vec::new();
    };
    match head
        .rsplit(':')
        .next()
        .unwrap_or(head.as_str())
        .to_ascii_lowercase()
        .as_str()
    {
        "block" => vec![NlExitOp::Block(BlockId(0))],
        "return-from" => vec![NlExitOp::Block(BlockId(0))],
        "tagbody" => vec![NlExitOp::Tag(TagId(0))],
        "go" => vec![NlExitOp::Tag(TagId(0))],
        "catch" => vec![NlExitOp::Catch],
        "throw" => vec![NlExitOp::Throw],
        "unwind-protect" => vec![NlExitOp::UnwindProtect],
        _ => Vec::new(),
    }
}

fn collect_names_from_rest(form: LispObject) -> Vec<String> {
    let Some(elements) = list_elements(form) else {
        return Vec::new();
    };
    elements
        .into_iter()
        .skip(1)
        .filter_map(symbol_name)
        .collect()
}

fn detect_package_effects(form: LispObject) -> Vec<PackageEffect> {
    let Some(head) = top_level_call_head(form) else {
        return Vec::new();
    };
    let Some(elements) = list_elements(form) else {
        return Vec::new();
    };
    let base = head
        .rsplit(':')
        .next()
        .unwrap_or(head.as_str())
        .to_ascii_lowercase();
    match base.as_str() {
        "in-package" => elements
            .get(1)
            .and_then(|obj| symbol_name(*obj))
            .map(PackageEffect::InPackage)
            .into_iter()
            .collect(),
        "defpackage" => elements
            .get(1)
            .and_then(|obj| symbol_name(*obj))
            .map(PackageEffect::Defpackage)
            .into_iter()
            .collect(),
        "use-package" => vec![PackageEffect::UsePackage(collect_names_from_rest(form))],
        "export" => vec![PackageEffect::Export(collect_names_from_rest(form))],
        "import" => vec![PackageEffect::Import(collect_names_from_rest(form))],
        "shadow" => vec![PackageEffect::Shadow(collect_names_from_rest(form))],
        "shadowing-import" => {
            vec![PackageEffect::ShadowingImport(collect_names_from_rest(
                form,
            ))]
        }
        _ => Vec::new(),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn compile_source_unit_collects_package_effects_and_ids() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(in-package :cl-user) (defpackage :demo (:use :cl)) (defun demo-fn () 42)",
            CompilationMode::Interpreter,
        )
        .unwrap();

        assert_eq!(unit.forms.len(), 3);
        assert_eq!(unit.functions.len(), 1);
        assert_eq!(unit.functions[0].name.to_ascii_lowercase(), "demo-fn");
        assert!(matches!(
            unit.forms[0].package_effects.as_slice(),
            [PackageEffect::InPackage(_)]
        ));
        assert!(matches!(
            unit.forms[1].package_effects.as_slice(),
            [PackageEffect::Defpackage(_)]
        ));
    }

    #[test]
    fn compile_source_unit_collects_setf_function_binding() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(defun (setf lastcar) (object list) (setf (car list) object))",
            CompilationMode::MlirJit,
        )
        .unwrap();
        assert_eq!(unit.functions.len(), 1);
        assert_eq!(unit.functions[0].name, "(setf lastcar)");
    }
}
