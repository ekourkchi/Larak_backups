pro mu_e, mag,re,n, pixscale


readcol, 'tmp.isogal.txt', r_gal, mu_gal
readcol, 'tmp.isoser.txt', r_ser, mu_ser

gal_mu0=0.0
i=0
t=-1.0
while(t lt 1.0) do begin
gal_mu0+=mu_gal[i]
t=r_gal[i]
i++
endwhile
gal_mu0/=i


ser_mu0=0.0
i=0
t=-1.0
while(t lt 1.0) do begin
ser_mu0+=mu_ser[i]
t=r_ser[i]
i++
endwhile
ser_mu0/=i



r1=-1.0
r2=0.0
i=0
while r1 lt re do begin
r1=r_gal[i]
i++
endwhile
i-=2
r1=r_gal[i]
r2=r_gal[i+1]
mu_e_gal=(mu_gal[i+1]-mu_gal[i])*(re-r1)/(r2-r1)+mu_gal[i]


r1=-1.0
r2=0.0
i=0
while r1 lt re do begin
r1=r_ser[i]
i++
endwhile
i-=2
r1=r_ser[i]
r2=r_ser[i+1]
mu_e_ser=(mu_ser[i+1]-mu_ser[i])*(re-r1)/(r2-r1)+mu_ser[i]




re=re*pixscale
b= 2*n-1/3.

;print, b

mu_e=mag+5.*alog10(re)+2.5*alog10(2*!pi*n*exp(b)*gamma(2*n)/(b^(2*n)))

;print, 2.5*alog10(2*!pi*n*exp(b)*gamma(2*n)/(b^(2*n)))

;forprint,  n,re,mag,alog10(n),alog10(re),mu,mu_e/(2*!pi*re), text=out
;forprint, n, text='test.dat'

; Mu within effective radius [mu_e]
mu_ee=mag+2.5*alog10(2*!pi*re*re)
mu_0=mu_e-2.5*b/alog(10.)


s=" "
s=s+"  "+strtrim(string(mu_e),2)
s=s+"  "+strtrim(string(mu_0),2)

s=s+"  "+strtrim(string(mu_e_gal),2)
s=s+"  "+strtrim(string(gal_mu0),2)

s=s+"  "+strtrim(string(mu_e_ser),2)
s=s+"  "+strtrim(string(ser_mu0),2)

openw, out, 'temp.tmp', /get_lun
printf, out, s
close,out
free_lun,out

print, "   mu_e    mu_0   mu_e_gal    mu_0_gal   mu_e_ser   mu_0_ser"
print, s



end
