//#pragma once es la version moderna de idndef
#ifndef VECTOR3D
#define VECTOR3D

//#include <GL/glut.h>
//#include "solido.h"

class Vector3D {
private:
	double x, y, z;
public:
	Vector3D() : x(0), y(0),z(0) {}
	Vector3D(double x, double y, double z) :x(x),y(y),z(z) {}
	double getX();
	void setX(double d);
	double getY();
	void setY(double d);
	double getZ();
	void setZ(double d);
	Vector3D operator+(Vector3D a);
	Vector3D operator*(double a);
	double operator*(Vector3D v);//Volvemos a usar *, dependiendo del tipo de argumento entrar� en una funci�n u otra


};
#endif VECTOR3D