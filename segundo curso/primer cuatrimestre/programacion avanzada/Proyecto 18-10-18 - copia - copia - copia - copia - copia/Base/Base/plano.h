#pragma once
#include "Solido.h"


class Plano : public Solido {
	float a, b, c, d;

public:
	Plano();
	//vn must be normalized
	Plano(Vector3D vn, Vector3D p) :a(vn.getX()), b(vn.getY()), c(vn.getZ()), d(vn*p) {}
	Plano(const Plano &p) :Solido(p), a(p.a), b(p.b), c(p.c), d(p.d) {}
	virtual ~Plano();
	inline float getA() const { return a; }
	inline void setA(float a) { this->a = a; }
	inline float getB() const { return b; }
	inline void setB(float b) { this->b = b; }
	inline float getC() const { return c; }
	inline void setC(float c) { this->c = c; }
	inline float getD() const { return d; }
	inline void setD(float d) { this->d = d; }
	Vector3D getNormal() {
		Vector3D v(a, b, c);
		return v;
	}
};