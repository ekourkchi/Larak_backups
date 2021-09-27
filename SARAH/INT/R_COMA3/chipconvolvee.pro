pro chipconvolvee, listname, no,   sigma , from , to

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

fits_read, '../vip/badmap'+strtrim(string(no),2)+'.fits', badmap, h0
print, 'badmap is read ....', '../vip/badmap'+strtrim(string(no),2)+'.fits   ......'
; for m=0,nfile-1 do begin

for m=from-1,to-1 do begin
file0=filename[m]


original=file0+'_'+strtrim(string(no),2)+'.fits'
fits_read, original, originalimage, h

objects=file0+'_'+strtrim(string(no),2)+'.objects.fits'
fits_read, objects, objectsimage, h0

sexback=file0+'_'+strtrim(string(no),2)+'.sexback.fits'
fits_read, sexback, sexbackimage, h0

print, 'compiling ....', file0+'_'+strtrim(string(no),2)+'.fits'
nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

print, 'NAXIS1=', nx
print, 'NAXIS2=', ny

residual=originalimage-objectsimage
residualmedian=median(residual)

for i=0, nx-1 do begin
for j=0, ny-1 do begin

  
if  badmap[i,j] eq 0. then residual[i,j]=residualmedian


endfor
endfor

lsf = psf_Gaussian(NPIXEL=8*sigma, ST_DEV=sigma, /NORM, NDIM=2)
 newresidual = convol(residual,lsf)

for i=0, nx-1 do begin
for j=0, ny-1 do begin

  
if  newresidual[i,j] eq 0. then newresidual[i,j]=sexbackimage[i,j]


endfor
endfor

esncorr=originalimage-newresidual   ; ehsan image corrected


fits_write, file0+'_'+strtrim(string(no),2)+'.esncorr.fits' , esncorr, h
fits_write, file0+'_'+strtrim(string(no),2)+'.esnback.fits' , newresidual, h

print, file0+'_'+strtrim(string(no),2)+'.esncorr.fits   created .....'
endfor
end
