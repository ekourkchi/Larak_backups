pro plane_fit, filename, n, mu_limit

; n is the master column
; input file has 3 comumn for data, in front of each data column its corresponding error shold be displayed. 
; The nth column would be found as a plane function of two others.
; ue,ve,we are errors for u,v,w respectively.
; w= beta1*u+beta2*v+beta3

; First column should be Mu (Surface brightness)

   CASE n OF  
      1: readcol, filename, w,we,u,ue,v,ve, /SILENT
      2: readcol, filename, u,ue,w,we,v,ve, /SILENT
      3: readcol, filename, u,ue,v,ve,w,we, /SILENT
   ENDCASE
;print, n
MO=n_elements(u)
if n eq 1 then begin
index=bsort(w,test)
w= test
we=we(index)
u=u(index)
ue=ue(index)
v=v(index)
ve=ve(index)

i=0
while w[i] lt mu_limit  and i lt MO-1 do begin
NO=i
i++
endwhile
w=w[0:NO]
we=we[0:NO]
u=u[0:NO]
ue=ue[0:NO]
v=v[0:NO]
ve=ve[0:NO]
endif else begin
index=bsort(u,test)
u= test
ue=ue(index)
v=v(index)
ve=ve(index)
w=w(index)
we=we(index)

i=0
while u[i] lt mu_limit and i lt MO-1  do begin
NO=i
i++
endwhile
w=w[0:NO]
we=we[0:NO]
u=u[0:NO]
ue=ue[0:NO]
v=v[0:NO]
ve=ve[0:NO]
endelse

;NO=n_elements(u)
NO++
data=transpose([[u],[v],[w]])
centroid=total(data,2)/NO

data[0,*]-=centroid[0]
data[1,*]-=centroid[1]
data[2,*]-=centroid[2]

SVDC, data, W0, U0, V0 ;w0 contains sigular values, u0 is a unitary matrix, v0 contains corresponding singoular vectors.

smallest_singularvalue=min(W0,ind)
plane_normal=reform(V0[ind,*])

print,'Orthogonal distance regression plane'
print,'1. goes through: ',centroid    ; u0,v0,w0 the centre of the plane
print,'2. has normal: ',plane_normal  ; a,b,c

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


openw, out, 'PLANE', /get_lun
printf, out, NO,2,3,1
printf, out, beta1, beta2, beta3

for i=0, NO-1 do begin

weight_u=0.0
weight_v=0.0
weight_w=0.0

if u[i] ne 0.0 then weight_u=1.-ue[i]/abs(u[i])
if v[i] ne 0.0 then weight_v=1.-ve[i]/abs(v[i])
if w[i] ne 0.0 then weight_w=1.-we[i]/abs(w[i])
if weight_u le 0.0 then weight_u=0.0
if weight_v le 0.0 then weight_v=0.0
if weight_w le 0.0 then weight_w=0.0

s=' '
s+=strtrim(u[i],2)+' '
s+=strtrim(v[i],2)+' '
s+=strtrim(w[i],2)+' '

s+=strtrim(weight_u,2)+' '
s+=strtrim(weight_v,2)+' '
s+=strtrim(weight_w,2)+' '

printf, out, s
endfor


close,out
free_lun,out

end

