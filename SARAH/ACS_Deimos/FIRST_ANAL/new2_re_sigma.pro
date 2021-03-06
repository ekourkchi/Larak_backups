pro new2_re_sigma, psout


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=25,ysize=20, scale_factor=0.8,xoffset=3.0
;, SET_FONT="Times-Roman"

!y.margin=3.50
!x.margin=8.0


;multiplot,/reset   
;!p.multi=[0,1,3,0,0]

list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'
gradient='gmp.colorgradient.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

readcol, gradient, gmp4, alf, bet, dalf, dbet, FORMAT='I,D,D,D,D',  /SILENT
 



;for mi=0, n_elements(gmp1)-1 do print, gmp1[mi], gmp2[mi], gmp3[i], gmp4[mi]


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

B_R0=0.782*(mag475-mag814)+0.429
;for i=0, n_elements(B_R0)-1 do print, B_R[i], B_R0[i]
emili=B_R-B_R0
print, "stdev", stdev(emili)



Ms_LII=-0.405+0.518*B_R

outlier=where(gmp eq 2877)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3141)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3308)
B_R[outlier]=B_R0[outlier]




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


;============================================
re=0.5*(re475+re814)


B_R=1.506*(g-r)+0.37

B_R0=0.782*(mag475-mag814)+0.429


outlier=where(gmp eq 2877)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3141)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3308)
B_R[outlier]=B_R0[outlier]

Ms_LII=-0.405+0.518*B_R


c2=dblarr(1,1)
c2=1.65
M_dynamics=alog10(c2*c2*(sigma*sigma*1000*1000)*(re*0.05*0.463*3.08568025)/6.67300/1.98892)

M_Ldyn814=-2.5*M_dynamics/(mag814-35.0+2.5*alog10(2.)-4.57)

M_s=((Ms_LII+0.18)-M_Ldyn814)+M_dynamics ; logarithm of stellar mass
Mu_s=M_s-alog10(2*3.1415*re814*re814*0.0025)
;M_s=Mu_s

mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
re814kpc=alog10(re814*0.05*0.463)
logsigma=alog10(sigma)


modgmp=gmp
;modgmp[where(modgmp eq 3471)]=0
modgmp[where(modgmp eq 3098)]=0
modgmp[where(modgmp eq 2510)]=0
modgmp[where(modgmp eq 2516)]=0
modgmp[where(modgmp eq 3254)]=0
modgmp[where(modgmp eq 3068)]=0
modgmp[where(modgmp eq 2489)]=0
modgmp[where(modgmp eq 2922)]=0
modgmp[where(modgmp eq 5364)]=0
modgmp[where(modgmp eq 4135)]=0
modgmp[where(modgmp eq 5102)]=0
modgmp[where(modgmp eq 4381)]=0
modgmp[where(modgmp eq 5365)]=0
modgmp[where(modgmp eq 4215)]=0

modmag=mag814[where(modgmp ne 0)]
;modmu814=mu814[where(modgmp ne 0)]
modmu814=m_s[where(modgmp ne 0)]

modre814kpc=re814kpc[where(modgmp ne 0)]
modlogsigma=logsigma[where(modgmp ne 0)]


ermu814=sqrt((ermag814)^2+(5.*erre814/re814/alog(10))^2)
erre814kpc=erre814/re814/alog(10)
erlogsigma=ersigma/sigma/alog(10)
;============================================

bbb= modlogsigma
ccc= modre814kpc
;ccc=modlogsigma



xtitl="log(!7r!X) [Km s!U-1!N]"
ytitl="log(R!De!N) [kpc]"
		plot,  bbb, ccc, psym=yoursymbol(27,color=cc[50]),  xthick=5.,ythick=5.,   xstyle=1, ystyle=1, charsize=1.8, ytickinterval=0.5, yminor=5 ,  xtickinterval=0.2, xminor=2, ytitle=ytitl, xtitle=xtitl, yrange=[-0.6,0.6], xrange=[1,2.5]

num=5000
xxx=bbb
yyy=ccc
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)
trend=fit

xyouts, 2,-0.3,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 2,-0.4,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 2,-0.50,'CC='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2), size=1.6
;xyouts, 1.1,0.40, 'R!De!N !M?!X M!D*!N!U' +strtrim(string(trend[0], FORMAT='(F6.2)'),2), size=2.0;+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2)



oplot,  [-80,80], trend[0]*[-80,80]+trend[1], linestyle=2, thick=4.
print, "correlation(R_e,Mag):", correlation(mag814-35.0,alog10(re*0.05*0.463))
print, trend[0]*(-2.5)

del=yyy-(trend[0]*xxx+trend[1])
mean=stdev(del^2)
del=sqrt(mean[0])
print, "RMS in terms of Re", del, stdev(yyy-(trend[0]*xxx+trend[1]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ps_off

end
