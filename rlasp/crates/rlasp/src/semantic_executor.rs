use crate::ir::ASTNode;
use crate::repl::eval::{eval_conditions, eval_with_persistent_env, EvalResult};
use crate::repl::lisp_to_ast::{lisp_to_ast, with_read_time_env};
use rlasp_compiler::{SemanticForm, SemanticUnit};
use std::collections::HashMap;

pub struct InterpreterExecutor {
    env: HashMap<String, EvalResult>,
}

impl InterpreterExecutor {
    pub fn new() -> Self {
        Self {
            env: HashMap::new(),
        }
    }

    pub fn with_env(env: HashMap<String, EvalResult>) -> Self {
        Self { env }
    }

    pub fn env(&self) -> &HashMap<String, EvalResult> {
        &self.env
    }

    pub fn env_mut(&mut self) -> &mut HashMap<String, EvalResult> {
        &mut self.env
    }

    pub fn into_env(self) -> HashMap<String, EvalResult> {
        self.env
    }

    pub fn run(&mut self, unit: &SemanticUnit) -> Result<EvalResult, String> {
        let mut last_result = EvalResult::Nil;
        for form in unit.forms() {
            last_result = self.run_form(form)?;
        }
        Ok(last_result)
    }

    pub fn run_form(&mut self, form: &SemanticForm) -> Result<EvalResult, String> {
        let ast = with_read_time_env(&mut self.env, || lisp_to_ast(form.expanded_form))?;
        self.run_ast(&ast)
    }

    pub fn run_ast(&mut self, ast: &ASTNode) -> Result<EvalResult, String> {
        match eval_with_persistent_env(ast, &mut self.env) {
            Ok(value) => Ok(value),
            Err(e) if e == "__SIGNAL_CONDITION__" => {
                if let Some(cond) = eval_conditions::take_pending_signaled_condition() {
                    Err(format!("{}", cond))
                } else {
                    Err(e)
                }
            }
            Err(e) if e == "__MP_SIGNAL_CONDITION__" => {
                if let Some(cond) = crate::repl::take_pending_mp_signal_condition() {
                    Err(format!("{}", cond))
                } else {
                    Err(e)
                }
            }
            Err(e) => Err(e),
        }
    }
}

impl Default for InterpreterExecutor {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_compiler::{compile_source_unit, CompilationMode};

    #[test]
    fn interpreter_executor_runs_semantic_unit() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit(
            "(setq sem-x 10)\n(+ sem-x 32)",
            CompilationMode::Interpreter,
        )
        .unwrap();
        let mut exec = InterpreterExecutor::new();
        let result = exec.run(&unit).unwrap();
        match result {
            EvalResult::Fixnum(n) => assert_eq!(n, 42),
            other => panic!("unexpected result: {:?}", other),
        }
    }
}
