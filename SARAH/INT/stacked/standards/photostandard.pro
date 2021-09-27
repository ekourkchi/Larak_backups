pro photostandard, ID, stdfile

sexcat=ID+'.cat'
matchcat=ID+'.match'
;output=ID+'.sdss1'
;output0=ID+'.sdss0'


readcol, sexcat, no, ximage, yimage, wcs1, wcs2, flux, fluxerr, magaut, magauterr, SKIPLINE=9, format='F,D,D,D,D,D,D,D,D', /SILENT
readcol, matchcat, x1, y1, x2, y2, starno, sexcatno, SKIPLINE=15, FORMAT='D,D,D,D,F,F', /SILENT
readcol, stdfile, strid, stwcs1, stwcs2, stR, sterrR, FORMAT='A,D,D,D,D', /SILENT

siz=n_elements(sexcatno)
;print, n_elements(ximage)

;print, 'no. of stars=', siz
;print, x1[0],y1[0],no[0],ximage[0],yimage[0]
;openw, out, output, /get_lun
;openw, out0, output0, /get_lun

;printf, out0, 'name   ra   dec '
ch=0
for i=0, siz-1 do begin
s=' '
s+=strtrim( strid[starno[i]-1],2)+'  '
s+=strtrim( magaut[sexcatno[i]-10],2)+'  '
s+=strtrim( magauterr[sexcatno[i]-10],2)+'  '
s+=strtrim( stR[starno[i]-1],2)+'  '
s+=strtrim( sterrR[starno[i]-1],2)+'  '
s+=strtrim( wcs1[sexcatno[i]-10],2)+'  '
s+=strtrim( wcs2[sexcatno[i]-10],2)+'  '
s+=strtrim( stwcs1[starno[i]-1],2)+'  '
s+=strtrim( stwcs2[starno[i]-1],2)+'  '
s+=strtrim( magaut[sexcatno[i]-10]-stR[starno[i]-1] ,2)

del0=magaut[sexcatno[i]-10]-stR[starno[i]-1]
if ch eq 0 then del=del0 
if ch ne 0 then del=[del,del0]

ch++

;print, s

endfor

u=bsort(del,del)
t=3
delnew=del[t:ch-1-t]


std=stdev(delnew)
print, 'ID: ', ID, '  median= '+strtrim(string(median(delnew),format='(f7.2)'),2), '  mean= '+strtrim(string(std[0],format='(f7.2)'),2), '  stdev= '+strtrim(string(std[1],format='(f7.2)'),2), '  # of stars= '+strtrim(n_elements(delnew),2)

;close,out
;free_lun,out
;close,out0
;free_lun,out0

end