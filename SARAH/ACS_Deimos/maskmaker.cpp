#include <string.h>
#include <stdio.h>
#include "fitsio.h"
#define pi 4*atan(1.)
#include "stdlib.h"
#include "time.h"
#include "math.h"

// o compile this program use:
// c++ -o maskmaker maskmaker.cpp -I/home/ir/R/Desktop/cfitsio -Wno-deprecated -lcfitsio

int main(int argc, char *argv[])
{
    fitsfile *fptr,*outfptr;   /* FITS file pointer, defined in fitsio.h */
    int status = 0;   /* CFITSIO status value MUST be initialized to zero! */
    int bitpix, naxis, ii, anynul;
    long naxes[2] = {1,1}, fpixel[2] = {1,1};
    double *pixels,*outpix;
    char format[20], hdformat[20];
    double x0,y0,A,B,theta,r_kron,no,A0,B0;
    double x,y,X_m,Y_m,check;
    double coef;
    if (argc != 11) {
      printf("\n\n\n\n\nError: Please enter the arguments correctly ... \n");
      printf("This part is not still complete. \nEhsan Kourkchi 29 DEC 2009 \n \n");
      return(0);
    }

x0=atof(argv[3]);
y0=atof(argv[4]);
A=atof(argv[5]);
B=atof(argv[6]);
theta=atof(argv[7]);
r_kron=atof(argv[8]);
no=atof(argv[9]);
coef=atof(argv[10]);
A0=coef*A*r_kron;
B0=coef*B*r_kron;
theta=theta*pi/180.;

    if (!fits_open_file(&fptr, argv[1], READONLY, &status))
    {
        if (!fits_get_img_param(fptr, 2, &bitpix, &naxis, naxes, &status) )
        {
          if (naxis > 2 || naxis == 0 || naxis == 1)
             printf("Error: only 2D images are supported\nMulti extension images are not supported.\n");
          else
          {
		/* create the new empty output file if the above checks are OK */
    		if (!fits_create_file(&outfptr, argv[2], &status) )
		/* copy all the header keywords from first image to new output file */
 		fits_copy_header(fptr, outfptr, &status);
		outpix = (double *) malloc(naxes[0] * sizeof(double)); 
		
            /* get memory for 1 row */
            pixels = (double *) malloc(naxes[0] * sizeof(double));

            if (pixels == NULL) {
                printf("Memory allocation error\n");
                return(1);
            }

            if (bitpix > 0) {  /* set the default output format string */
               strcpy(hdformat, " %7d");
               strcpy(format,   " %7.0f");
            } else {
               strcpy(hdformat, " %15d");
               strcpy(format,   " %15.5f");
            }

     
            for (fpixel[1] = 1; fpixel[1] <= naxes[1] ; fpixel[1]++)
            {
               if (fits_read_pix(fptr, TDOUBLE, fpixel, naxes[0], NULL,
                    pixels, NULL, &status) )  /* read row of pixels */
                  break;  /* jump out of loop on error */

               
               for (ii = 0; ii < naxes[0]; ii++)
               {
               X_m=ii-x0;
               Y_m=fpixel[1]-1-y0;
               x=X_m*cos(theta)+Y_m*sin(theta);
               y=Y_m*cos(theta)-X_m*sin(theta);
               check=(x/A0)*(x/A0)+(y/B0)*(y/B0);
//if (check <=1)
//printf("%lf   %lf %lf \n",check, pixels[ii],no);
               if (check <=1 || pixels[ii]==no)  outpix[ii]=0.;  else outpix[ii]=1.0;
               if (pixels[ii]>0 && pixels[ii]!=no) outpix[ii]=2.0;
               }

               fits_write_pix(outfptr, TDOUBLE, fpixel, naxes[0],outpix, &status); /* write new values to output image */

           //       printf(format, pixels[ii]);   /* print each value  */
               // printf("\n");                    /* terminate line */
            }
            free(pixels);
            free(outpix);
            fits_close_file(outfptr, &status);

          }
        }
        fits_close_file(fptr, &status);
    } 

    if (status) fits_report_error(stderr, status); /* print any error message */
    return(status);
}
