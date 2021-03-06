pro plot475_814_sersic, psout, limag


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=20,ysize=18, scale_factor=0.8;, 
;, SET_FONT="Times-Roman"

list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT


   sdssR1 = r - 0.1837*(g - r) - 0.0971;  sigma = 0.0106
   sdssR2 = r - 0.2936*(r - i) - 0.1439;  sigma = 0.0072
   sdssR=0.5*(sdssR1+sdssR2)


   sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
   sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
   sdssI=0.5*(sdssI1+sdssI2)

num= n_elements(mag814)
Ms_Lg=dblarr(1,num)
Ms_Lr=dblarr(1,num)
Ms_Li=dblarr(1,num)

for j=0, num-1 do begin
a1=-0.221+0.485*(u[j]-g[j])
a2=-0.390+0.417*(u[j]-r[j])
a3=-0.375+0.359*(u[j]-i[j])
a4=-0.400+0.332*(u[j]-z[j])
a5=-0.499+1.519*(g[j]-r[j])
a6=-0.379+0.914*(g[j]-i[j])
a7=-0.367+0.698*(g[j]-z[j])
a8=-0.106+1.982*(r[j]-i[j])
a9=-0.124+1.067*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Lg[j]=median(a)

a1=-0.099+0.345*(u[j]-g[j])
a2=-0.223+0.299*(u[j]-r[j])
a3=-0.212+0.257*(u[j]-i[j])
a4=-0.232+0.239*(u[j]-z[j])
a5=-0.306+1.097*(g[j]-r[j])
a6=-0.220+0.661*(g[j]-i[j])
a7=-0.215+0.508*(g[j]-z[j])
a8=-0.022+1.431*(r[j]-i[j])
a9=-0.041+0.780*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Lr[j]=median(a)


a1=-0.053+0.268*(u[j]-g[j])
a2=-0.151+0.233*(u[j]-r[j])
a3=-0.144+0.201*(u[j]-i[j])
a4=-0.161+0.187*(u[j]-z[j])
a5=-0.222+0.864*(g[j]-r[j])
a6=-0.152+0.518*(g[j]-i[j])
a7=-0.153+0.402*(g[j]-z[j])
a8= 0.006+1.114*(r[j]-i[j])
a9=-0.018+0.623*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Li[j]=median(a)
endfor


re=0.5*(re475+re814)

mu_814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_475=mag475+2.5*alog10(2*3.1415*re475*re475*0.0025)

mu_u=u+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_g=g+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_r=r+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_i=i+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_z=z+2.5*alog10(2*3.1415*re814*re814*0.0025)

B_R=1.506*(g-r)+0.37
Ms_LII=-0.405+0.518*B_R

M_Lu=2*alog10(sigma)+0.4*mu_u-alog10(re814*0.05*0.4)
M_Lg=2*alog10(sigma)+0.4*mu_g-alog10(re814*0.05*0.4)
M_Lr=2*alog10(sigma)+0.4*mu_r-alog10(re814*0.05*0.4)
M_Li=2*alog10(sigma)+0.4*mu_i-alog10(re814*0.05*0.4)
M_Lz=2*alog10(sigma)+0.4*mu_z-alog10(re814*0.05*0.4)

M_L814=2*alog10(sigma)+0.4*mu_814-alog10(re814*0.05*0.4)
M_L475=2*alog10(sigma)+0.4*mu_475-alog10(re814*0.05*0.4)

M=2*alog10(sigma)+alog10(re814*0.05*0.4)

;plot, [0], /nodata, xrange=[1,6], yrange=[5,15]

;oplot, M[0:30], M_L814[0:30]-3, psym=4
;oplot, M[30:num-1], M_L814[30:num-1]-3, psym=2

;oplot, M[0:30], M_L475[0:30], psym=5
;oplot, M[30:num-1], M_L475[30:num-1], psym=6


g_r=g-r
M_Ms=M_Lg-Ms_Lg


mlg30=M_L814[0:30]  ; filter correction
mag814_30=mag814[0:30]

mlg62=M_L814[31:62]       ; filter correction
mlg74=M_L814[63:74]       ; filter correction

mag814_62=mag814[31:62]
mag814_74=mag814[63:74]

print, mag814
mlg300=mlg30(where(mag814_30 gt limag))
mlg620=mlg62(where(mag814_62 gt limag ))
mlg740=mlg74(where(mag814_74 gt limag ))




bbb=alog(ser814)
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]



ccc=alog(ser475)
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]

trend=ltrend(bbb,ccc,bbb/bbb)

xtitl="ln (n!D814!N)  [I-band]"
ytitl="ln (n!D475!N)  [g-band]"
plot,  bbb30, ccc30, psym=2,  xthick=3.,ythick=3., xtitle=xtitl, ytitle=ytitl, yrange=[-0.5,2], xrange=[-0.5,2], xstyle=1, ystyle=1, charsize=1.5
oplot, bbb62, ccc62, psym=4, color=cc[8]
oplot, bbb74, ccc74, psym=5, color=cc[30]

oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [-10,10], linestyle=0, thick=3.

trend=ltrend(ser814,ser475,ser814/ser814)
xyouts, -0.3,1.7, 'n!D814!N=('+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2)+")n!D475!N!M+!X("+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2)+")", color=cc[50], size=1.3
legend, ["Deimos Sample","MG05","Co09"], color=[0,8,30] , psym=[2,4,5], /clear,  charsize=1.1, /right, /bottom

		;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------
	;------------------------------------------------------------------------------





ps_off

end
