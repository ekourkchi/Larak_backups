pro sdss, ID

sexcat=ID+'.cat'
matchcat=ID+'.match'
output=ID+'.sdss1'
output0=ID+'.sdss0'


readcol, sexcat, no, ximage, yimage, wcs1, wcs2, flux, fluxerr, magaut, magauterr
readcol, matchcat, x1, y1, x2, y2, starno, sexcatno


siz=n_elements(sexcatno)
print, n_elements(ximage)

openw, out, output, /get_lun
openw, out0, output0, /get_lun

printf, out0, 'name   ra   dec '

for i=0, siz-1 do begin



s=strtrim(floor(sexcatno[i]),2)+' '
s0=strtrim(floor(sexcatno[i]),2)+' '
s=s+strtrim(ximage[sexcatno[i]-1],2)+' '
s=s+strtrim(yimage[sexcatno[i]-1],2)+' '
s=s+strtrim(wcs1[sexcatno[i]-1],2)+' '
s0=s0+strtrim(wcs1[sexcatno[i]-1],2)+'  '
s=s+strtrim(wcs2[sexcatno[i]-1],2)+' '
s0=s0+strtrim(wcs2[sexcatno[i]-1],2)
s=s+strtrim(magaut[sexcatno[i]-1],2)+' '
s=s+strtrim(magauterr[sexcatno[i]-1],2)

printf, out, s
printf, out0, s0

endfor



close,out
free_lun,out
close,out0
free_lun,out0

end