pro plot475_814, psout, limag


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=18,ysize=50, scale_factor=0.8;, 
;, SET_FONT="Times-Roman"

list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'
gradient='gmp.colorgradient.txt'
galfit='galfit_allfit_814.txt'


readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

readcol, gradient, gmp4, alf, bet, dalf, dbet, FORMAT='I,D,D,D,D',  /SILENT
 
readcol, galfit, gmp5, resex, re10, re12, re20, re25, re30, n10, n12, n20, n25, n30, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D',  /SILENT



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
Ms_LII=-0.405+0.518*B_R

M_Lu=2*alog10(sigma)+0.4*mu_u-alog10(re814*0.05*0.4)
M_Lg=2*alog10(sigma)+0.4*mu_g-alog10(re814*0.05*0.4)
M_Lr=2*alog10(sigma)+0.4*mu_r-alog10(re814*0.05*0.4)
M_Li=2*alog10(sigma)+0.4*mu_i-alog10(re814*0.05*0.4)
M_Lz=2*alog10(sigma)+0.4*mu_z-alog10(re814*0.05*0.4)

M_L814=2*alog10(sigma)+0.4*mu_814-alog10(re814*0.05*0.4)
M_L475=2*alog10(sigma)+0.4*mu_475-alog10(re814*0.05*0.4)

M=2*alog10(sigma)+alog10(re814*0.05*0.4)



g_r=g-r
M_Ms=M_Lg-Ms_Lg


mlg30=M_L814[0:30]  ; filter correction
mag814_30=mag814[0:30]

mlg62=M_L814[31:62]       ; filter correction
mlg74=M_L814[63:74]       ; filter correction

mag814_62=mag814[31:62]
mag814_74=mag814[63:74]

;print, mag814
mlg300=mlg30(where(mag814_30 gt limag))
mlg620=mlg62(where(mag814_62 gt limag ))
mlg740=mlg74(where(mag814_74 gt limag ))


fp=3.2045*aLOG10(re814*0.05*0.4)-3.8196*aLOG10(sigma)+26.8134
delta=mu_814-3.32749*aLOG10(re814*0.05*0.4)+4.14873*aLOG10(sigma)-27.5066

delta0=delta(where(mag814 gt limag))

del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]





del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag))



;------------------------------------------------------------------------------
mlg=[mlg300,mlg620,mlg740]
del=[del300,del620,del740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=mlg
y=del
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


a1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
a0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

da1=sqrt(s/(S*Sx2-Sx*Sx))
da0=sqrt(Sx2/(S*Sx2-Sx*Sx))



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

aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]
;------------------------------------------------------------------------------
multiplot, /reset
!p.multi=[0,1,5,0,0]
;------------------------------------------------------------------------------
multiplot

bbb=alog10(Resex*0.05)
;xtitl="log(R!De!N) - arcsec [R!De!N SExtractor] "
ccc=alog10(Re10*0.05)
ytitl="log(R!De!N) - M!DSize!N=1.0 [R!DKron!N]"



fit=ltrend(bbb,ccc,ccc/ccc)
b1=fit[0]
b0=fit[1]

		plot,  [0], /nodata,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, charsize=1.3, yrange=[-0.2,3.5], xrange=[-0.2,1]
		oplot,bbb, ccc, psym=4,color=cc[30]
		oplot, [-10,10], [-10,10], linestyle=1, thick=4, color=cc[0]

rms=sqrt(mean((bbb-ccc)^2))
xyouts, 0.7,0.2,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
multiplot

bbb=alog10(Resex*0.05)
;xtitl="log(R!De!N) - arcsec [R!De!N SExtractor] "
ccc=alog10(Re12*0.05)
ytitl="log(R!De!N) - M!DSize!N=1.2 [R!DKron!N]"



fit=ltrend(bbb,ccc,ccc/ccc)
b1=fit[0]
b0=fit[1]

		plot,  [0], /nodata,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, charsize=1.3, yrange=[-0.2,3.5], xrange=[-0.2,1]
		oplot,bbb, ccc, psym=4,color=cc[30]
		oplot, [-10,10], [-10,10], linestyle=1, thick=4, color=cc[0]
rms=sqrt(mean((bbb-ccc)^2))
xyouts, 0.7,0.2,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
multiplot

bbb=alog10(Resex*0.05)
;xtitl="log(R!De!N) - arcsec [R!De!N SExtractor] "
ccc=alog10(Re20*0.05)
ytitl="log(R!De!N) - M!DSize!N=2.0 [R!DKron!N]"



fit=ltrend(bbb,ccc,ccc/ccc)
b1=fit[0]
b0=fit[1]

		plot,  [0], /nodata,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, charsize=1.3, yrange=[-0.2,1.8], xrange=[-0.2,1]
		oplot,bbb, ccc, psym=4,color=cc[30]
		oplot, [-10,10], [-10,10], linestyle=1, thick=4, color=cc[0]
rms=sqrt(mean((bbb-ccc)^2))
xyouts, 0.7,0.2,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
multiplot

bbb=alog10(Resex*0.05)
;xtitl="log(R!De!N) - arcsec [R!De!N SExtractor] "
ccc=alog10(Re25*0.05)
ytitl="log(R!De!N) - M!DSize!N=2.5 [R!DKron!N]"



fit=ltrend(bbb,ccc,ccc/ccc)
b1=fit[0]
b0=fit[1]

		plot,  [0], /nodata,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, charsize=1.3, yrange=[-0.2,1.8], xrange=[-0.2,1]
		oplot,bbb, ccc, psym=4,color=cc[30]
		oplot, [-10,10], [-10,10], linestyle=1, thick=4, color=cc[0]
rms=sqrt(mean((bbb-ccc)^2))
xyouts, 0.7,0.2,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
multiplot

bbb=alog10(Resex*0.05)
xtitl="log(R!De!N) - arcsec [R!De!N SExtractor] "
ccc=alog10(Re30*0.05)
ytitl="log(R!De!N) - M!DSize!N=3.0 [R!DKron!N]"



fit=ltrend(bbb,ccc,ccc/ccc)
b1=fit[0]
b0=fit[1]

		plot,  [0], /nodata,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, charsize=1.3, yrange=[-0.2,1.8], xrange=[-0.2,1]
		oplot,bbb, ccc, psym=4,color=cc[30]
		oplot, [-10,10], [-10,10], linestyle=1, thick=4, color=cc[0]
rms=sqrt(mean((bbb-ccc)^2))
xyouts, 0.7,0.2,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------------------------------------

ps_off

multiplot, /reset
!p.multi=[0,1,1,0,0]
multiplot


aa=alog10(re814*0.05*.463)
bb=mu_814


aa30=aa[0:30]
aa62=aa[31:62]
aa74=aa[63:74]

bb30=bb[0:30]
bb62=bb[31:62]
bb74=bb[63:74]


x1=aa30(where(mag814_30 lt limag))
x2=aa62(where(mag814_62 lt limag))
x3=aa74(where(mag814_74 lt limag))
y1=bb30(where(mag814_30 lt limag))
y2=bb62(where(mag814_62 lt limag))
y3=bb74(where(mag814_74 lt limag))
y=[y1,y2,y3]
x=[x1,x2,x3]





plot, x,y , psym=7, xrange=[-0.5,2], yrange=[25,17],xstyle=1,ystyle=1
;oplot, aa30, bb30, psym=3;, xrange=[-0.5,2.0], yrange=[25,17],xstyle=1,ystyle=1
;oplot, aa62, bb62, psym=3;, xrange=[-0.5,2], yrange=[25,17],xstyle=1,ystyle=1
;oplot, aa74, bb74, psym=3






fit=ltrend(x,y,y/y)
fit1=ltrend(y,x,x/x)
alfa=atan(fit[0])
if fit[0] lt 0 then alfa+=!pi
print, alfa*180/!pi
beta=atan(1.0/fit1[0])
if fit1[0] lt 0 then beta+=!pi
print, beta*180/!pi
gama=0.5*(alfa+beta)
print, gama*180/!pi
p=tan(gama)
fit1[1]=-fit1[1]/fit1[0]
fit1[0]=1/fit1[0]
q=(fit[0]*fit1[1]-fit1[0]*fit[1])/(fit[0]-fit1[0])-p*(fit1[1]-fit[1])/(fit[0]-fit1[0])
oplot, [-0.5,10.0], p*[-0.5,10.0]+q, linestyle=0
trend=ltrenderror( x, y, 0.05*x, 0.1*y/y, 0.05, 0.05, 5000)
print,   p, q, trend[2], trend[3]
del=abs(p*x+q-y)
s=stdev(del)
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q+2*s[1], linestyle=2
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q-2*s[1], linestyle=2
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q+3*s[1], linestyle=1
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q-3*s[1], linestyle=1





;fit=ortltrend(x,y)
;oplot, [-0.5,10.0], fit[0]*[-0.5,10.0]+fit[1], linestyle=1



x1=aa30(where(mag814_30 lt 17 and mag814_30 ge 15))
x2=aa62(where(mag814_62 lt 17 and mag814_62 ge 15))
x3=aa74(where(mag814_74 lt 17 and mag814_74 ge 15))
y1=bb30(where(mag814_30 lt 17 and mag814_30 ge 15))
y2=bb62(where(mag814_62 lt 17 and mag814_62 ge 15))
y3=bb74(where(mag814_74 lt 17 and mag814_74 ge 15))
y=[y1,y2,y3]
x=[x1,x2,x3]
oplot, x,y , psym=3

fit=ltrend(x,y,y/y)
fit1=ltrend(y,x,x/x)
alfa=atan(fit[0])
if fit[0] lt 0 then alfa+=!pi
print, alfa*180/!pi
beta=atan(1.0/fit1[0])
if fit1[0] lt 0 then beta+=!pi
print, beta*180/!pi
gama=0.5*(alfa+beta)
print, gama*180/!pi
p=tan(gama)
fit1[1]=-fit1[1]/fit1[0]
fit1[0]=1/fit1[0]
q=(fit[0]*fit1[1]-fit1[0]*fit[1])/(fit[0]-fit1[0])-p*(fit1[1]-fit[1])/(fit[0]-fit1[0])
oplot, [-0.5,10.0], p*[-0.5,10.0]+q, linestyle=0
del=abs(p*x+q-y)
s=stdev(del)
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q+2*s[1], linestyle=2
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q-2*s[1], linestyle=2
trend=ltrenderror( x, y, 0.05*x, 0.1*y/y, 0.05, 0.05, 5000)
print,   p, q, trend[2], trend[3]


x1=aa30(where(mag814_30 lt 19 and mag814_30 ge 17))
x2=aa62(where(mag814_62 lt 19 and mag814_62 ge 17))
x3=aa74(where(mag814_74 lt 19 and mag814_74 ge 17))
y1=bb30(where(mag814_30 lt 19 and mag814_30 ge 17))
y2=bb62(where(mag814_62 lt 19 and mag814_62 ge 17))
y3=bb74(where(mag814_74 lt 19 and mag814_74 ge 17))
y=[y1,y2,y3]
x=[x1,x2,x3]
oplot, x,y , psym=4

fit=ltrend(x,y,y/y)
fit1=ltrend(y,x,x/x)
alfa=atan(fit[0])
if fit[0] lt 0 then alfa+=!pi
print, alfa*180/!pi
beta=atan(1.0/fit1[0])
if fit1[0] lt 0 then beta+=!pi
print, beta*180/!pi
gama=0.5*(alfa+beta)
print, gama*180/!pi
p=tan(gama)
fit1[1]=-fit1[1]/fit1[0]
fit1[0]=1/fit1[0]
q=(fit[0]*fit1[1]-fit1[0]*fit[1])/(fit[0]-fit1[0])-p*(fit1[1]-fit[1])/(fit[0]-fit1[0])
oplot, [-0.5,10.0], p*[-0.5,10.0]+q, linestyle=0
del=abs(p*x+q-y)
s=stdev(del)
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q+2*s[1], linestyle=2
;oplot, [-0.5,10.0], p*[-0.5,10.0]+q-2*s[1], linestyle=2
trend=ltrenderror( x, y, 0.05*x, 0.1*y/y, 0.05, 0.05, 5000)
print,   p, q, trend[2], trend[3]


x1=aa30(where(mag814_30 ge 19))
;x2=aa62(where(mag814_62 ge 19))
;x3=aa74(where(mag814_74 ge 19))
y1=bb30(where(mag814_30 ge 19))
;y2=bb62(where(mag814_62 ge 19))
;y3=bb74(where(mag814_74 ge 19))
y=[y1]
x=[x1]
oplot, x,y , psym=2


end
