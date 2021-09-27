#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "iostream.h"
#include "stdlib.h"
#include "time.h"
#define N 8388609
//#define NAXIS 4096


// Run >>  c++ -o badmap.x badmap.cpp  -Wno-deprecated

int main(void)
{
int i,j;
double pixval,temp;
FILE *data, *out;
data=fopen("r_conf_4.dat","r");
out=fopen("result_test_4.txt","w");
for(i=1;i<N;i++)
//for(i=1;i<=4096;i++)
//for(j=1;j<=2048;j++)

{
fscanf(data,"%lf",&pixval);

if(pixval<=90) temp=0;
if(pixval==0) temp=1;
else temp=1;
//if(j>2045) temp=1;


fprintf(out,"%lf\n",temp);
}
fclose(data);
fclose(out);

return(0);

}
