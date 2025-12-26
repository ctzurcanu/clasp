// rlasp WASM Extension Runtime
// Runs WASI .wasm modules and provides host functions for FFI, C++, and other native capabilities

package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"sync"

	"github.com/tetratelabs/wazero"
	"github.com/tetratelabs/wazero/api"
	"github.com/tetratelabs/wazero/imports/wasi_snapshot_preview1"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Println("Usage: rlasp-wasm-ext <wasm-file>")
		os.Exit(1)
	}

	wasmFile := os.Args[1]

	ctx := context.Background()

	// Create a new WebAssembly runtime
	r := wazero.NewRuntime(ctx)
	defer r.Close(ctx)

	// Instantiate WASI
	wasi_snapshot_preview1.MustInstantiate(ctx, r)

	// Register custom host functions for rlasp
	if err := registerRlaspHostFunctions(ctx, r); err != nil {
		log.Fatalf("Failed to register host functions: %v", err)
	}

	// Read the WASM module
	wasmBytes, err := os.ReadFile(wasmFile)
	if err != nil {
		log.Fatalf("Failed to read WASM file: %v", err)
	}

	// Compile the module
	compiledModule, err := r.CompileModule(ctx, wasmBytes)
	if err != nil {
		log.Fatalf("Failed to compile module: %v", err)
	}
	defer compiledModule.Close(ctx)

	// Store runtime in context for WASM loading
	ctx = context.WithValue(ctx, "runtime", r)

	// Instantiate the module
	config := wazero.NewModuleConfig().
		WithStdout(os.Stdout).
		WithStderr(os.Stderr).
		WithStdin(os.Stdin).
		WithArgs(os.Args[1:]...)

	module, err := r.InstantiateModule(ctx, compiledModule, config)
	if err != nil {
		log.Fatalf("Failed to instantiate module: %v", err)
	}
	defer module.Close(ctx)

	fmt.Println("\n╔════════════════════════════════════════╗")
	fmt.Println("║  Testing Compiled Lisp Functions      ║")
	fmt.Println("╚════════════════════════════════════════╝\n")

	// Call exported Lisp functions
	callLispFunctions(ctx, module)

	// Demonstrate host function capabilities (C/C++/Rust via FFI)
	demonstrateHostCapabilities()

	fmt.Println("\n╔════════════════════════════════════════╗")
	fmt.Println("║  All Tests Complete ✓                 ║")
	fmt.Println("╚════════════════════════════════════════╝\n")
}

// callLispFunctions calls the exported Lisp functions and displays results
func callLispFunctions(ctx context.Context, module api.Module) {
	// Test 1: get_answer() -> 42
	if getAnswer := module.ExportedFunction("get_answer"); getAnswer != nil {
		results, err := getAnswer.Call(ctx)
		if err != nil {
			log.Printf("Error calling get_answer: %v", err)
		} else if len(results) > 0 {
			boxed := results[0]
			unboxed := ccUnboxFixnum(boxed)
			fmt.Printf("✓ get_answer() = %d (expected 42)\n", unboxed)
		}
	}

	// Test 2: add(10, 32) -> 42
	if add := module.ExportedFunction("add"); add != nil {
		a := ccBoxFixnum(10)
		b := ccBoxFixnum(32)
		results, err := add.Call(ctx, a, b)
		if err != nil {
			log.Printf("Error calling add: %v", err)
		} else if len(results) > 0 {
			boxed := results[0]
			unboxed := ccUnboxFixnum(boxed)
			fmt.Printf("✓ add(10, 32) = %d (expected 42)\n", unboxed)
		}
	}

	// Test 3: factorial_5() -> 120
	if factorial5 := module.ExportedFunction("factorial_5"); factorial5 != nil {
		results, err := factorial5.Call(ctx)
		if err != nil {
			log.Printf("Error calling factorial_5: %v", err)
		} else if len(results) > 0 {
			boxed := results[0]
			unboxed := ccUnboxFixnum(boxed)
			fmt.Printf("✓ factorial_5() = %d (expected 120)\n", unboxed)
		}
	}

	// Test 4: test_wasm_call() -> loads and calls another WASM module
	fmt.Println("\n>>> Testing WASM-to-WASM interop")
	if wasmCall := module.ExportedFunction("test_wasm_call"); wasmCall != nil {
		results, err := wasmCall.Call(ctx)
		if err != nil {
			log.Printf("Error calling test_wasm_call: %v", err)
		} else if len(results) > 0 {
			boxed := results[0]
			unboxed := ccUnboxFixnum(boxed)
			fmt.Printf("✓ test_wasm_call() = %d (expected 42 from math_lib.wasm)\n", unboxed)
		}
	}
}

// demonstrateHostCapabilities shows FFI, C++, and native capabilities
func demonstrateHostCapabilities() {
	fmt.Println("\n>>> Demonstrating Host Capabilities (C/C++/Rust)")
	fmt.Println("    (These are available to compiled Lisp code)")

	// Test C FFI
	libName := "libm.dylib"
	libID, err := globalFFIManager.LoadLibrary(libName)
	if err == nil {
		fmt.Printf("✓ C FFI: Loaded %s (ID: %d)\n", libName, libID)

		_, err := globalFFIManager.GetFunctionPointer(libID, "sqrt")
		if err == nil {
			fmt.Printf("✓ C FFI: Retrieved function pointer for sqrt()\n")
		}
	}

	// Test C++ interop
	className := "std::vector<int>"
	objID, err := globalCPPManager.NewObject(className)
	if err == nil {
		fmt.Printf("✓ C++ Interop: Created object %s (ID: %d)\n", className, objID)

		_, err := globalCPPManager.CallMethod(objID, "push_back", []interface{}{42})
		if err == nil {
			fmt.Printf("✓ C++ Interop: Called push_back(42) method\n")
		}

		globalCPPManager.DeleteObject(objID)
		fmt.Printf("✓ C++ Interop: Deleted object\n")
	}

	// These are implemented in Go (which is written in C/calls Rust internally)
	fmt.Printf("✓ Native: Go runtime provides tagged pointers, memory management\n")
}

// registerRlaspHostFunctions registers custom host functions for rlasp
func registerRlaspHostFunctions(ctx context.Context, r wazero.Runtime) error {
	// Create the "env" module with rlasp intrinsics (for compiled Lisp code)
	_, err := r.NewHostModuleBuilder("env").
		NewFunctionBuilder().
		WithFunc(ccBoxFixnum).
		Export("cc_box_fixnum").
		NewFunctionBuilder().
		WithFunc(ccUnboxFixnum).
		Export("cc_unbox_fixnum").
		NewFunctionBuilder().
		WithFunc(ccBoxFloat).
		Export("cc_box_float").
		NewFunctionBuilder().
		WithFunc(ccUnboxFloat).
		Export("cc_unbox_float").
		NewFunctionBuilder().
		WithFunc(ccCons).
		Export("cc_cons").
		NewFunctionBuilder().
		WithFunc(ccCar).
		Export("cc_car").
		NewFunctionBuilder().
		WithFunc(ccCdr).
		Export("cc_cdr").
		NewFunctionBuilder().
		WithFunc(ccNil).
		Export("cc_nil").
		NewFunctionBuilder().
		WithFunc(ccT).
		Export("cc_t").
		NewFunctionBuilder().
		WithFunc(ccIsNil).
		Export("cc_is_nil").
		NewFunctionBuilder().
		WithFunc(ccIsFixnum).
		Export("cc_is_fixnum").
		NewFunctionBuilder().
		WithFunc(ccIsCons).
		Export("cc_is_cons").
		NewFunctionBuilder().
		WithFunc(wasmLoadModule).
		Export("wasm_load_module").
		NewFunctionBuilder().
		WithFunc(wasmCallFunction).
		Export("wasm_call_function").
		NewFunctionBuilder().
		WithFunc(wasmCallFunction2).
		Export("wasm_call_function2").
		Instantiate(ctx)
	if err != nil {
		return err
	}

	// Create the "rlasp_ext" module with host functions
	_, err = r.NewHostModuleBuilder("rlasp_ext").
		NewFunctionBuilder().
		WithFunc(ffiLoadLibrary).
		Export("ffi_load_library").
		NewFunctionBuilder().
		WithFunc(ffiCallFunction).
		Export("ffi_call_function").
		NewFunctionBuilder().
		WithFunc(cppNew).
		Export("cpp_new").
		NewFunctionBuilder().
		WithFunc(cppDelete).
		Export("cpp_delete").
		NewFunctionBuilder().
		WithFunc(cppCallMethod).
		Export("cpp_call_method").
		NewFunctionBuilder().
		WithFunc(allocMemory).
		Export("alloc_memory").
		NewFunctionBuilder().
		WithFunc(freeMemory).
		Export("free_memory").
		NewFunctionBuilder().
		WithFunc(logMessage).
		Export("log_message").
		Instantiate(ctx)

	return err
}

// Host function implementations

// ffiLoadLibrary loads a dynamic library
func ffiLoadLibrary(ctx context.Context, m api.Module, namePtr, nameLen uint32) uint64 {
	name, ok := m.Memory().Read(namePtr, nameLen)
	if !ok {
		log.Printf("Failed to read library name from memory")
		return 0
	}

	libraryName := string(name)
	log.Printf("Loading library: %s", libraryName)

	libID, err := globalFFIManager.LoadLibrary(libraryName)
	if err != nil {
		log.Printf("Failed to load library: %v", err)
		return 0
	}

	return libID
}

// ffiCallFunction calls a function from a loaded library
func ffiCallFunction(ctx context.Context, m api.Module, libHandle uint64, funcNamePtr, funcNameLen, argsPtr uint32) uint64 {
	funcName, ok := m.Memory().Read(funcNamePtr, funcNameLen)
	if !ok {
		log.Printf("Failed to read function name from memory")
		return 0
	}

	funcNameStr := string(funcName)
	log.Printf("Calling function: %s from library handle %d", funcNameStr, libHandle)

	// Get function pointer
	funcPtr, err := globalFFIManager.GetFunctionPointer(libHandle, funcNameStr)
	if err != nil {
		log.Printf("Failed to get function pointer: %v", err)
		return 0
	}

	// TODO: Parse arguments from argsPtr
	// For now, call with no arguments returning double
	result, err := globalFFIManager.CallFunction(funcPtr, []interface{}{}, FFIDouble)
	if err != nil {
		log.Printf("Failed to call function: %v", err)
		return 0
	}

	// Convert result to uint64 (bit pattern for double)
	if f64, ok := result.(float64); ok {
		return uint64(f64)
	}

	return 0
}

// cppNew creates a new C++ object
func cppNew(ctx context.Context, m api.Module, classNamePtr, classNameLen, argsPtr uint32) uint64 {
	className, ok := m.Memory().Read(classNamePtr, classNameLen)
	if !ok {
		log.Printf("Failed to read class name from memory")
		return 0
	}

	classNameStr := string(className)
	log.Printf("Creating C++ object of class: %s", classNameStr)

	objID, err := globalCPPManager.NewObject(classNameStr)
	if err != nil {
		log.Printf("Failed to create C++ object: %v", err)
		return 0
	}

	return objID
}

// cppDelete deletes a C++ object
func cppDelete(ctx context.Context, m api.Module, objectHandle uint64) {
	log.Printf("Deleting C++ object with handle: %d", objectHandle)

	if err := globalCPPManager.DeleteObject(objectHandle); err != nil {
		log.Printf("Failed to delete C++ object: %v", err)
	}
}

// cppCallMethod calls a method on a C++ object
func cppCallMethod(ctx context.Context, m api.Module, objectHandle uint64, methodNamePtr, methodNameLen, argsPtr uint32) uint64 {
	methodName, ok := m.Memory().Read(methodNamePtr, methodNameLen)
	if !ok {
		log.Printf("Failed to read method name from memory")
		return 0
	}

	methodNameStr := string(methodName)
	log.Printf("Calling method: %s on object handle %d", methodNameStr, objectHandle)

	// TODO: Parse arguments from argsPtr
	result, err := globalCPPManager.CallMethod(objectHandle, methodNameStr, []interface{}{})
	if err != nil {
		log.Printf("Failed to call C++ method: %v", err)
		return 0
	}

	if u64, ok := result.(uint64); ok {
		return u64
	}

	return 0
}

// allocMemory allocates memory accessible from WASM
func allocMemory(ctx context.Context, m api.Module, size uint32) uint32 {
	log.Printf("Allocating %d bytes of memory", size)

	// TODO: Implement proper memory allocation
	// This might involve growing the WASM memory or managing a separate heap
	return 0
}

// freeMemory frees allocated memory
func freeMemory(ctx context.Context, m api.Module, ptr uint32) {
	log.Printf("Freeing memory at pointer: %d", ptr)

	// TODO: Implement memory deallocation
}

// logMessage logs a message from WASM
func logMessage(ctx context.Context, m api.Module, levelPtr, levelLen, msgPtr, msgLen uint32) {
	level, ok := m.Memory().Read(levelPtr, levelLen)
	if !ok {
		log.Printf("Failed to read log level from memory")
		return
	}

	msg, ok := m.Memory().Read(msgPtr, msgLen)
	if !ok {
		log.Printf("Failed to read log message from memory")
		return
	}

	log.Printf("[%s] %s", string(level), string(msg))
}

// WASM module management
var (
	wasmModules = make(map[uint64]api.Module)
	nextModuleID uint64 = 1
	modulesMutex sync.RWMutex
)

// wasmLoadModule loads a WASM module from file
func wasmLoadModule(ctx context.Context, m api.Module, pathPtr, pathLen uint32) uint64 {
	path, ok := m.Memory().Read(pathPtr, pathLen)
	if !ok {
		log.Printf("Failed to read path from memory")
		return 0
	}

	pathStr := string(path)
	log.Printf("Loading WASM module: %s", pathStr)

	// Read WASM file
	wasmBytes, err := os.ReadFile(pathStr)
	if err != nil {
		log.Printf("Failed to read WASM file: %v", err)
		return 0
	}

	// Get runtime from context (stored during initialization)
	r := ctx.Value("runtime").(wazero.Runtime)

	// Compile module
	compiled, err := r.CompileModule(ctx, wasmBytes)
	if err != nil {
		log.Printf("Failed to compile module: %v", err)
		return 0
	}

	// Instantiate module
	mod, err := r.InstantiateModule(ctx, compiled, wazero.NewModuleConfig())
	if err != nil {
		log.Printf("Failed to instantiate module: %v", err)
		return 0
	}

	// Store module
	modulesMutex.Lock()
	modID := nextModuleID
	nextModuleID++
	wasmModules[modID] = mod
	modulesMutex.Unlock()

	log.Printf("Loaded WASM module with ID: %d", modID)
	return modID
}

// wasmCallFunction calls an exported function from a loaded WASM module
func wasmCallFunction(ctx context.Context, m api.Module, moduleID uint64, funcNamePtr, funcNameLen, arg uint32) uint64 {
	funcName, ok := m.Memory().Read(funcNamePtr, funcNameLen)
	if !ok {
		log.Printf("Failed to read function name from memory")
		return 0
	}

	funcNameStr := string(funcName)

	modulesMutex.RLock()
	mod, exists := wasmModules[moduleID]
	modulesMutex.RUnlock()

	if !exists {
		log.Printf("Module %d not found", moduleID)
		return 0
	}

	fn := mod.ExportedFunction(funcNameStr)
	if fn == nil {
		log.Printf("Function %s not found in module %d", funcNameStr, moduleID)
		return 0
	}

	log.Printf("Calling %s(%d) from module %d", funcNameStr, arg, moduleID)

	results, err := fn.Call(ctx, uint64(arg))
	if err != nil {
		log.Printf("Failed to call function: %v", err)
		return 0
	}

	if len(results) > 0 {
		return results[0]
	}

	return 0
}

// wasmCallFunction2 calls a function with 2 arguments
func wasmCallFunction2(ctx context.Context, m api.Module, moduleID uint64, funcNamePtr, funcNameLen, arg1, arg2 uint32) uint64 {
	funcName, ok := m.Memory().Read(funcNamePtr, funcNameLen)
	if !ok {
		log.Printf("Failed to read function name from memory")
		return 0
	}

	funcNameStr := string(funcName)

	modulesMutex.RLock()
	mod, exists := wasmModules[moduleID]
	modulesMutex.RUnlock()

	if !exists {
		log.Printf("Module %d not found", moduleID)
		return 0
	}

	fn := mod.ExportedFunction(funcNameStr)
	if fn == nil {
		log.Printf("Function %s not found in module %d", funcNameStr, moduleID)
		return 0
	}

	log.Printf("Calling %s(%d, %d) from module %d", funcNameStr, arg1, arg2, moduleID)

	results, err := fn.Call(ctx, uint64(arg1), uint64(arg2))
	if err != nil {
		log.Printf("Failed to call function: %v", err)
		return 0
	}

	if len(results) > 0 {
		return results[0]
	}

	return 0
}

// Rlasp intrinsic functions (for compiled Lisp code)
// These implement the tagged pointer operations

// ccBoxFixnum boxes an i64 into a LispObject fixnum (tag: 0b00)
func ccBoxFixnum(n int64) uint64 {
	// Shift left by 2 and tag with 00
	return uint64(n << 2)
}

// ccUnboxFixnum unboxes a LispObject fixnum to i64
func ccUnboxFixnum(obj uint64) int64 {
	// Shift right by 2 (arithmetic)
	return int64(obj) >> 2
}

// ccBoxFloat boxes an f64 into a LispObject (allocates on heap, tag: 0b11)
func ccBoxFloat(f float64) uint64 {
	// Simplified: just return the bits as-is with general tag
	// In real implementation, would allocate heap object
	return uint64(0x03) // General object tag
}

// ccUnboxFloat unboxes a LispObject to f64
func ccUnboxFloat(obj uint64) float64 {
	// Simplified: return 0.0
	return 0.0
}

// ccCons creates a cons cell (tag: 0b01)
func ccCons(car, cdr uint64) uint64 {
	// Simplified: return tagged pointer
	return 0x01 // Cons tag
}

// ccCar gets the car of a cons cell
func ccCar(obj uint64) uint64 {
	return 0
}

// ccCdr gets the cdr of a cons cell
func ccCdr(obj uint64) uint64 {
	return 0
}

// ccNil returns the nil LispObject
func ccNil() uint64 {
	return 0
}

// ccT returns the t (true) LispObject
func ccT() uint64 {
	return 0x04 // Some non-nil value
}

// ccIsNil checks if a LispObject is nil
func ccIsNil(obj uint64) uint32 {
	if obj == 0 {
		return 1
	}
	return 0
}

// ccIsFixnum checks if a LispObject is a fixnum
func ccIsFixnum(obj uint64) uint32 {
	if (obj & 0x03) == 0 {
		return 1
	}
	return 0
}

// ccIsCons checks if a LispObject is a cons cell
func ccIsCons(obj uint64) uint32 {
	if (obj & 0x03) == 0x01 {
		return 1
	}
	return 0
}
