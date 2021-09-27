function ortptrenderror, u, v, w, ue, ve, we, itration


NO=n_elements(u)
N1=n_elements(v)
N2=n_elements(w)

if NO ne N1 then print, "Error: U and V should have the same dimensions"
if N1 ne N2 then print, "Error: V and W should have the same dimensions"


x=dblarr(NO,1)
y=dblarr(NO,1)
z=dblarr(NO,1)

fit=ortptrend(u,v,w)
p=fit[0]
q=fit[1]
t=fit[2]


seed=10.
alfa=0.
beta=0.
gama=0.
j=1
bool=1
while bool eq 1 do begin
seed=seed+2*j+50000
for i=0, NO-1  do begin
x[i]=1.0*u[i]+ue[i]*randomn(seed+i,1,1)
y[i]=1.0*v[i]+ve[i]*randomn(seed+i+1000,1,1)
z[i]=1.0*w[i]+we[i]*randomn(seed+i+2000,1,1)

endfor
fit=ortptrend(x,y,z)
a=fit[0]
b=fit[1]
c=fit[2]
alfa=[alfa,a]
beta=[beta,b]
gama=[gama,c]

m=alfa[1:n_elements(alfa)-1]
n=beta[1:n_elements(beta)-1]
o=gama[1:n_elements(gama)-1]
;m=stdev(m)
;n=stdev(n)
;m=m[0]
;n=n[0]
;if abs(m-slop) lt treshlop*abs(slop) and abs(n-intercept) lt treshcept*abs(intercept) and j gt minitration then bool=0

if  j gt itration then bool=0
j++
endwhile

alfa=alfa[1:n_elements(alfa)-1]
beta=beta[1:n_elements(beta)-1]
gama=gama[1:n_elements(gama)-1]

;print,alfa
;print,beta

;print, "  "
;print, stdev(alfa)
;print,stdev(beta)
;print, "  "
;print, ortltrend(u,v)
;print, j

alfa=stdev(alfa)
beta=stdev(beta)
gama=stdev(gama)


answer=[alfa[0], beta[0], gama[0], alfa[1], beta[1], gama[1]]



return, answer


end

