// Test C++ class for manual shim demonstration
#ifndef TEST_CLASS_HPP
#define TEST_CLASS_HPP

#include <string>

class TestClass {
private:
    int value_;
    std::string name_;

public:
    TestClass(int value, const std::string& name)
        : value_(value), name_(name) {}

    int getValue() const { return value_; }
    void setValue(int v) { value_ = v; }

    const std::string& getName() const { return name_; }
    void setName(const std::string& name) { name_ = name; }

    int add(int x) const { return value_ + x; }

    static int multiply(int a, int b) { return a * b; }
};

#endif // TEST_CLASS_HPP
