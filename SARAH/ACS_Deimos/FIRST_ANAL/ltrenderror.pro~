function ltrenderror, u, v, uerr, verr, treshlop, treshcept, minitration

;treshlop=1
;treshcept=1
;minitration=500
;v=sin(findgen(10))
;u=8*v+1
;uerr=0.1*u+0.000001
;verr=0.1*v+0.000001
;print, uerr
;print, verr

NO=n_elements(u)
N1=n_elements(v)

if NO ne N1 then print, "Error: U and V should have the same dimensions"
x=dblarr(NO,1)
y=dblarr(NO,1)

fit=ltrend(u,v,verr)
slop=fit[0]
intercept=fit[1]
print, slop, intercept

seed=10.
alfa=0.
beta=0.
j=1
bool=1
while bool eq 1 do begin
seed=seed+2*j+50000
for i=0, NO-1  do begin
x[i]=1.0*u[i]+uerr[i]*randomn(seed+i,1,1)
y[i]=1.0*v[i]+verr[i]*randomn(seed+i+1000,1,1)
endfor
fit=ltrend(1.0*x,1.0*y,1.0*y/y)
a=fit[0]
b=fit[1]
alfa=[alfa,a]
beta=[beta,b]

m=alfa[1:n_elements(alfa)-1]
n=beta[1:n_elements(beta)-1]
m=stdev(m)
n=stdev(n)
m=m[0]
n=n[0]
if abs(m-slop) lt treshlop*abs(slop) and abs(n-intercept) lt treshcept*abs(intercept) and j gt minitration then bool=0
j++
;print, j, abs(m-slop), treshlop*abs(slop), abs(n-intercept), treshcept*abs(intercept)
;print, j, m, n, slop, intercept
endwhile

alfa=alfa[1:n_elements(alfa)-1]
beta=beta[1:n_elements(beta)-1]


alfa=stdev(alfa)
beta=stdev(beta)


c=alfa[0]
d=beta[0]
da10=alfa[1]/c/c
da00=(sqrt((c*beta[1])^2+(d*alfa[1])^2))/c/c

answer=[alfa[0], beta[0], alfa[1], beta[1],1/c,-d/c,da10,da00]

;print, answer
return, answer


end 



