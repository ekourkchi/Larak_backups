#include "stdlib.h"
#include "stdio.h"
#include "math.h"
//#include "istream.h"
#include "string.h"
#include "stdlib.h"
#include "time.h"
#define N 1000


// Run >>  c++ -o name.x name.cpp  -Wno-deprecated



int main(int argc,char *argv[])
{
int i,j;
FILE *myfile,*output;
int count,cnt=0;
char *string,*astring;
char line[N],line0[N];
char *stptr;


string=argv[1];
astring=argv[2];

printf ("The Input file: \"%s\"\n",string);
printf ("The Output file: \"%s\"\n",astring);


if (!(myfile = fopen(string, "r")))
{
printf("Could not open \"%s\" for reading.\n",string);
exit(EXIT_FAILURE);
}
else
{
output = fopen(astring, "w");
//getline( &astring, 2, myfile );

while (fgets(line,sizeof(line),myfile) != NULL)
{
//printf ("first: \"%s\"\n",line);
strcpy(line0,line);
stptr = line0;
//printf("%c", *(stptr+1));
count=0;
while (*(stptr+count) != '\0')
{ 

//printf("%c",*(stptr+count));
if(cnt != 0)
{
if(*(stptr+count) == ',')
fprintf(output," ");
else
fprintf(output,"%c",*(stptr+count));
}
count++;
}
cnt++;
}
}
fclose(myfile);
fclose(output);


return(0);

}