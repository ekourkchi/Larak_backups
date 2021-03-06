pro plot475_814_delcolor_multiple, psout, limag


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=40,ysize=18, scale_factor=0.8;, 
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


fp=3.2045*aLOG10(re814*0.05*0.4)-3.8196*aLOG10(sigma)+26.8134
delta=mu_814-3.32749*aLOG10(re814*0.05*0.4)+4.14873*aLOG10(sigma)-27.5066

delta0=delta(where(mag814 gt limag))
print, "DEX=", mean(delta0*delta0) 


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


print, '   y=a1*x+a0' 
print, '       a1            a0           da1           da0'
print, a1,a0,da1,da0




;------------------------------------------------------------------------------

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))


ccc=M_L814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 gt limag))
ccc620=ccc62(where(mag814_62 gt limag ))
ccc740=ccc74(where(mag814_74 gt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0

;		multiplot,/reset   
;		!p.multi=[0,1,2,0,0]
;		multiplot



		
		xtitl=" "
		ytitl="!MA!X log (M/L!D814!N)"
;		plot,  bbb300, ccc300, psym=2,  xthick=3., ythick=3.,  xtitle=xtitl, ytitle=ytitl, yrange=[10.2,13.2], xrange=[1.2,5.3], xstyle=1, ystyle=1, charsize=1.3
;		oplot, bbb620, ccc620, psym=4, color=cc[8]
;		oplot, bbb740, ccc740, psym=5, color=cc[30]
;		oplot, [1,6], b1*[1,6]+b0, linestyle=2, thick=3


;		xyouts, 1.4,12.7,'a='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
		
;		xyouts, 1.4,12.5,'b='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 lt limag))
bbb620=bbb62(where(mag814_62 lt limag ))
bbb740=bbb74(where(mag814_74 lt limag ))


ccc=M_L814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 lt limag))
ccc620=ccc62(where(mag814_62 lt limag ))
ccc740=ccc74(where(mag814_74 lt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0




;		oplot,  bbb300, ccc300, psym=2;, xtitle=xtitl, ytitle=ytitl, yrange=[10,13], xrange=[1.5,6.0]
;		oplot, bbb620, ccc620, psym=4, color=cc[8]
;		oplot, bbb740, ccc740, psym=5, color=cc[30]
;		oplot, [1,6], b1*[1,6]+b0, linestyle=1, thick=3
		
		
;		xyouts, 4.,10.7,'c='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
		
;		xyouts, 4.,10.5,'d='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
;------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;		multiplot


;------------------------------------------------------------------------------

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))


ccc=M_L475
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 gt limag))
ccc620=ccc62(where(mag814_62 gt limag ))
ccc740=ccc74(where(mag814_74 gt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0



xtitl="!MA!X log(Mass)"
ytitl="!MA!X log(M/L!Df475w!N)"
;		plot,  bbb300, ccc300, psym=2,  xthick=3.,ythick=3., xtitle=xtitl, ytitle=ytitl, yrange=[10.2,13.2], xrange=[1.2,5.3], xstyle=1, ystyle=1, charsize=1.3
;		oplot, bbb620, ccc620, psym=4, color=cc[8]
;		oplot, bbb740, ccc740, psym=5, color=cc[30]
;		oplot, [1,6], b1*[1,6]+b0, linestyle=2, thick=3
	
		
;		xyouts, 1.4,12.7,'a='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
		
;		xyouts, 1.4,12.5,'b='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 lt limag))
bbb620=bbb62(where(mag814_62 lt limag ))
bbb740=bbb74(where(mag814_74 lt limag ))


ccc=M_L475
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 lt limag))
ccc620=ccc62(where(mag814_62 lt limag ))
ccc740=ccc74(where(mag814_74 lt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0



;		oplot,  bbb300, ccc300, psym=2;, xtitle=xtitl, ytitle=ytitl, yrange=[10,13], xrange=[1.5,6.0]
;		oplot, bbb620, ccc620, psym=4, color=cc[8]
;		oplot, bbb740, ccc740, psym=5, color=cc[30]
;		oplot, [1,6], b1*[1,6]+b0, linestyle=1, thick=3
		
;		xyouts, 4.,10.7,'c='+strtrim(string(b1, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db1, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
;		
;		xyouts, 4.,10.5,'d='+strtrim(string(b0, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(db0, FORMAT='(F5.2)'),2), color=cc[50], size=1.2
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------


		bbb=M_L814
		;bbb=mag475-mag814

bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag)) 

	;xtitl="m!D475!N-m!D814!N"
	;xtitl="g-i"
	;ytitl="!7l!X-!7l!X!S!De!R!N!U* !N"
	;plot,  bbb300, del300, psym=2, xtitle=xtitl, ytitle=ytitl, xrange=[0.7,1.3],  yrange=[-1,3.], xstyle=1, ystyle=1, charsize=1.1, xthick=3., ythick=3.
	;oplot, bbb620, del620, psym=4, color=cc[30]
	;oplot, bbb740, del740, psym=5, color=cc[48]
	;legend, ["deimos","MG05","Co09"], color=[0,30,48] , psym=[2,4,5], /clear, /right, charsize=0.8

;xtitl="M/L (475 > 17) "
;ytitl="delta"
;plot,  mlg300, del300, psym=2, xtitle=xtitl, ytitle=ytitl
;oplot, mlg620, del620, psym=4, color=cc[30]
;oplot, mlg740, del740, psym=5, color=cc[48]
;oplot, [10.5,13.5], a1*[10.5,13.5]+a0
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
bbb=[bbb300,bbb620,bbb740]
del=[del300,del620,del740]
Q1=size(bbb)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=bbb
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


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0


	;oplot, [0.6,1.5], b1*[0.6,1.5]+b0
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
delta=abs(mu_814-3.32749*aLOG10(re814*0.05*0.4)+4.14873*aLOG10(sigma)-27.5066)


del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]


	bbb= g-r
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))




	multiplot,/reset   
	!p.multi=[0,4,1,0,0]
	multiplot

	ytitl="!7D!X!DFP!N = |<!7l!X>!De!N-<!7l!X>!De!N!U*!N| [mag]"
	xtitl="SDSS(g-r) [mag]"
	plot,  bbb30, del30, psym=yoursymbol(25,color=cc[0]), xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1, xminor=4, yminor=4, charsize=1.3, xthick=3., ythick=3., yrange=[-3.5,3.5], xrange=[0.475,0.84]
	oplot, bbb62, del62, psym=yoursymbol(22,color=cc[8]), color=cc[8]
	oplot, bbb74, del74, psym=yoursymbol(21,color=cc[30]), color=cc[30]

trend=ltrend(bbb,delta,bbb/bbb)
oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [0,0], linestyle=1, thick=2.


		t= bsort(bbb)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=10
		yy=1000.
		zz=0
		xx=1000.
		while ( i+d lt num) do begin
		u=stdev(delta[i:i+d])
		yy=[yy,u[0]]
		zz=[zz,u[1]]
		v=stdev(bbt[i:i+d])
		xx=[xx,v[0]]
		i=i+d+1
		endwhile
		oploterror, xx,yy-3,xx*0.0,zz, psym=symcat(9,color=cc[48])
		oplot,  [-10,10], trend[0]*[-10,10]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-10,10], [0,0]-3.0, linestyle=1, thick=2.
polyfill, [0.43,0.43,0.47,0.47],[-3.25,-0.75,-0.75,-3.25],color=cc[10]
xyouts, 0.375, -3-0.07, 0, color=cc[0], size=1.3
xyouts, 0.375, -2-0.07, 1, color=cc[0], size=1.3
xyouts, 0.375, -1-0.07, 2, color=cc[0], size=1.3

xyouts, 0.5,-0.30,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 0.5,-0.60,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 0.5,-0.9,'CC=-0.48', size=1.3
xyouts, 0.49,0.25,'(A)', charsize=1.1, color=cc[0]

gmp30=gmp[0:30]
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141 or gmp30[pm] eq 2808 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 3119 or gmp30[pm] eq 2563) then xyouts, bbb30[pm]-0.02, del30[pm]-0.08,gmp30[pm], charsize=0.9, color=cc[0]
if (gmp30[pm] eq 2655) then xyouts, bbb30[pm]-0.05, del30[pm]-0.22,gmp30[pm], charsize=0.9, color=cc[0]
endfor
;------------------------------------------------------------------------------
	bbb=mag475-mag814
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

multiplot
	
	xtitl="(m!D475!N-m!D814!N) [mag]"
	plot,  bbb30, del30, psym=yoursymbol(25,color=cc[0]), xtitle=xtitl, xstyle=1, ystyle=1, charsize=1.3, xthick=3., ythick=3., yrange=[-3.5,3.5], xrange=[0.925,1.475], xminor=4, yminor=4,xtickinterval=0.1
	oplot, bbb62, del62, psym=yoursymbol(22,color=cc[8]), color=cc[8]
	oplot, bbb74, del74, psym=yoursymbol(21,color=cc[30]), color=cc[30]

trend=ltrend(bbb,delta,bbb/bbb)
oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [0,0], linestyle=1, thick=2.



		t= bsort(bbb)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=10
		yy=1000.
		zz=0
		xx=1000.
		while ( i+d lt num) do begin
		u=stdev(delta[i:i+d])
		yy=[yy,u[0]]
		zz=[zz,u[1]]
		v=stdev(bbt[i:i+d])
		xx=[xx,v[0]]
		jj=[xx,v[1]]
		i=i+d+1
		endwhile
		oploterror, xx,yy-3.0,xx*0.0,zz, psym=symcat(9,color=cc[48])
		oplot,  [-10,10], trend[0]*[-10,10]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-10,10], [0,0]-3.0, linestyle=1, thick=2.


xyouts, 1.2,-0.30,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.2,-0.60,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.2,-0.9,'CC=-0.54', size=1.3
xyouts, 0.96,0.25,'(B)', charsize=1.1, color=cc[09]


gmp30=gmp[0:30]
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141 or gmp30[pm] eq 2808 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 2655 or gmp30[pm] eq 2563) then xyouts, bbb30[pm]-0.03, del30[pm]-0.08,gmp30[pm], charsize=0.9, color=cc[0]
if (gmp30[pm] eq 3119) then xyouts, bbb30[pm]-0.08, del30[pm]-0.22,gmp30[pm], charsize=0.9, color=cc[0]
endfor

;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
	bbb= (-2.5*alog10(f475_2)+26.068)-(-2.5*alog10(f814_2)+25.937)
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

multiplot
	
	xtitl="(m!D475!N-m!D814!N) [mag] D=0.4''"
	plot,  bbb30, del30, psym=yoursymbol(25,color=cc[0]), xtitle=xtitl, xstyle=1, ystyle=1, charsize=1.3, xthick=3., ythick=3., yrange=[-3.5,3.5], xrange=[0.825,1.475], xminor=4, yminor=4,xtickinterval=0.1
	oplot, bbb62, del62, psym=yoursymbol(22,color=cc[8]), color=cc[8]
	oplot, bbb74, del74, psym=yoursymbol(21,color=cc[30]), color=cc[30]

trend=ltrend(bbb,delta,bbb/bbb)
oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [0,0], linestyle=1, thick=2.



		t= bsort(bbb)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=10
		yy=1000.
		zz=0
		xx=1000.
		while ( i+d lt num) do begin
		u=stdev(delta[i:i+d])
		yy=[yy,u[0]]
		zz=[zz,u[1]]
		v=stdev(bbt[i:i+d])
		xx=[xx,v[0]]
		jj=[xx,v[1]]
		i=i+d+1
		endwhile
		oploterror, xx,yy-3.0,xx*0.0,zz, psym=symcat(9,color=cc[48])
		oplot,  [-10,10], trend[0]*[-10,10]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-10,10], [0,0]-3.0, linestyle=1, thick=2.


xyouts, 1.15,-0.30,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.15,-0.60,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.15,-0.9,'CC=-0.58', size=1.3

xyouts, 0.86,0.25,'(C)', charsize=1.1, color=cc[0]


gmp30=gmp[0:30]
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141 or gmp30[pm] eq 2808 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 2655 or gmp30[pm] eq 2563) then xyouts, bbb30[pm]-0.03, del30[pm]-0.08,gmp30[pm], charsize=0.9, color=cc[0]
if (gmp30[pm] eq 3119) then xyouts, bbb30[pm]-0.08, del30[pm]-0.22,gmp30[pm], charsize=0.9, color=cc[0]
endfor

gmp62=gmp[31:62]
for pm=0, n_elements(gmp62)-1 do begin
if (gmp62[pm] eq 3034) then xyouts, bbb62[pm]-0.08, del62[pm]-0.25,gmp62[pm], charsize=0.9, color=cc[8]

endfor
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
	bbb= (-2.5*alog10(f475_3)+26.068)-(-2.5*alog10(f814_3)+25.937)
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

multiplot
	
	xtitl="(m!D475!N-m!D814!N) [mag] D=1''"
	plot,  bbb30, del30, psym=yoursymbol(25,color=cc[0]), xtitle=xtitl, xstyle=1, ystyle=1, charsize=1.3, xthick=3., ythick=3., yrange=[-3.5,3.5], xrange=[0.825,1.475], xminor=4, yminor=4,xtickinterval=0.1
	oplot, bbb62, del62, psym=yoursymbol(22,color=cc[8]), color=cc[8]
	oplot, bbb74, del74, psym=yoursymbol(21,color=cc[30]), color=cc[30]




item=['Deimos Sample']
lstyle=[1]
sym= [25]
c_colors=[0]

item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

item=[item,'Cody09']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.9, /right
;------------------------------------------------------------------------------




trend=ltrend(bbb,delta,bbb/bbb)
oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [0,0], linestyle=1, thick=2.



		t= bsort(bbb)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=10
		yy=1000.
		zz=0
		xx=1000.
		while ( i+d lt num) do begin
		u=stdev(delta[i:i+d])
		yy=[yy,u[0]]
		zz=[zz,u[1]]
		v=stdev(bbt[i:i+d])
		xx=[xx,v[0]]
		jj=[xx,v[1]]
		i=i+d+1
		endwhile
		oploterror, xx,yy-3.0,xx*0.0,zz, psym=symcat(9,color=cc[48])
		oplot,  [-10,10], trend[0]*[-10,10]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-10,10], [0,0]-3.0, linestyle=1, thick=2.


xyouts, 1.15,-0.30,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.15,-0.60,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 1.15,-0.9,'CC=-0.59', size=1.3

xyouts, 0.86,0.25,'(D)', charsize=1.1, color=cc[0]

;------------------------------------------------------------------------------
gmp30=gmp[0:30]
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141 or gmp30[pm] eq 2808 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 2655 or gmp30[pm] eq 2563) then xyouts, bbb30[pm]-0.03, del30[pm]-0.08,gmp30[pm], charsize=0.9, color=cc[0]
if (gmp30[pm] eq 3119) then xyouts, bbb30[pm]-0.08, del30[pm]-0.22,gmp30[pm], charsize=0.9, color=cc[0]
endfor





;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
bbb=[bbb300,bbb620,bbb740]
del=[del300,del620,del740]
Q1=size(bbb)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=del
y=bbb
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0


	;oplot, [0.6,1.5], b1*[0.6,1.5]+b0, linestyle=2
;------------------------------------------------------------------------------
del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag))

mlg300=mlg30(where(mag814_30 gt limag))
mlg620=mlg62(where(mag814_62 gt limag))
mlg740=mlg74(where(mag814_74 gt limag))

xtitl="!MA!X log(M/L!D814!N )  [m!D814!N > 15] "
;xtitl="!MA!X log(M/L!D814!N )  "

ytitl="!7l!X-!7l!X!S!De!R!N!U* !N"
;plot,  mlg300, del300, psym=2, xtitle=xtitl, ytitle=ytitl
;oplot, mlg620, del620, psym=4, color=cc[30]
;oplot, mlg740, del740, psym=5, color=cc[48]
;oplot, [10.5,13.5], a1*[10.5,13.5]+a0, linestyle=1, thick=3., color=cc[50]
;oplot,  b1*[-2,4]+b0, [-2,4], linestyle=2, thick=3.

;	xyouts, 10.7,3,'a='+strtrim(string(a1, FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(da1, FORMAT='(F5.2)'),2), color=cc[50], size=1.0
	
;	xyouts, 10.7,2.5, 'b='+strtrim(string(a0, FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(da0,FORMAT='(F5.2)'),2), color=cc[50], size=1.0
;print, "TEST=", a0
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

mu_x=3.32749*aLOG10(re814*0.05*0.4)-4.14873*aLOG10(sigma)+27.5066   


mux30=mu_x[0:30]
mux62=mu_x[31:62]
mux74=mu_x[63:74]

mu81430=mu_814[0:30]
mu81462=mu_814[31:62]
mu81474=mu_814[63:74]

mux300=mux30(where(mag814_30 gt limag))
mux620=mux62(where(mag814_62 gt limag ))
mux740=mux74(where(mag814_74 gt limag ))

mu814300=mu81430(where(mag814_30 gt limag))
mu814620=mu81462(where(mag814_62 gt limag))
mu814740=mu81474(where(mag814_74 gt limag))


;xtitl="<!7l!X!De!N>!U*!N"
;ytitl="<!7l!X!De!N>"
;plot, mux300,  mu814300, psym=2, xrange=[17,24.5],yrange=[17,23], xtitle=xtitl, ytitle=ytitl, xthick=3., ythick=3., xstyle=1, ystyle=1
;oplot,  mux620, mu814620, psym=4, color=cc[30]
;oplot,  mux740, mu814740, psym=5, color=cc[48]
;oplot, [0,100], [0,100], thick=3
;legend, ["deimos","MG05","Co09"], color=[0,30,48] , psym=[2,4,5], /clear,  charsize=0.8

mu_xx=3.32749*aLOG10(re814*0.05*0.4)-4.14873*aLOG10(sigma)+27.5066+a1*(2*alog10(sigma)+0.4*mu_814-alog10(re814*0.05*0.4))+a0




	;------------------------------------------------------------------------------


bbb=alog(ser814)
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]



ccc=alog(ser475)
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]

trend=ltrend(bbb,ccc,bbb/bbb)

;xtitl="ln (n!D814!N)  [I-band]"
;ytitl="ln (n!D475!N)  [g-band]"
;plot,  bbb30, ccc30, psym=2,  xthick=3.,ythick=3., xtitle=xtitl, ytitle=ytitl, yrange=[-0.5,2], xrange=[-0.5,2], xstyle=1, ystyle=1, charsize=1.3
;oplot, bbb62, ccc62, psym=4, color=cc[8]
;oplot, bbb74, ccc74, psym=5, color=cc[30]

;oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.

;trend=ltrend(ser814,ser475,ser814/ser814)
;xyouts, -0.3,1.7, 'n!D814!N=('+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2)+")n!D475!N!M+!X("+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2)+")", color=cc[50], size=1.3


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
