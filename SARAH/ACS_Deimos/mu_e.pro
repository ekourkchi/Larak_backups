pro mu_e, mag,re,n, pixscale


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


print, s



end
