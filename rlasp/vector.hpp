// Vector class for codegen test
#ifndef VECTOR_HPP
#define VECTOR_HPP

#include <cmath>

class Vector {
private:
    double x_, y_;

public:
    Vector(double x, double y) : x_(x), y_(y) {}

    double getX() const { return x_; }
    double getY() const { return y_; }

    void setX(double x) { x_ = x; }
    void setY(double y) { y_ = y; }

    double length() const {
        return std::sqrt(x_ * x_ + y_ * y_);
    }

    Vector add(const Vector& other) const {
        return Vector(x_ + other.x_, y_ + other.y_);
    }
};

#endif // VECTOR_HPP
