#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "istream.h"
#include "string.h"
#include "stdlib.h"
#include "time.h"
#define N 1000


// Run >>  c++ -o nodot nodot.cpp  -Wno-deprecated



int main(int argc,char *argv[])
{
int i,j;
int count,cnt=0;
char *string,*astring;
char line[N],line0[N];
char *stptr;

//printf("hello");

strcpy(line,argv[1]);

//printf("%s",line);
stptr = line;

count=0;
while (*(stptr+count) != '\0')
{ 

if (*(stptr+count) == '.')
*(stptr+count)='\0';
//printf("%s\n",stptr);


count++;

}

//for(i=0;i<=count-1;i++)
//printf("%s\n",&stptr[i]);

printf("%s\n",stptr);
}