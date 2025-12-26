// Manual C shims for TestClass
#include "test_class.hpp"
#include <cstring>

extern "C" {

// Constructor wrapper
void* test_class_new(int value, const char* name) {
    return new TestClass(value, std::string(name));
}

// Destructor wrapper
void test_class_delete(void* ptr) {
    delete static_cast<TestClass*>(ptr);
}

// getValue wrapper
int test_class_get_value(void* ptr) {
    return static_cast<TestClass*>(ptr)->getValue();
}

// setValue wrapper
void test_class_set_value(void* ptr, int value) {
    static_cast<TestClass*>(ptr)->setValue(value);
}

// getName wrapper (returns pointer to internal string)
const char* test_class_get_name(void* ptr) {
    return static_cast<TestClass*>(ptr)->getName().c_str();
}

// setName wrapper
void test_class_set_name(void* ptr, const char* name) {
    static_cast<TestClass*>(ptr)->setName(std::string(name));
}

// add method wrapper
int test_class_add(void* ptr, int x) {
    return static_cast<TestClass*>(ptr)->add(x);
}

// Static method wrapper
int test_class_multiply(int a, int b) {
    return TestClass::multiply(a, b);
}

} // extern "C"
