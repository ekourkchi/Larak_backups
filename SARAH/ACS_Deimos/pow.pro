pro pow, n

openw, out, 'temp.tmp', /get_lun
printf, out, 10^n
close,out
free_lun,out

end