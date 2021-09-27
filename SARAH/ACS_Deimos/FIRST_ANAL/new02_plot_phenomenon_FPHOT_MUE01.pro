pro new02_plot_phenomenon_FPHOT_MUE01, psout

;  new02_plot_phenomenon_FPHOT_RE, 'testjagour_v2.ps'    
;  new02_plot_phenomenon_FPHOT_RE, 'testjagour_v20.ps'    


ps_on , psout, noask='y', /color, cc=cc
device,filename=psout,xsize=40,ysize=25,xoffset=2.2
!y.margin=7
!x.margin=15.

multiplot,/reset   
!p.multi=[0,2,1,0,0]

xthickformat_origin=!x.tickformat
xthickname_origin=!x.tickname



list='re_fp.txt'

readcol, list, gmp, mag814, re814, sigma, ermag814, erre814, ersigma, /SILENT, FORMAT='I,D,D,D,D,D,D'

iter=25  ; default 25000
limag=19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;
mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
re814kpc=alog10(re814*0.05*0.463)
logsigma=alog10(sigma)


;mu475=mag475+2.5*alog10(2*3.1415*re475*re475*0.0025)
;re475kpc=alog10(re475*0.05*0.463)

;logn814=alog10(ser814)
;logn475=alog10(ser475)
; 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
; 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
; 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
; 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222.
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

;print, modgmp

;modgmp[where(modgmp eq 2535)]=0
;modgmp[where(modgmp eq 2541)]=0
;modgmp[where(modgmp eq 2654)]=0
	;modgmp[where(modgmp eq 2696)]=0
;modgmp[where(modgmp eq 2778)]=0
;modgmp[where(modgmp eq 2805)]=0
;modgmp[where(modgmp eq 2839)]=0
;modgmp[where(modgmp eq 2861)]=0
	;modgmp[where(modgmp eq 2690)]=0
;modgmp[where(modgmp eq 3131)]=0
;modgmp[where(modgmp eq 3170)]=0
;modgmp[where(modgmp eq 3201)]=0
;modgmp[where(modgmp eq 3269)]=0
;modgmp[where(modgmp eq 3292)]=0
;modgmp[where(modgmp eq 3367)]=0
;modgmp[where(modgmp eq 3400)]=0
;modgmp[where(modgmp eq 4430)]=0




;aa=modgmp
;modgmp1=aa[0:30]
;modgmp2=aa[31:62]
;modgmp3=aa[63:74]

modmag=mag814[where(modgmp ne 0)]
modmu814=mu814[where(modgmp ne 0)]
modre814kpc=re814kpc[where(modgmp ne 0)]
modlogsigma=logsigma[where(modgmp ne 0)]


ermu814=sqrt((ermag814)^2+(5.*erre814/re814/alog(10))^2)
erre814kpc=erre814/re814/alog(10)
erlogsigma=ersigma/sigma/alog(10)

modermu814=ermu814[where(modgmp ne 0)]
moderre814kpc=erre814kpc[where(modgmp ne 0)]
moderlogsigma=erlogsigma[where(modgmp ne 0)]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

	;sigma=ser814
	;ersigma=erser814
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;


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


M_Ldyn814=M_dynamics-(mag814-35.0+2.5*alog10(2.)-4.57)/(-2.5)


  ; sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
 ;  sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
 ;  sdssI=0.5*(sdssI1+sdssI2)
;M_Ldyn814=-2.5*M_dynamics/(sdssI-35.0+2.5*alog10(2.)-4.57)

M_s=((Ms_LII+0.18)-M_Ldyn814)+M_dynamics ; logarithm of stellar mass
Mu_s=M_s-alog10(2*3.1415*re814*re814*0.0025)
;M_s=Mu_s

;mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
;re814kpc=alog10(re814*0.05*0.463)
;logsigma=alog10(sigma)
mu814=Ms_LII
re814kpc=M_s
logsigma=alog10(sigma)

print, re814kpc


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
modmu814=mu814[where(modgmp ne 0)]

modre814kpc=re814kpc[where(modgmp ne 0)]
modlogsigma=logsigma[where(modgmp ne 0)]


;ermu814=sqrt((ermag814)^2+(5.*erre814/re814/alog(10))^2)
;erre814kpc=erre814/re814/alog(10)
ermu814=mu814*0.05
erre814kpc=re814kpc*0.05
erlogsigma=ersigma/sigma/alog(10)





;modermu814=ermu814[where(modgmp ne 0)]
modermu814=ermu814[where(modgmp ne 0)]

moderre814kpc=erre814kpc[where(modgmp ne 0)]
moderlogsigma=erlogsigma[where(modgmp ne 0)]



multiplot

dwmag=0



x=modmu814[where(modmag lt limag and modmag ge dwmag)]
y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
z=modlogsigma[where(modmag lt limag and modmag ge dwmag)]
xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
zer=moderlogsigma[where(modmag lt limag and modmag ge dwmag)]

;x=modmu814[where(modmu814 lt limag)]
;y=modre814kpc[where(modmu814 lt limag)]
;z=modlogsigma[where(modmu814 lt limag)]
;xer=modermu814[where(modmu814 lt limag)]
;yer=moderre814kpc[where(modmu814 lt limag)]
;zer=moderlogsigma[where(modmu814 lt limag)]

h=0.03
h1=0.04
v=0.15
plot, [0], /nodata, xthick=4.,ythick=4., charsize=2.0, xrange=[6.50,11.50], yrange=[7,11], xstyle=1, ystyle=1, xtickinterval=1, xminor=5.,ytitle='', xtitle='a log(!7r!X)+b log<M!D*!N>!De!N+c', yminor=5
ans=ortptrend(z,x,y)
print, ans
ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
print, ans0
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
help, del
print, "DEX=", sqrt(rm[0])
xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.6
oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
xyouts, -0.30-v, 0.8-h1, 'M!D814!N<-16', color=cc[0], size=1.6

x=modmu814
y=modre814kpc
z=modlogsigma
xer=modermu814
yer=moderre814kpc
zer=moderlogsigma
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
print, "DEX(tot)=", sqrt(rm[0])
xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.6
oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
oplot, [-0.40-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
box, [-0.44-v,0.55-h],[0.40-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


x=modmu814[where(modmag ge limag or modmag le dwmag)]
y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
z=modlogsigma[where(modmag ge limag or modmag le dwmag)]
xer=modermu814[where(modmag ge limag or modmag le dwmag)]
yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
zer=moderlogsigma[where(modmag ge limag or modmag le dwmag)]
oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
oplot, [-100,100],[-100,100], linestyle=1, thick=5.0




px=-0.44-v
py=0.4
xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.6
xyouts, 0.85,0.8,'(B)', color=cc[50], size=1.6
xyouts, -0.30,-0.5,'Stellar-Mass Fundamental Plane', color=cc[0], size=1.8
xyouts, 0.8,0.7,'FP!D*!N', color=cc[0], size=1.8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;


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
M_Ldyn814=M_dynamics-(mag814-35.0+2.5*alog10(2.)-4.57)/(-2.5)

M_s=((Ms_LII+0.18)-M_Ldyn814)+M_dynamics ; logarithm of stellar mass
Mu_s=M_s-alog10(2*3.1415*re814*re814*0.0025)
;M_s=Mu_s


	sigma=ser814
	ersigma=erser814

;mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
;re814kpc=alog10(re814*0.05*0.463)
;logsigma=alog10(sigma)
mu814=Ms_LII
re814kpc=M_s
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
modmu814=mu814[where(modgmp ne 0)]

modre814kpc=re814kpc[where(modgmp ne 0)]
modlogsigma=logsigma[where(modgmp ne 0)]


;ermu814=sqrt((ermag814)^2+(5.*erre814/re814/alog(10))^2)
;erre814kpc=erre814/re814/alog(10)

ermu814=mu814*0.05
erre814kpc=re814kpc*0.05
erlogsigma=ersigma/sigma/alog(10)





;modermu814=ermu814[where(modgmp ne 0)]
modermu814=ermu814[where(modgmp ne 0)]

moderre814kpc=erre814kpc[where(modgmp ne 0)]
moderlogsigma=erlogsigma[where(modgmp ne 0)]



multiplot

dwmag=0



x=modmu814[where(modmag lt limag and modmag ge dwmag)]
y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
z=modlogsigma[where(modmag lt limag and modmag ge dwmag)]
xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
zer=moderlogsigma[where(modmag lt limag and modmag ge dwmag)]

;x=modmu814[where(modmu814 lt limag)]
;y=modre814kpc[where(modmu814 lt limag)]
;z=modlogsigma[where(modmu814 lt limag)]
;xer=modermu814[where(modmu814 lt limag)]
;yer=moderre814kpc[where(modmu814 lt limag)]
;zer=moderlogsigma[where(modmu814 lt limag)]

h=0.03
h1=0.04
v=0.15
plot, [0], /nodata, xthick=4.,ythick=4., charsize=2.0, xrange=[6.50,11.50], yrange=[7,11], xstyle=1, ystyle=1, xtickinterval=1, xminor=5.,ytitle='', xtitle='!7a!X!D*!N log(n)+!7b!X!D*!N log<M!D*!N>!De!N+!7c!X!D*!N', yminor=5
ans=ortptrend(z,x,y)
print, ans
ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
print, ans0
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
help, del
print, "DEX=", sqrt(rm[0])
xyouts, 7, 10, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.6
oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
xyouts, -0.30-v, 0.8-h1, 'M!D814!N<-16', color=cc[0], size=1.6

x=modmu814
y=modre814kpc
z=modlogsigma
xer=modermu814
yer=moderre814kpc
zer=moderlogsigma
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
print, "DEX(tot)=", sqrt(rm[0])
xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.6
oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
oplot, [-0.40-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
box, [-0.44-v,0.55-h],[0.40-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


x=modmu814[where(modmag ge limag or modmag le dwmag)]
y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
z=modlogsigma[where(modmag ge limag or modmag le dwmag)]
xer=modermu814[where(modmag ge limag or modmag le dwmag)]
yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
zer=moderlogsigma[where(modmag ge limag or modmag le dwmag)]
oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
oplot, [-100,100],[-100,100], linestyle=1, thick=5.0




px=7
py=0.4
xyouts, 7,10.8,'!7a!X!D*!N='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
xyouts, 7,10.6,'!7b!X!D*!N='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
xyouts, 7,10.4,'!7c!X!D*!N='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.5
;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.6
xyouts, 0.85,0.8,'(C)', color=cc[50], size=1.6
xyouts, 0.75,0.7,'PHP!D*!N', color=cc[0], size=1.8

xyouts, -0.30,-0.5,'Stellar-Mass Photometric Plane', color=cc[0], size=1.8


ps_off


plot, modre814kpc, modlogsigma ,psym=2, xrange=[7,11]
;plot, m_s, m_dynamics, psym=2, yrange=[7,11]

end