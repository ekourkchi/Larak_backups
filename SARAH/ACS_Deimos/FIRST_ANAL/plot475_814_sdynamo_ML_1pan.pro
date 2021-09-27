pro plot475_814_sdynamo_ML_1pan, psout, limag


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=25,ysize=20, scale_factor=0.8;, 
;, SET_FONT="Times-Roman"

!y.margin=3.5
!x.margin=8


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

for i=0, n_elements(Ms_Li)-1 do  print, i, B_R[i]


outlier=where(gmp eq 2877)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3141)
B_R[outlier]=B_R0[outlier]

outlier=where(gmp eq 3308)
B_R[outlier]=B_R0[outlier]

Ms_LII=0.518*B_R-0.405
;Ms00=Ms_Lr+(r-35.0-4.65)/(-2.5)
;Ms_LII=Ms00-(mag814-35.0-4.57)/(-2.5)
;Ms_LII=Ms_Lr

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
;============================================

c2=dblarr(1,1)
c2=5.0
M_dynamics=alog10(2.0)+alog10(c2*(sigma*sigma*1000*1000)*(re*0.05*0.463*3.08568025)/6.67300/1.98892)
;print, M_dynamics



erM_dynamics=sqrt((2*ersigma/sigma)^2+(erre814/re)^2)/alog(10)

for i=0, n_elements(gmp)-1 do print, gmp[i], M_dynamics[i], erM_dynamics[i]


;M_Ldyn814=M_dynamics-(mag814-35.0+2.5*alog10(2.)-4.57)/(-2.5)
M_Ldyn814=M_dynamics-(mag814-35.0-4.57)/(-2.5)

;print, M_Ldyn814

;print, erM_dynamics


;erM_Ldyn814=abs(-2.5*erM_dynamics/(mag814-35.0+2.5*alog10(2.)-4.57))
erM_Ldyn814=abs(erM_dynamics)

;print, erM_Ldyn814
print, "  "
;M_Ldyn475=M_dynamics-(mag475-35.0+2.5*alog10(2.)-5.14)/(-2.5)
M_Ldyn475=M_dynamics-(mag475-35.0-5.14)/(-2.5)

;print, M_Ldyn475

erM_Ldyn475=abs(erM_dynamics)
;============================================
;============================================






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
;print, "DEX=", mean(delta0*delta0) 


;mlg30=sigma[0:30]  ; filter correction
del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]


;plot, alog10(f814_1/f475_1), delta, psym=4
;plot, g-r, delta, psym=4

;limag= 17.5


del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag))

;plot, mlg310, del310, psym=4;, xrange=[0.3,0.7],yrange=[-3,6]
;oplot, mlg740, del740, psym=2;, xrange=[0.3,0.7],yrange=[-3,6]



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


;print, '   y=a1*x+a0' 
;print, '       a1            a0           da1           da0'
;print, a1,a0,da1,da0



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



help, modgmp, M_dynamics, mag814, ser814
e_M_dynamics=M_dynamics[where(modgmp ne 0)]
e_m814=mag814[where(modgmp ne 0)]
e_ser814=ser814[where(modgmp ne 0)]
e_gmp=gmp[where(modgmp ne 0)]
for i=0, n_elements(e_gmp)-1 do print, e_gmp[i], e_m814[i], e_ser814[i], e_M_dynamics[i]











aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]
;------------------------------------------------------------------------------

M_dynamics_30=M_dynamics[0:30]
M_dynamics_62=M_dynamics[31:62]
M_dynamics_74=M_dynamics[63:74]




bbb=M_dynamics
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))



ccc=M_Ldyn814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 gt limag))
ccc620=ccc62(where(mag814_62 gt limag ))
ccc740=ccc74(where(mag814_74 gt limag ))

ddd=erM_Ldyn814
ddd30=ddd[0:30]
ddd62=ddd[31:62]
ddd74=ddd[63:74]
ddd300=ddd30(where(mag814_30 gt limag))
ddd620=ddd62(where(mag814_62 gt limag ))
ddd740=ddd74(where(mag814_74 gt limag ))

;bbb300=bbb30(where(M_dynamics_30 lt 9))
;bbb620=bbb62(where(M_dynamics_62 lt 9))
;bbb740=bbb74(where(M_dynamics_74 lt 9))
;ccc300=ccc30(where(M_dynamics_30 lt 9))
;ccc620=ccc62(where(M_dynamics_62 lt 9))
;ccc740=ccc74(where(M_dynamics_74 lt 9))


xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
zz=[ddd300,ddd620,ddd740]




fit=ltrend(xx,yy,zz)
b1=fit[0]
b0=fit[1]
db1=fit[2]
db0=fit[3]

bbb30=bbb30[where(modgmp1 ne 0)]
bbb62=bbb62[where(modgmp2 ne 0)]
bbb74=bbb74[where(modgmp3 ne 0)]
ccc30=ccc30[where(modgmp1 ne 0)]
ccc62=ccc62[where(modgmp2 ne 0)]
ccc74=ccc74[where(modgmp3 ne 0)]

		;multiplot,/reset   
		;!p.multi=[0,1,2,0,0]
		;multiplot



		
		;xtitl=" "
xtitl="log(M/M!D!9n!N!X)"

		ytitl="log(M/L) [(M/L)!D!9n!N!X]"
		plot, [0], /nodata, xthick=5., ythick=5.,  xtitle=xtitl, ytitle=ytitl, yrange=[-0.8,2.4], xrange=[7,11.50], xstyle=1, ystyle=1, charsize=1.8, ytickinterval=0.5, yminor=5 

		oploterror, bbb30, ccc30, bbb30*0., ddd30, psym=yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]
		oploterror, bbb62, ccc62, bbb62*0., ddd62, psym=yoursymbol(22,color=cc[8]), color=cc[8], /nohat, ERRCOLOR=cc[8]
		oploterror, bbb74, ccc74, bbb74*0., ddd74, psym=yoursymbol(21,color=cc[30]), color=cc[30], /nohat, ERRCOLOR=cc[30]
		;oplot, [7,11.50], b1*[7,11.50]+b0, linestyle=2, thick=3


polyfill, [7.1,7.1,8.28,8.28],[1.07,1.17,1.17,1.07],color=cc[10]





		;xyouts, 7.2,1.14,'c='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.1
		
		;xyouts, 7.2,1.09,'d='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.1
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

bbb=M_dynamics
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]




ccc=M_Ldyn814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]

ddd=erM_Ldyn814
ddd30=ddd[0:30]
ddd62=ddd[31:62]
ddd74=ddd[63:74]


bbb300=bbb30(where(mag814_30 lt limag))
bbb620=bbb62(where(mag814_62 lt limag ))
bbb740=bbb74(where(mag814_74 lt limag ))
ccc300=ccc30(where(mag814_30 lt limag))
ccc620=ccc62(where(mag814_62 lt limag ))
ccc740=ccc74(where(mag814_74 lt limag ))
ddd30=ddd30(where(mag814_30 lt limag))
ddd62=ddd62(where(mag814_62 lt limag ))
ddd74=ddd74(where(mag814_74 lt limag ))





;bbb300=bbb30(where(M_dynamics_30 ge 10))
;bbb620=bbb62(where(M_dynamics_62 ge 10))
;bbb740=bbb74(where(M_dynamics_74 ge 10))
;ccc300=ccc30(where(M_dynamics_30 ge 10))
;ccc620=ccc62(where(M_dynamics_62 ge 10))
;ccc740=ccc74(where(M_dynamics_74 ge 10))
;ddd300=ddd30(where(M_dynamics_74 ge 10))
;ddd620=ddd62(where(M_dynamics_74 ge 10))
;ddd740=ddd74(where(M_dynamics_74 ge 10))

xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
zz=[ddd300,ddd620,ddd740]

fit=ltrend(xx,yy,zz)

b1=fit[0]
b0=fit[1]
db1=fit[2]
db0=fit[3]

;;print, '   y=b1*x+b0' 
;;print, '       b1            b0           db1           db0'
;;print, b1,b0,db1,db0

rM_dynamics=M_dynamics[where(modgmp ne 0)]
bbb30=bbb30[where(modgmp1 ne 0)]
bbb62=bbb62[where(modgmp2 ne 0)]
bbb74=bbb74[where(modgmp3 ne 0)]
ccc30=ccc30[where(modgmp1 ne 0)]
ccc62=ccc62[where(modgmp2 ne 0)]
ccc74=ccc74[where(modgmp3 ne 0)]
xresid=[bbb30,bbb62,bbb74]
yresid=[ccc30,ccc62,ccc74]
;xresid=xresid(where(rM_dynamics lt 10))
;yresid=yresid(where(rM_dynamics lt 10))

ppp=alog10(ser814)
ppp30=ppp[0:30]
ppp62=ppp[31:62]
ppp74=ppp[63:74]
ppp30=ppp30[where(modgmp1 ne 0)] 
ppp62=ppp62[where(modgmp2 ne 0)]
ppp74=ppp74[where(modgmp3 ne 0)]
tt=[ppp30,ppp62,ppp74]

rresid=yresid-(b1*xresid+b0)
rms=sqrt(mean(rresid^2))
print, "RMSA:", rms

ser814_e=ser814[where(modgmp ne 0)]
sig_e=sigma[where(modgmp ne 0)]
re_e=re814[where(modgmp ne 0)]
mag_e=mag814[where(modgmp ne 0)]

help, rresid, ser814_e, sig_e
print, 'corr:', correlation(rresid, alog10(ser814_e))
print, 'corr:', correlation(rresid, alog10(re_e))
print, 'corr:', correlation(rresid, mag_e)
print, 'corr:', correlation(rresid, alog10(sig_e))


		oplot, [7,11.50], b1*[7,11.50]+b0, linestyle=1, thick=3
	
polyfill, [9.7,9.7,10.88,10.88],[0.95,0.85,0.85,0.95],color=cc[10]
	
		xyouts, 9.7,-0.2,'a='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.1
		
		xyouts, 9.7,-0.5,'b='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.1

;xyouts, 8.5,-0.850,'RMS='+strtrim(string(rms, FORMAT='(F5.3)'),2), size=1.2
;------------------------------------------------

resid1=m_l814-(b1*m+b0)
;------------------------------------------------------------------------------
xyouts, 7.20,1.7,'F814W-band', size=1.30

;xyouts, 9.2,2.0,'(A)', charsize=1.3, color=cc[0]
legend, ["Deimos Sample","MG05","Co09"], color=[0,8,30] , psym=[25,22,21], /clear, charsize=1.1




ps_off

end
