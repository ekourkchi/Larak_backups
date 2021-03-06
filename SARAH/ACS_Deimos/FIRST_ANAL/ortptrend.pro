function ortptrend, u, v, w




NO=n_elements(u)
N1=n_elements(v)
N2=n_elements(w)

if NO ne N1 then print, "Error: U and V should have the same dimensions"
if N1 ne N2 then print, "Error: V and W should have the same dimensions"



data=transpose([[u],[v],[w]])
centroid=total(data,2)/NO

data[0,*]-=centroid[0]
data[1,*]-=centroid[1]
data[2,*]-=centroid[2]

SVDC, data, W0, U0, V0 ;w0 contains sigular values, u0 is a unitary matrix, v0 contains corresponding singoular vectors.

smallest_singularvalue=min(W0,ind)
plane_normal=reform(V0[ind,*])

;print,'Orthogonal distance regression plane'
;print,'1. goes through: ',centroid    ; u0,v0,w0 the centre of the plane
;print,'2. has normal: ',plane_normal  ; a,b,c

cu0=centroid[0]
cv0=centroid[1]
cw0=centroid[2]

a=plane_normal[0]
b=plane_normal[1]
c=plane_normal[2]


; a(u-u0)+b(v-v0)+c(w-w0)=0
 beta1=-a/c
 beta2=-b/c
 beta3=(a*cu0+b*cv0+c*cw0)/c


answer= [beta1, beta2, beta3]
return, answer


end