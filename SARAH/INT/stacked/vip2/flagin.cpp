#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define N 8388609
//#define NAXIS 4096


// Run >>  c++ -o badmap_1.x badmap_1.cpp  -Wno-deprecated



int main(void)
{
int i,j;
int temp,temp1;
FILE  *out,*in;

out=fopen("flagin.txt","w");
//in=fopen("r_conf_1.dat","r");
//check=fopen("check_4.txt","w");


for(j=1;j<=4096;j++)   // row number
{

	for(i=1;i<=2048;i++)
	{

	
	fprintf(out,"%d\n",0);
	

	
		


	
	}
}







//fclose(check);
fclose(out);
//fclose(in);


return(0);

}
