pro assoc, filename, ra, dec

l=2000.
readcol, filename, ra0,dec0, FORMAT='D,D'

n=n_elements(ra0)
k=0
for i=0,n-1 do begin
d=(ra-ra0[i])^2+(dec-dec0[i])^2

if d lt l then begin
k=i
l=d
endif

endfor

openw, out, 'temp.tmp', /get_lun
printf, out, k+1,ra0[k],dec0[k],d
close,out
free_lun,out


end
