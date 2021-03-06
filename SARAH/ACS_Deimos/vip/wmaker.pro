pro wmaker, listname

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
for n=1,4 do begin
fits_read, '../vip/badmap'+strtrim( string(n),2)+'.fits', badmap, h0


for m=0,nfile-1 do begin
file0=filename[m]
file='cosmic.'+file0+'_'+strtrim( string(n),2)+'.fits'
fits_read, file, image, h


nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')



for i=1, nx do begin

  for j=1, ny do begin



if image[i-1,j-1] gt 0  then image[i-1,j-1]=0 else image[i-1,j-1]=1
image[i-1,j-1]=image[i-1,j-1]*badmap[i-1,j-1]


endfor
endfor


fits_write, 'weight.'+file0+'_'+strtrim( string(n),2)+'.fits', image, h
print, 'weight.'+file0+'_'+strtrim( string(n),2)+'.fits     created ....'
endfor
endfor

end