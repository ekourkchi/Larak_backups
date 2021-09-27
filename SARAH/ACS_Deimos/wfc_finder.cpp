#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define pi 4*atan(1.)



// Run >>  c++ -o wfc_finder.x wfc_finder.cpp  -Wno-deprecated

int roundToInt(float f) { return (int)((f < 0.0f) ? f - 0.5f : f + 0.5f); }


int main(int argc,char *argv[])
{
int i,j;
double alfa,beta,theta;
double A,B,x,y,x0,y0,x_f,y_f,det;
int x_int,y_int;
FILE  *out,*in;

A=atof(argv[1]);
B=atof(argv[2]);

//printf("A=%lf   B=%lf \n",A,B);

alfa=atan(99./4103.);
beta=atan(227./4100.);
theta=0.5*pi-beta;

det=cos(alfa)*sin(theta)-cos(theta)*sin(alfa);

x=(A*sin(theta)-B*cos(theta))/det;
y=(B*cos(alfa)-A*sin(alfa))/det;

A=4225.;
B=4300.;
x0=(A*sin(theta)-B*cos(theta))/det;
y0=(B*cos(alfa)-A*sin(alfa))/det;
//printf("x=%lf  y=%lf \n",x0,y0);

x_f=(4096./x0)*x;
y_f=(4096./y0)*y;

x_int=roundToInt(x_f);
y_int=roundToInt(y_f);


if (y_int > 2048)
printf("1  %d  %d \n",x_int,y_int-2048);
else
printf("2  %d  %d \n",x_int,y_int);



return(0);
}

