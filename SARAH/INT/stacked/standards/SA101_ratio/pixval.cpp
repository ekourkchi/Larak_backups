#include <string.h>
#include <stdio.h>
#include "fitsio.h"
#define pi 4*atan(1.)
#include "stdlib.h"
#include "time.h"
#include "math.h"

// o compile this program use:
// c++ -o pixval pixval.cpp -I/home/ir/R/Desktop/cfitsio -Wno-deprecated -lcfitsio

int main(int argc, char *argv[])
{
    fitsfile *fptr,*outfptr;   /* FITS file pointer, defined in fitsio.h */
    int status = 0;   /* CFITSIO status value MUST be initialized to zero! */
    int bitpix, naxis, ii, anynul, jj;
    long naxes[2] = {1,1}, fpixel[2] = {1,1};
    double *pixels,*outpix;
    char format[20], hdformat[20];
    double x0,y0,A,B,theta,r_kron,no,A0,B0;
    double x,y,X_m,Y_m,check;
    double coef;
    if (argc != 4) {
      printf("\n\n\n\n\nError: Please enter the arguments correctly ... \n");
      printf("This part is not still complete. \nEhsan Kourkchi 3 Jan 2010 \n \n");
      return(0);
    }

ii=atoi(argv[2]);
fpixel[1]=long (atoi(argv[3]));



    if (!fits_open_file(&fptr, argv[1], READONLY, &status))
    {
        if (!fits_get_img_param(fptr, 2, &bitpix, &naxis, naxes, &status) )
        {
          if (naxis > 2 || naxis == 0 || naxis == 1)
             printf("Error: only 2D images are supported\nMulti extension images are not supported.\n");
          else
          {


	if (ii<naxes[0] && ii>0 &&  fpixel[1]>0 &&  fpixel[1]<naxes[1]){ 
            pixels = (double *) malloc(naxes[0] * sizeof(double));

            if (pixels == NULL) {
                printf("Memory allocation error\n");
                return(1);
            }

          

     
           // for (fpixel[1] = 1; fpixel[1] <= naxes[1] ; fpixel[1]++)
           
               fits_read_pix(fptr, TDOUBLE, fpixel, naxes[0], NULL,
                    pixels, NULL, &status);  /* read row of pixels */
                 

               
           //    for (ii = 0; ii < naxes[0]; ii++)
               
printf("%lf\n",pixels[ii]);
              
               

            
            free(pixels);
            

          } else printf("0.000\n"); }
        }
        fits_close_file(fptr, &status);
    } 

    if (status) fits_report_error(stderr, status); /* print any error message */
    return(status);
}
