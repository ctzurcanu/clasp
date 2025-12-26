// Auto-generated C++ shims for Vector (manually corrected)
#include "vector.hpp"
#include <cstring>

extern "C" {

void* vector_new(double x, double y) {
    return new Vector(x, y);
}

void vector_delete(void* ptr) {
    delete static_cast<Vector*>(ptr);
}

double vector_getX(void* ptr) {
    return static_cast<Vector*>(ptr)->getX();
}

double vector_getY(void* ptr) {
    return static_cast<Vector*>(ptr)->getY();
}

void vector_setX(void* ptr, double x) {
    static_cast<Vector*>(ptr)->setX(x);
}

void vector_setY(void* ptr, double y) {
    static_cast<Vector*>(ptr)->setY(y);
}

double vector_length(void* ptr) {
    return static_cast<Vector*>(ptr)->length();
}

void* vector_add(void* ptr, void* other) {
    Vector result = static_cast<Vector*>(ptr)->add(*static_cast<Vector*>(other));
    return new Vector(result);
}

} // extern "C"
