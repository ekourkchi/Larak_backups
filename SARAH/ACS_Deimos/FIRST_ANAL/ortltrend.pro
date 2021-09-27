function ortltrend, u, v


;u=[1.,5,7,4,7,2,6,8,2,6]
;v=2*u+2





NO=n_elements(u)
N1=n_elements(v)

if NO ne N1 then print, "Error: U and V should have the same dimensions"


;---------------------------------------------------------------------------------
data=transpose([[u],[v]])
centroid=total(data,2)/NO
;print, data
;print, "  "
;print, centroid
data[0,*]-=centroid[0]
data[1,*]-=centroid[1]


SVDC, data, W0, U0, V0 ;w0 contains sigular values, u0 is a unitary matrix, v0 contains corresponding singoular vectors.

smallest_singularvalue=min(W0,ind)  ; returns matrix index
plane_normal=reform(V0[ind,*])


alfa1=-1.0*plane_normal[0]/plane_normal[1]
beta1=centroid[0]*plane_normal[0]/plane_normal[1]+centroid[1]
; Y=alfa*x + beta
;print,'alfa1=',alfa1,'   beta1=',beta1


;print, "  "
;print, "  "
A=data#transpose(data)
TRIRED, A, D, E
TRIQL, D, E, A
;PRINT, "D:", D
;print, A

smallest_singularvalue=min(D,ind)  ; returns matrix index
;print, "smal:", smallest_singularvalue
plane_normal=reform(A[*,ind])
;print, plane_normal





alfa1=-1.0*plane_normal[0]/plane_normal[1]
beta1=centroid[0]*plane_normal[0]/plane_normal[1]+centroid[1]
; Y=alfa*x + beta
;print,'alfa1=',alfa1,'   beta1=',beta1
;print, "  "
;print, "  "
;---------------------------------------------------------------------------------

data=transpose([[v],[u]])
centroid=total(data,2)/NO

data[0,*]-=centroid[0]
data[1,*]-=centroid[1]


SVDC, data, W0, U0, V0 ;w0 contains sigular values, u0 is a unitary matrix, v0 contains corresponding singoular vectors.


;print, w0
smallest_singularvalue=min(W0,ind)  ; returns matrix index
;print,smallest_singularvalue

plane_normal=reform(V0[ind,*])
plane_normal=(V0[ind,*])


alfa2=-1.0*plane_normal[0]/plane_normal[1]
beta2=centroid[0]*plane_normal[0]/plane_normal[1]+centroid[1]
alfa3=1/alfa2
beta3=-1.0*beta2/alfa2
;--------------------------------------------------------------------------------





return, [0.5*(alfa1+alfa3),0.5*(beta1+beta3)]





end



