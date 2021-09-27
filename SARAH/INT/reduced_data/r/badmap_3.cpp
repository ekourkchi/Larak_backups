#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define N 8388609
//#define NAXIS 4096


// Run >>  c++ -o badmap_3.x badmap_3.cpp  -Wno-deprecated



int main(void)
{
int i,j;
double temp,temp1;
FILE  *out,*in;

out=fopen("badmap_3.txt","w");
in=fopen("r_conf_3.dat","r");
//check=fopen("check_4.txt","w");


for(j=1;j<=4096;j++)   // row number
{

	for(i=1;i<=2048;i++)
	{

	if(i==355 && j>=2094) temp=1;
	else if(i==356 && j>=2094) temp=1;
	else if(i==357 && j>=2094) temp=1;
	else if(i==358 && j>=2049) temp=1;
	else if(i==359 && j>=2049) temp=1;
	else if(i==464 && j>=3086) temp=1;
	else if(i==465 && j>=3086) temp=1;
	else if(i==1057 && j>=873 && j<=979) temp=1;
	else if(i==1225 && j>=1) temp=1;
	else if(i==1226 && j>=1693) temp=1;
	else if(i==1227 && j>=1693) temp=1;
	else if(i==1228 && j>=1693) temp=1;
	else if(i==1229 && j>=1693) temp=1;
	else if(i==1230 && j>=1693) temp=1;
	else if(i==1231 && j>=1693) temp=1;
	else if(i==1232 && j>=1693) temp=1;
	else if(i==1233 && j>=1693) temp=1;
	else if(i==1234 && j>=1693) temp=1;
	else if(i==1235 && j>=1693) temp=1;
	else if(i==1242 && j>=2823 && j<=2829) temp=1;
	else if(i==1243 && j>=2823 && j<=2831) temp=1;
	else if(i==1244 && j>=2823) temp=1;
	else if(i==1245 && j>=2823) temp=1;
	else if(i==1246 && j>=2823) temp=1;
	
	else temp=0;
	
	fscanf(in,"%lf",&temp1);
	if(temp1<90) temp1=1.; else temp1=0.;
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
