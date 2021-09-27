#include <string.h>
#include <stdio.h>
#include "fitsio.h"
#define pi 4*atan(1.)
#include "stdlib.h"
#include "time.h"
#include "math.h"

// o compile this program use:
// c++ -o asymetry_galfit asymetry_galfit.cpp -I/home/ir/R/Desktop/cfitsio -Wno-deprecated -lcfitsio

int main(int argc, char *argv[])
{
    fitsfile *fptr1,*fptr2,*outfptr;   /* FITS file pointer, defined in fitsio.h */
    int status = 0;   /* CFITSIO status value MUST be initialized to zero! */
    int bitpix, naxis, ii, anynul;
    long naxes[2] = {1,1}, fpixel[2] = {1,1},fpixel_new[2] = {1,1};
    double *pixels,*outpix,*badpixels,a1pixels,a2pixels,a3pixels,a4pixels,a1badpixels,a2badpixels,a3badpixels,a4badpixels,apixels,abadpixels;
    char format[20], hdformat[20];
    double x0,y0,A,B,theta,theta0,r_kron,no,A0,B0;
    double x,y,X_m,Y_m,check,d1,d2,d3,d4;
    double alfa,alfa01,X_new,Y_new,R;
    double coef,image,residu,sum02=0,sum12=0,sum01=0,sum11=0;
    if (argc != 13) {
      printf("\n\n\n\n\nError: Please enter the arguments correctly ... \n");
      printf("This part is not still complete. \nEhsan Kourkchi 30 Jan 2010 \n \n");
      return(0);
    }

x0=atof(argv[4]);
y0=atof(argv[5]);
A=atof(argv[6]);
B=atof(argv[7]);
theta=atof(argv[8]);
r_kron=atof(argv[9]);
coef=atof(argv[10]);
image=atof(argv[11]);
residu=atof(argv[12]);
A0=coef*A*r_kron;
B0=coef*B*r_kron;
theta=theta*pi/180.;

    if (!fits_open_file(&fptr1, argv[1], READONLY, &status) && !fits_open_file(&fptr2, argv[2], READONLY, &status))
    {
        if (!fits_get_img_param(fptr1, 2, &bitpix, &naxis, naxes, &status) )
        {
          if (naxis > 2 || naxis == 0 || naxis == 1)
             printf("Error: only 2D images are supported\nMulti extension images are not supported.\n");
          else
          {
		/* create the new empty output file if the above checks are OK */
    		if (!fits_create_file(&outfptr, argv[3], &status) )
		/* copy all the header keywords from first image to new output file */
 		fits_copy_header(fptr1, outfptr, &status);
		outpix = (double *) malloc(1 * sizeof(double)); 
		
            /* get memory for 1 row */
            pixels = (double *) malloc(1 * sizeof(double));
            badpixels = (double *) malloc(1 * sizeof(double));

            if (pixels == NULL) {
                printf("Memory allocation error\n");
                return(1);
            }

            if (badpixels == NULL) {
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


               
               for (ii = 0; ii < naxes[0]; ii++)
               {
		fpixel[0]=ii+1;


               X_m=ii-x0;
               Y_m=fpixel[1]-1-y0;
	       x=X_m*cos(theta)+Y_m*sin(theta);
               y=Y_m*cos(theta)-X_m*sin(theta);
               check=(x/A0)*(x/A0)+(y/B0)*(y/B0);

if (X_m !=0 ) alfa=atan(Y_m/X_m); else if (Y_m >=0 ) alfa=pi/2.0; else alfa=-1.0*pi/2.0;
if (X_m < 0 ) alfa+=pi;

if (image==1)
theta0=theta+pi/2.0;
if (image==2)
theta0=theta;

R=sqrt(X_m*X_m+Y_m*Y_m);
alfa01=2.*theta0-alfa;

if (image==3)
alfa01=alfa-pi;


if (image==0)
alfa01=alfa;

X_new=R*cos(alfa01);
Y_new=R*sin(alfa01);


//if (check <=1)
//printf("%lf   %lf \n",check, pixels[ii]);

						if (check <=1)  
						{
						fpixel_new[0]=floor(X_new+x0+1.0);
						fpixel_new[1]=floor(Y_new+y0+1.0);
						d1=sqrt((fpixel_new[0]-floor(X_new+x0+1.0))*(fpixel_new[0]-floor(X_new+x0+1.0))+(fpixel_new[1]-floor(Y_new+y0+1.0))*(fpixel_new[1]-floor(Y_new+y0+1.0)));
						if (fits_read_pix(fptr1, TDOUBLE, fpixel_new, 1, NULL,
						&a1pixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						if (fits_read_pix(fptr2, TDOUBLE, fpixel_new, 1, NULL,
						&a1badpixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						
						
						fpixel_new[0]=ceil(X_new+x0+1.0);
						fpixel_new[1]=ceil(Y_new+y0+1.0);
						d2=sqrt((fpixel_new[0]-ceil(X_new+x0+1.0))*(fpixel_new[0]-ceil(X_new+x0+1.0))+(fpixel_new[1]-ceil(Y_new+y0+1.0))*(fpixel_new[1]-ceil(Y_new+y0+1.0)));
						if (fits_read_pix(fptr1, TDOUBLE, fpixel_new, 1, NULL,
						&a2pixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						if (fits_read_pix(fptr2, TDOUBLE, fpixel_new, 1, NULL,
						&a2badpixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */

						fpixel_new[0]=floor(X_new+x0+1.0);
						fpixel_new[1]=ceil(Y_new+y0+1.0);
						d3=sqrt((fpixel_new[0]-floor(X_new+x0+1.0))*(fpixel_new[0]-floor(X_new+x0+1.0))+(fpixel_new[1]-ceil(Y_new+y0+1.0))*(fpixel_new[1]-ceil(Y_new+y0+1.0)));
						if (fits_read_pix(fptr1, TDOUBLE, fpixel_new, 1, NULL,
						&a3pixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						if (fits_read_pix(fptr2, TDOUBLE, fpixel_new, 1, NULL,
						&a3badpixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */

						fpixel_new[0]=ceil(X_new+x0+1.0);
						fpixel_new[1]=floor(Y_new+y0+1.0);
						d4=sqrt((fpixel_new[0]-ceil(X_new+x0+1.0))*(fpixel_new[0]-ceil(X_new+x0+1.0))+(fpixel_new[1]-floor(Y_new+y0+1.0))*(fpixel_new[1]-floor(Y_new+y0+1.0)));
						if (fits_read_pix(fptr1, TDOUBLE, fpixel_new, 1, NULL,
						&a4pixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						if (fits_read_pix(fptr2, TDOUBLE, fpixel_new, 1, NULL,
						&a4badpixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */

				*badpixels=a1badpixels+a2badpixels+a3badpixels+a4badpixels;
				if(d1!=0 && d2!=0 && d3!=0 && d4!=0)
				*pixels=(a1pixels/d1+a2pixels/d2+a3pixels/d3+a4pixels/d4)/(1./d1+1./d2+1./d3+1./d4);
				else if (d1==0)  *pixels=a1pixels;
				else if (d2==0)  *pixels=a2pixels;
				else if (d3==0)  *pixels=a3pixels;
				else    *pixels=a4pixels;

						
						if (fits_read_pix(fptr1, TDOUBLE, fpixel, 1, NULL,
						&apixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */
						if (fits_read_pix(fptr2, TDOUBLE, fpixel, 1, NULL,
						&abadpixels, NULL, &status) )  /* read row of pixels */
						break;  /* jump out of loop on error */

	
					}




               if (*badpixels == 0 && check <=1 && abadpixels==0.)  {{if (residu==1) {*outpix=apixels-*pixels; 

		} else  *outpix=*pixels;} 

		sum02+=(apixels)*(apixels);
		sum12++;
		sum01+=fabs(apixels);
		sum11++;
		} else *outpix=0.0;

            //   if (pixels[ii]>0 && pixels[ii]!=no) outpix[ii]=2.0;
		if (*badpixels == 0 && check <=1)
               fits_write_pix(outfptr, TDOUBLE, fpixel, 1,outpix, &status); /* write new values to output image */

               }


           //       printf(format, pixels[ii]);   /* print each value  */
               // printf("\n");                    /* terminate line */
            }
            free(pixels);
            free(outpix);
            fits_close_file(outfptr, &status);

          }
        }
        fits_close_file(fptr1, &status);
        fits_close_file(fptr2, &status);

    } 
sum02=sum02/sum12/sum12;
sum01=sum01/sum11;
//printf("A_rms=%lf \n",sum02);
//printf("A_abs=%lf \n",sum01);
printf("%lf  %lf \n",sum02,sum01);
    if (status) fits_report_error(stderr, status); /* print any error message */
    return(status);
}
