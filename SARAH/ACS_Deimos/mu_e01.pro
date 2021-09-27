pro mu_e01, mag,re,n, pixscale, mkpsf=mkpsf


re=re*pixscale
b= 2*n-1/3.

;print, b

mu_e=mag+5.*alog10(re)+2.5*alog10(2*!pi*n*exp(b)*gamma(2*n)/(b^(2*n)))

;print, 2.5*alog10(2*!pi*n*exp(b)*gamma(2*n)/(b^(2*n)))

;forprint,  n,re,mag,alog10(n),alog10(re),mu,mu_e/(2*!pi*re), text=out
;forprint, n, text='test.dat'


re=re/pixscale
r=0
while (r lt 4.5*re) do begin
;mu=mu_e+(2.5*b/alog(10.))*(((r/re)^(1./n))-1.)
;print, (r*0.05)^0.25,mu
r++
endwhile

if keyword_set(mkpsf) then begin
image=dblarr(2*r,2*r)
for i=0, 2*r-1 do begin
for j=0, 2*r-1 do begin
r0=sqrt((i-r)^2+(j-r)^2)
mu=mu_e+(2.5*b/alog(10.))*(((r0/re)^(1./n))-1.)
image[i,j]=10^(30-mu)
endfor
endfor



fits_read, 'tiny_09_no92800_psf.fits', psf, h
nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')
sum=0.
for i=0, nx-1 do begin
for j=0, ny-1 do begin
sum=sum+psf[i,j]
;print, psf[i,j]
endfor
endfor
;print, sum
newimage = convol(image,psf/sum)

for i=r, 2*r-1 do begin
;if (newimage[i,r] gt 0. && newimage[r,i] gt 0.) then print, ((i-r)*0.05)^0.25,30.-alog10(sqrt(newimage[i,r]*newimage[r,i]))
if (newimage[i,r] gt 0.) then print, ((i-r)*0.05)^0.25,30.-alog10((newimage[i,r]))

endfor
endif else begin
r=0
while (r lt 4.5*re) do begin
mu=mu_e+(2.5*b/alog(10.))*(((r/re)^(1./n))-1.)
print, (r*0.05)^0.25,mu
r++
endwhile
endelse



s=" "
s=s+"  "+strtrim(string(mu_e),2)


print, s



end
