use rlasp_compiler::SemanticUnit;
use rlasp_mlir::lowering::{emit_mlir_bytecode, lower_mlir_file_to_native_object_path};
use rlasp_mlir::{MlirLowerer, MlirModule};
use std::fs;
use std::path::PathBuf;
use std::time::{SystemTime, UNIX_EPOCH};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum NativeArtifactKind {
    MlirText,
    MlirBytecode,
    NativeObject,
}

pub struct ObjectEmitter;

impl ObjectEmitter {
    pub fn lower(unit: &SemanticUnit) -> Result<MlirModule, String> {
        MlirLowerer::lower(unit).map_err(|e| e.to_string())
    }

    pub fn emit(
        unit: &SemanticUnit,
        output_path: &str,
        kind: NativeArtifactKind,
    ) -> Result<(), String> {
        let module = Self::lower(unit)?;
        Self::emit_module(&module, output_path, kind)
    }

    pub fn emit_module(
        module: &MlirModule,
        output_path: &str,
        kind: NativeArtifactKind,
    ) -> Result<(), String> {
        match kind {
            NativeArtifactKind::MlirText => {
                module.write_to_path(output_path).map_err(|e| e.to_string())
            }
            NativeArtifactKind::MlirBytecode => {
                emit_mlir_bytecode(module.as_str(), output_path).map_err(|e| e.to_string())
            }
            NativeArtifactKind::NativeObject => {
                let tmp_mlirbc = unique_temp_path("semantic-unit", "mlirbc");
                let tmp_mlirbc_str = tmp_mlirbc.to_string_lossy().to_string();
                emit_mlir_bytecode(module.as_str(), &tmp_mlirbc_str).map_err(|e| e.to_string())?;
                let result = lower_mlir_file_to_native_object_path(&tmp_mlirbc_str, output_path)
                    .map_err(|e| e.to_string());
                let _ = fs::remove_file(tmp_mlirbc);
                result
            }
        }
    }
}

fn unique_temp_path(stem: &str, ext: &str) -> PathBuf {
    let pid = std::process::id();
    let nanos = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_nanos())
        .unwrap_or(0);
    std::env::temp_dir().join(format!("{stem}-{pid}-{nanos}.{ext}"))
}

#[cfg(test)]
mod tests {
    use super::*;
    use rlasp_compiler::{compile_source_unit, CompilationMode};

    #[test]
    fn emit_semantic_unit_as_mlir_text() {
        rlasp_runtime::init_runtime();
        let unit = compile_source_unit("(+ 20 22)", CompilationMode::MlirJit).unwrap();
        let out = unique_temp_path("semantic-text", "mlir");
        let out_str = out.to_string_lossy().to_string();
        ObjectEmitter::emit(&unit, &out_str, NativeArtifactKind::MlirText).unwrap();
        let text = fs::read_to_string(&out).unwrap();
        assert!(text.contains("__semantic_form_0"));
        let _ = fs::remove_file(out);
    }
}
