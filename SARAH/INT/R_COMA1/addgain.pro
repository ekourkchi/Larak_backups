pro addgain, listname, expo

openr, in1, listname, /get_lun
filename=" "
strtemp=""
nfile=1
readf, in1, filename
while not eof(in1) do begin
  nfile++
  readf, in1, strtemp
  filename= [filename, strtemp]
 endwhile
print, 'No. of files:', nfile
for n=2,4 do begin


gain=[1.,1.285,0.965,1.12]
for m=0,nfile-1 do begin
file0=filename[m]
file='weight.'+file0+'_'+strtrim( string(n),2)+'.fits'
fits_read, file, image, h
file000=file0+'_'+strtrim( string(n),2)+'.esncorr.fits'
fits_read, file000, image000, h000

nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')
exposure= sxpar(h,'EXPTIME')
print, 'exposure time=', exposure

temp=fltarr(nx,ny)
print, gain[n-1]
for i=1, nx do begin

  for j=1, ny do begin



if image[i-1,j-1] gt 0  then temp[i-1,j-1]=1. else temp[i-1,j-1]=0.
temp[i-1,j-1]=image000[i-1,j-1]*float(temp[i-1,j-1])*gain[n-1]*expo/exposure
;print, temp[i-1,j-1]

endfor
endfor

fxaddpar,h,'BITPIX','-32'
fxaddpar,h,'GAIN','1.0'
print, 'GAIN= ', sxpar(h,'GAIN')
;help, FLOAT(temp)
fits_write, file0+'_'+strtrim( string(n),2)+'.esncorr2.fits', FLOAT(temp), h
print, file0+'_'+strtrim( string(n),2)+'.esncorr2.fits     created ....'
endfor
endfor

end