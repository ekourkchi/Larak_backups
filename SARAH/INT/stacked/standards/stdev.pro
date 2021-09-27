function stdev, array
compile_opt idl2, hidden

siz=n_elements(array)

sum=0.
sum2=0.

for i=0, siz-1 do begin
sum+=array[i]
sum2+=array[i]*array[i]
endfor


mean=sum/siz
stddev=sqrt(sum2/siz-mean*mean)
result=[mean,stddev]


return, result



end


