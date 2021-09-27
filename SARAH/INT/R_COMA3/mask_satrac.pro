pro mask_satrac, filename, x1,y1,x2,y2, thick=thick, FLAG=flag

print, 'Flag=', flag
print, 'Hakf Thick=', thick

fits_read, filename, image, h
fits_write, 'old.'+filename, image, h

nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

print, 'NAXIS1=', nx
print, 'NAXIS2=', ny

for i=0, nx-1 do begin

 a=1.*(y2-y1)/(x2-x1)
ymax=a*(i-x1+1.)+thick+y1-1
ymin=a*(i-x1+1.)-thick +y1-1
for j=0, ny-1 do begin

  



if j le ymax and j ge ymin  then image[i,j]=flag


endfor
endfor


fits_write, filename, image, h

end