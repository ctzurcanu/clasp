#!/usr/bin/env node
const fs = require('fs');
const path = require('path');

if (process.argv.length < 3) {
  console.error('Usage: node run-wasm.js <file.wasm>');
  process.exit(1);
}

const wasmFile = process.argv[2];
const wasmBuffer = fs.readFileSync(wasmFile);

// Provide the memory import that LLVM's WASM backend expects
const importObject = {
  env: {
    __linear_memory: new WebAssembly.Memory({ initial: 0 })
  }
};

WebAssembly.instantiate(wasmBuffer, importObject)
  .then(result => {
    const main = result.instance.exports.main;
    if (!main) {
      console.error('Error: No main export found in WASM module');
      process.exit(1);
    }

    const value = main();
    console.log(value);
    process.exit(0);
  })
  .catch(err => {
    console.error('Error running WASM:', err);
    process.exit(1);
  });
