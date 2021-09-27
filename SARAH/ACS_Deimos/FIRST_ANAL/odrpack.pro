pro odrpack

readcol, 'PLANE' , x,y,z, /SILENT, SKIPLINE = 2
;x=[1.,0,1,2,3,4]
;y=[0.,1,1,2,3,4]
;z=[2.,2,2,2,2,2]

; Orthogonal distance regression
; check e.g. http://mathforum.org/library/drmath/view/63765.html

; Centroid: orthogonal distance
; regression plane goes through it
n=n_elements(x)
data=transpose([[x],[y],[z]])
centroid=total(data,2)/n

data[0,*]-=centroid[0]
data[1,*]-=centroid[1]
data[2,*]-=centroid[2]

SVDC, data, W, U, V

smallest_singularvalue=min(W,ind)
plane_normal=reform(V[ind,*])

print,'Orthogonal distance regression plane'
print,'1. goes through: ',centroid
print,'2. has normal: ',plane_normal



end