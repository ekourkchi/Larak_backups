pro minus,a,b

openw, out, 'temp.tmp', /get_lun


printf,out, 0.5*(b-a)
close,out
free_lun,out



end
