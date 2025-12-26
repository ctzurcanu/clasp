package main

/*
#cgo CFLAGS: -I/opt/homebrew/opt/libffi/include
#cgo LDFLAGS: -L/opt/homebrew/opt/libffi/lib -ldl
#include <dlfcn.h>
#include <stdlib.h>
*/
import "C"
import (
	"fmt"
	"sync"
	"unsafe"
)

type LibraryHandle struct {
	handle unsafe.Pointer
	name   string
}

type FFIManager struct {
	mu          sync.RWMutex
	libraries   map[uint64]*LibraryHandle
	nextLibID   uint64
}

var globalFFIManager = &FFIManager{
	libraries: make(map[uint64]*LibraryHandle),
	nextLibID: 1,
}

func (fm *FFIManager) LoadLibrary(name string) (uint64, error) {
	fm.mu.Lock()
	defer fm.mu.Unlock()

	cname := C.CString(name)
	defer C.free(unsafe.Pointer(cname))

	handle := C.dlopen(cname, C.RTLD_LAZY)
	if handle == nil {
		errStr := C.GoString(C.dlerror())
		return 0, fmt.Errorf("failed to load library %s: %s", name, errStr)
	}

	libID := fm.nextLibID
	fm.nextLibID++

	fm.libraries[libID] = &LibraryHandle{
		handle: handle,
		name:   name,
	}

	return libID, nil
}

func (fm *FFIManager) GetFunctionPointer(libID uint64, funcName string) (unsafe.Pointer, error) {
	fm.mu.RLock()
	lib, ok := fm.libraries[libID]
	fm.mu.RUnlock()

	if !ok {
		return nil, fmt.Errorf("library handle %d not found", libID)
	}

	cfuncName := C.CString(funcName)
	defer C.free(unsafe.Pointer(cfuncName))

	funcPtr := C.dlsym(lib.handle, cfuncName)
	if funcPtr == nil {
		errStr := C.GoString(C.dlerror())
		return nil, fmt.Errorf("function %s not found: %s", funcName, errStr)
	}

	return funcPtr, nil
}

// Simplified - just returns function pointer for now
func (fm *FFIManager) CallFunction(funcPtr unsafe.Pointer, args []interface{}, returnType FFIType) (interface{}, error) {
	// TODO: Implement actual function calling
	// For now, just return a dummy value based on return type
	switch returnType {
	case FFIInt32:
		return int32(0), nil
	case FFIInt64:
		return int64(0), nil
	case FFIDouble:
		return float64(0.0), nil
	case FFIVoid:
		return nil, nil
	default:
		return nil, fmt.Errorf("unsupported return type")
	}
}

func (fm *FFIManager) UnloadLibrary(libID uint64) error {
	fm.mu.Lock()
	defer fm.mu.Unlock()

	lib, ok := fm.libraries[libID]
	if !ok {
		return fmt.Errorf("library handle %d not found", libID)
	}

	C.dlclose(lib.handle)
	delete(fm.libraries, libID)

	return nil
}

type FFIType int

const (
	FFIVoid FFIType = iota
	FFIInt32
	FFIInt64
	FFIDouble
	FFIPointer
)
