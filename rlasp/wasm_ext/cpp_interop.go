package main

/*
#include <stdlib.h>

// Forward declarations for C++ bridge functions
void* cpp_new_object(const char* class_name);
void cpp_delete_object(void* obj);
void* cpp_call_method(void* obj, const char* method_name, void** args, int arg_count);
void* cpp_get_field(void* obj, const char* field_name);
void cpp_set_field(void* obj, const char* field_name, void* value);
*/
import "C"
import (
	"fmt"
	"sync"
	"unsafe"
)

type CPPObjectHandle struct {
	ptr       unsafe.Pointer
	className string
}

type CPPManager struct {
	mu        sync.RWMutex
	objects   map[uint64]*CPPObjectHandle
	nextObjID uint64
}

var globalCPPManager = &CPPManager{
	objects:   make(map[uint64]*CPPObjectHandle),
	nextObjID: 1,
}

func (cm *CPPManager) NewObject(className string) (uint64, error) {
	cm.mu.Lock()
	defer cm.mu.Unlock()

	cClassName := C.CString(className)
	defer C.free(unsafe.Pointer(cClassName))

	ptr := C.cpp_new_object(cClassName)
	if ptr == nil {
		return 0, fmt.Errorf("failed to create C++ object of class %s", className)
	}

	objID := cm.nextObjID
	cm.nextObjID++

	cm.objects[objID] = &CPPObjectHandle{
		ptr:       ptr,
		className: className,
	}

	return objID, nil
}

func (cm *CPPManager) DeleteObject(objID uint64) error {
	cm.mu.Lock()
	defer cm.mu.Unlock()

	obj, ok := cm.objects[objID]
	if !ok {
		return fmt.Errorf("object handle %d not found", objID)
	}

	C.cpp_delete_object(obj.ptr)
	delete(cm.objects, objID)

	return nil
}

func (cm *CPPManager) CallMethod(objID uint64, methodName string, args []interface{}) (interface{}, error) {
	cm.mu.RLock()
	obj, ok := cm.objects[objID]
	cm.mu.RUnlock()

	if !ok {
		return nil, fmt.Errorf("object handle %d not found", objID)
	}

	cMethodName := C.CString(methodName)
	defer C.free(unsafe.Pointer(cMethodName))

	// TODO: Convert args to C array
	// For now, call with no arguments
	result := C.cpp_call_method(obj.ptr, cMethodName, nil, 0)

	// For now, return the pointer as uint64
	return uint64(uintptr(result)), nil
}

func (cm *CPPManager) GetField(objID uint64, fieldName string) (interface{}, error) {
	cm.mu.RLock()
	obj, ok := cm.objects[objID]
	cm.mu.RUnlock()

	if !ok {
		return nil, fmt.Errorf("object handle %d not found", objID)
	}

	cFieldName := C.CString(fieldName)
	defer C.free(unsafe.Pointer(cFieldName))

	result := C.cpp_get_field(obj.ptr, cFieldName)
	return uint64(uintptr(result)), nil
}

func (cm *CPPManager) SetField(objID uint64, fieldName string, value interface{}) error {
	cm.mu.RLock()
	obj, ok := cm.objects[objID]
	cm.mu.RUnlock()

	if !ok {
		return fmt.Errorf("object handle %d not found", objID)
	}

	cFieldName := C.CString(fieldName)
	defer C.free(unsafe.Pointer(cFieldName))

	// TODO: Convert value to C pointer
	// For now, use NULL
	C.cpp_set_field(obj.ptr, cFieldName, nil)

	return nil
}
