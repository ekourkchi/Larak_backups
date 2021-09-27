#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define N 8388609
//#define NAXIS 4096


// Run >>  c++ -o badmap_new.x badmap_new.cpp  -Wno-deprecated



int main(void)
{
int i,j;
double temp,temp1;
FILE  *out,*in;

out=fopen("badmap_4.txt","w");
in=fopen("r_conf_4.dat","r");
//check=fopen("check_4.txt","w");


for(j=1;j<=4096;j++)   // row number
{

	for(i=1;i<=2048;i++)
	{

	if(i==288 && j>=1009) temp=1;
	else if(i==389 && j>=958) temp=1;
	else if(i==442 && j>=964) temp=1;
	else if(i==462 && j>=1026) temp=1;
	else if(i==463 && j>=966) temp=1;
	else if(i==464 && j>=966) temp=1;
	else if(i==465 && j>=966) temp=1;
	else if(i==466 && j>=966) temp=1;
	else if(i==548 && j>=987) temp=1;
	else if(i==549 && j>=987) temp=1;
	else if(i==558 && j>=987) temp=1;
	else if(i==1585 && j>=655) temp=1;
	else if(i==1590 && j>=655) temp=1;
	else if(i==1736 && j>=2972) temp=1;
	else if(i==1738 && j>=2972) temp=1;
	else if(i==1747 && j>=3825) temp=1;
	else if(i==1748 && j>=1951) temp=1;
	else temp=0;
	
	fscanf(in,"%lf",&temp1);
	if(temp1<1) temp1=1.; else temp1=0.;
	if( (temp+temp1)>=1) 
	fprintf(out,"%lf\n",0.);
	else fprintf(out,"%lf\n",1.);

	
		


	
	}
}







//fclose(check);
fclose(out);
fclose(in);


return(0);

}
