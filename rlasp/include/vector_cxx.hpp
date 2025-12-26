#pragma once

#include "../vector.hpp"
#include <memory>

// cxx-compatible wrapper around Vector
// cxx requires specific patterns for memory management

inline std::unique_ptr<Vector> make_vector(double x, double y) {
    return std::make_unique<Vector>(x, y);
}

// Wrapper methods that match cxx expectations
inline double getX(const Vector& v) { return v.getX(); }
inline double getY(const Vector& v) { return v.getY(); }
inline void setX(Vector& v, double x) { v.setX(x); }
inline void setY(Vector& v, double y) { v.setY(y); }
inline double length(const Vector& v) { return v.length(); }
inline std::unique_ptr<Vector> add(const Vector& v, const Vector& other) {
    Vector result = v.add(other);
    return std::make_unique<Vector>(result);
}
