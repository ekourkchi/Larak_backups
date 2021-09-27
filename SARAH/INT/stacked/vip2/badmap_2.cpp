#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define N 8388609
//#define NAXIS 4096


// Run >>  c++ -o badmap_2.x badmap_2.cpp  -Wno-deprecated



int main(void)
{
int i,j;
double temp,temp1;
FILE  *out,*in;

out=fopen("badmap_2.txt","w");
in=fopen("r_conf_2.dat","r");
//check=fopen("check_4.txt","w");


for(j=1;j<=4096;j++)   // row number
{

	for(i=1;i<=2048;i++)
	{

	if(i==838 && j>=1339) temp=1;
	else if(i==1143 && j>=2254) temp=1;
	else if(i==839 && j==1340) temp=1;
	else if(i==840 && j==1340) temp=1;
	else if(i==841 && j==1340) temp=1;
	
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
