pro bmap_ax, filename, out




fits_read, filename,  image, h


nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

print, 'NAXIS1=', nx
print, 'NAXIS2=', ny

for i=1, nx do begin

  for j=1, ny do begin



if image[i-1,j-1] eq 0.  then image[i-1,j-1]=1. else image[i-1,j-1]=0.


endfor
endfor


fits_write, out, image, h

end
