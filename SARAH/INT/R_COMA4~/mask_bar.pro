pro mask_bar, filename, x1,y1,x2,y2, FLAG=flag

print, flag
fits_read, filename, image, h
fits_write, 'old.'+filename, image, h

nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

print, 'NAXIS1=', nx
print, 'NAXIS2=', ny

for i=0, nx-1 do begin

  for j=0, ny-1 do begin
  if i ge x1-1 and i le x2-1 and j ge y1-1 and j le y2-1 then image[i,j]=flag
endfor
endfor


fits_write, filename, image, h

end