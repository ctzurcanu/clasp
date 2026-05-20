Archived source lives here.

Purpose:
- keep old or backup source that may still be useful for reference
- keep it out of the active workspace and execution paths
- make it explicit that this code is not part of the clean runtime/compiler architecture

Rules:
- nothing under `attic/` is part of the supported interpreter, MLIR, or AOT execution pipeline
- do not add `attic/` crates back into the Cargo workspace
- do not call, import, or lower from `attic/` in active code

Current contents:
- `attic/crates/rlasp-evaluator/`
  dormant placeholder crate, archived so it cannot be built accidentally as part of the active workspace
- `attic/backup-files/`
  `.bak` and `.bak2` source snapshots moved out of active source directories
