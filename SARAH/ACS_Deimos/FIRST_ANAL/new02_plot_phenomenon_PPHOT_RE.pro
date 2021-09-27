pro new02_plot_phenomenon_PPHOT_RE, psout

;  new02_plot_phenomenon_PPHOT_RE, 'testjagour02_v2.ps'    
;  new02_plot_phenomenon_PPHOT_RE, 'testjagour02_v20.ps'    


ps_on , psout, noask='y', /color, cc=cc
device,filename=psout,xsize=40,ysize=20,xoffset=2.2
!y.margin=5
!x.margin=8.

multiplot,/reset   
!p.multi=[0,3,1,0,0]
xthickformat_origin=!x.tickformat
xthickname_origin=!x.tickname



list='re_fp.txt'

readcol, list, gmp, mag814, re814, sigma, ermag814, erre814, ersigma, ser814, mu0_original, mu0_galfit,  /SILENT, FORMAT='I,D,D,D,D,D,D,D,D,D'

iter=25000   ; default 25000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
re814kpc=alog10(re814*0.05*0.463)
logsigma=alog10(sigma)
logn=alog10(ser814)
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
modlogn=logn[where(modgmp ne 0)]
modmu0_original=mu0_original[where(modgmp ne 0)]
modmu0_galfit=mu0_original[where(modgmp ne 0)]

ermu814=sqrt((ermag814)^2+(5.*erre814/re814/alog(10))^2)
erre814kpc=erre814/re814/alog(10)
erlogsigma=ersigma/sigma/alog(10)
erlogn=0.10/ser814/alog(10)
ermu0_original=0.05*(mu0_original/mu0_original)
ermu0_galfit=0.05*(mu0_galfit/mu0_galfit)

modermu814=ermu814[where(modgmp ne 0)]
moderre814kpc=erre814kpc[where(modgmp ne 0)]
moderlogsigma=erlogsigma[where(modgmp ne 0)]
moderlogn=erlogn[where(modgmp ne 0)]
modermu0_original=ermu0_original[where(modgmp ne 0)]
modermu0_galfit=ermu0_galfit[where(modgmp ne 0)]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
limag=16
dwmag=0

x=modmu814[where(modmag lt limag and modmag ge dwmag)]
y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
z=modlogn[where(modmag lt limag and modmag ge dwmag)]
xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
zer=moderlogn[where(modmag lt limag and modmag ge dwmag)]

;x=modmu814[where(modmu814 lt limag)]
;y=modre814kpc[where(modmu814 lt limag)]
;z=modlogn[where(modmu814 lt limag)]
;xer=modermu814[where(modmu814 lt limag)]
;yer=moderre814kpc[where(modmu814 lt limag)]
;zer=moderlogn[where(modmu814 lt limag)]

h=-0.17
h1=-0.16
v=0.7
plot, [0], /nodata, xthick=4.,ythick=4., charsize=1.4, xrange=[-1.4,1.4], yrange=[-0.5,1.1], xstyle=1, ystyle=1, xtickinterval=0.4, xminor=4.,ytitle='log(R!De!N) [kpc]', xtitle='a*log(n)+b*<!7l!X!De!N!D>(814)!N+c'
ans=ortptrend(z,x,y)
print, ans
ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
print, ans0
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

rm=stdev(del^2)
print, "DEX=", sqrt(rm[0])
xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])






oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
xyouts, -0.30-v, 0.8-h1, 'M!D814!N<-19', color=cc[0], size=1.3

x=modmu814
y=modre814kpc
z=modlogn
xer=modermu814
yer=moderre814kpc
zer=moderlogn
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

rm=stdev(del^2)
print, "DEX(tot)=", sqrt(rm[0])
xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
oplot, [-0.45-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
box, [-0.50-v,0.55-h],[0.9-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


x=modmu814[where(modmag ge limag or modmag le dwmag)]
y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
z=modlogn[where(modmag ge limag or modmag le dwmag)]
xer=modermu814[where(modmag ge limag or modmag le dwmag)]
yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
zer=moderlogn[where(modmag ge limag or modmag le dwmag)]
oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
oplot, [-100,100],[-100,100], linestyle=1, thick=5.0




px=-0.50-v
py=0.6
xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.1
xyouts, 1.15,1.0,'(A)', color=cc[0], size=1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
limag=17
dwmag=0

x=modmu814[where(modmag lt limag and modmag ge dwmag)]
y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
z=modlogn[where(modmag lt limag and modmag ge dwmag)]
xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
zer=moderlogn[where(modmag lt limag and modmag ge dwmag)]

;x=modmu814[where(modmu814 lt limag)]
;y=modre814kpc[where(modmu814 lt limag)]
;z=modlogn[where(modmu814 lt limag)]
;xer=modermu814[where(modmu814 lt limag)]
;yer=moderre814kpc[where(modmu814 lt limag)]
;zer=moderlogn[where(modmu814 lt limag)]

h=-0.17
h1=-0.16
plot, [0], /nodata, xthick=4.,ythick=4., charsize=1.4, xrange=[-1.4,1.4], yrange=[-0.5,1.1], xstyle=1, ystyle=1, xtickinterval=0.4, xminor=4., xtitle='a*log(n)+b*<!7l!X!De!N!D>(814)!N+c'
ans=ortptrend(z,x,y)

print, ans
ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
print, ans0
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
print, "DEX=", sqrt(rm[0])
xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
xyouts, -0.30-v, 0.8-h1, 'M!D814!N<-18', color=cc[0], size=1.3

x=modmu814
y=modre814kpc
z=modlogn
xer=modermu814
yer=moderre814kpc
zer=moderlogn
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)


rm=stdev(del^2)
print, "DEX(tot)=", sqrt(rm[0])
xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
oplot, [-0.45-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
box, [-0.50-v,0.55-h],[0.9-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


x=modmu814[where(modmag ge limag or modmag le dwmag)]
y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
z=modlogn[where(modmag ge limag or modmag le dwmag)]
xer=modermu814[where(modmag ge limag or modmag le dwmag)]
yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
zer=moderlogn[where(modmag ge limag or modmag le dwmag)]
oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
oplot, [-100,100],[-100,100], linestyle=1, thick=5.0


px=-0.50-v
py=0.6
xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.1
xyouts, 1.15,1.0,'(B)', color=cc[0], size=1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
limag=19
dwmag=0

x=modmu814[where(modmag lt limag and modmag ge dwmag)]
y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
z=modlogn[where(modmag lt limag and modmag ge dwmag)]
xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
zer=moderlogn[where(modmag lt limag and modmag ge dwmag)]

		;x=modmu814[where(modmu814 lt limag)]
		;y=modre814kpc[where(modmu814 lt limag)]
		;z=modlogn[where(modmu814 lt limag)]
		;xer=modermu814[where(modmu814 lt limag)]
		;yer=moderre814kpc[where(modmu814 lt limag)]
		;zer=moderlogn[where(modmu814 lt limag)]

h=-0.17
h1=-0.16
plot, [0], /nodata, xthick=4.,ythick=4., charsize=1.4, xrange=[-1.4,1.4], yrange=[-0.5,1.1], xstyle=1, ystyle=1, xtickinterval=0.4, xminor=4.
ans=ortptrend(z,x,y)

print, ans
ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
print, ans0
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
print, "DEX=", sqrt(rm[0])
xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
xyouts, -0.30-v, 0.8-h1, 'M!D814!N<-16', color=cc[0], size=1.3

x=modmu814
y=modre814kpc
z=modlogn
xer=modermu814
yer=moderre814kpc
zer=moderlogn
del=abs(ans[0]*z+ans[1]*x+ans[2]-y)
rm=stdev(del^2)
print, "DEX(tot)=", sqrt(rm[0])
xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
oplot, [-0.45-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
box, [-0.50-v,0.55-h],[0.9-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


x=modmu814[where(modmag ge limag or modmag le dwmag)]
y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
z=modlogn[where(modmag ge limag or modmag le dwmag)]
xer=modermu814[where(modmag ge limag or modmag le dwmag)]
yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
zer=moderlogn[where(modmag ge limag or modmag le dwmag)]
oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
oplot, [-100,100],[-100,100], linestyle=1, thick=5.0



!x.tickformat=xthickformat_origin
!x.tickname=xthickname_origin
!p.charsize=1.4
AXIS, XAXIS=0,xrange=[-1.4,1.4], xstyle=1, xtickinterval=0.4, xminor=4, /noerase, xtitle='a*log(n)+b*<!7l!X!De!N!D>(814)!N+c'

px=-0.50-v
py=0.6
xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
		;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.1
xyouts, 1.15,1.0,'(C)', color=cc[0], size=1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;multiplot
;limag=17
;dwmag=15

;x=modmu814[where(modmag lt limag and modmag ge dwmag)]
;y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
;z=modlogn[where(modmag lt limag and modmag ge dwmag)]
;xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
;yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
;zer=moderlogn[where(modmag lt limag and modmag ge dwmag)]

		;x=modmu814[where(modmu814 lt limag)]
		;y=modre814kpc[where(modmu814 lt limag)]
		;z=modlogn[where(modmu814 lt limag)]
		;xer=modermu814[where(modmu814 lt limag)]
		;yer=moderre814kpc[where(modmu814 lt limag)]
		;zer=moderlogn[where(modmu814 lt limag)]

;h=-0.17
;h1=-0.16
;plot, [0], /nodata, xthick=4.,ythick=4., charsize=1.4, xrange=[-1.4,1.4], yrange=[-0.5,1.1], xstyle=1, ystyle=1, xtickinterval=0.4, xminor=4., xtitle='a*log(n)+b*<!7l!X!De!N!D>(814)!N+c',ytitle='log(R!De!N) [kpc]'
;ans=ortptrend(z,x,y)

;print, ans
;ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
;print, ans0
;del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

;rm=stdev(del^2)
;print, "DEX=", sqrt(rm[0])
;xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
;oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



;oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
;oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
;xyouts, -0.30-v, 0.8-h1, '-20<M!D814!N<-18', color=cc[0], size=1.3

;x=modmu814
;y=modre814kpc
;z=modlogn
;xer=modermu814
;yer=moderre814kpc
;zer=moderlogn
;del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

;rm=stdev(del^2)
;print, "DEX(tot)=", sqrt(rm[0])
;xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
;oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
;oplot, [-0.45-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
;box, [-0.50-v,0.55-h],[0.9-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2];


;x=modmu814[where(modmag ge limag or modmag le dwmag)]
;y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
;z=modlogn[where(modmag ge limag or modmag le dwmag)]
;xer=modermu814[where(modmag ge limag or modmag le dwmag)]
;yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
;zer=moderlogn[where(modmag ge limag or modmag le dwmag)]
;oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
;oplot, [-100,100],[-100,100], linestyle=1, thick=5.0

;px=-0.50-v
;py=0.6
;xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
		;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.1
;xyouts, 1.15,1.0,'(D)', color=cc[0], size=1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;multiplot
;limag=19
;dwmag=17

;x=modmu814[where(modmag lt limag and modmag ge dwmag)]
;y=modre814kpc[where(modmag lt limag and modmag ge dwmag)]
;z=modlogn[where(modmag lt limag and modmag ge dwmag)]
;xer=modermu814[where(modmag lt limag and modmag ge dwmag)]
;yer=moderre814kpc[where(modmag lt limag and modmag ge dwmag)]
;zer=moderlogn[where(modmag lt limag and modmag ge dwmag)]

		;x=modmu814[where(modmu814 lt limag)]
		;y=modre814kpc[where(modmu814 lt limag)]
		;z=modlogn[where(modmu814 lt limag)]
		;xer=modermu814[where(modmu814 lt limag)]
		;yer=moderre814kpc[where(modmu814 lt limag)]
		;zer=moderlogn[where(modmu814 lt limag)]

;h=-0.17
;h1=-0.16
;plot, [0], /nodata, xthick=4.,ythick=4., charsize=1.4, xrange=[-1.4,1.4], yrange=[-0.5,1.1], xstyle=1, ystyle=1, xtickinterval=0.4, xminor=4., xtitle='a*log(n)+b*<!7l!X!De!N!D>(814)!N+c'
;ans=ortptrend(z,x,y)

;print, ans
;ans0=ortptrenderror(z,x,y,zer,xer,yer,iter)
;print, ans0
;del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

;rm=stdev(del^2)
;print, "DEX=", sqrt(rm[0])
;xyouts, -0.30-v, 0.70-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
;oplot, [-0.35-v], [0.715-h1], psym= yoursymbol(27,color=cc[50])



;oplot, ans[0]*z+ans[1]*x+ans[2], y, psym= yoursymbol(27,color=cc[50])
;oplot, [-0.35-v], [0.815-h1], psym= yoursymbol(27,color=cc[50])
;xyouts, -0.30-v, 0.8-h1, '-18<M!D814!N<-16', color=cc[0], size=1.3

;x=modmu814
;y=modre814kpc
;z=modlogn
;xer=modermu814
;yer=moderre814kpc
;zer=moderlogn
;del=abs(ans[0]*z+ans[1]*x+ans[2]-y)

;rm=stdev(del^2)
;print, "DEX(tot)=", sqrt(rm[0])
;xyouts, -0.30-v, 0.60-h1, 'RMS: '+strtrim(string(sqrt(rm[0]), FORMAT='(F5.3)'),2)+' DEX', color=cc[0], size=1.3
;oplot, [-0.35-v], [0.615-h1], psym= yoursymbol(27,color=cc[50])
;oplot, [-0.45-v], [0.615-h1], psym= yoursymbol(25,color=cc[30])
;box, [-0.50-v,0.55-h],[0.9-v,0.86-h], linestyle=0, color=cc[0], thick=2.  ; [x1,y1] [x2,y2]


;x=modmu814[where(modmag ge limag or modmag le dwmag)]
;y=modre814kpc[where(modmag ge limag or modmag le dwmag)]
;z=modlogn[where(modmag ge limag or modmag le dwmag)]
;xer=modermu814[where(modmag ge limag or modmag le dwmag)]
;yer=moderre814kpc[where(modmag ge limag or modmag le dwmag)]
;zer=moderlogn[where(modmag ge limag or modmag le dwmag)]
;oplot, ans[0]*z+ans[1]*x+ans[2], y,psym= yoursymbol(25,color=cc[30])
;oplot, [-100,100],[-100,100], linestyle=1, thick=5.0


;px=0.3
;py=0.2
;xyouts, px,py,'a='+strtrim(string(ans[0], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[3], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, px,py-0.1,'b='+strtrim(string(ans[1], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[4], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
;xyouts, px,py-0.2,'c='+strtrim(string(ans[2], FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(ans0[5], FORMAT='(F5.2)'),2), color=cc[0], size=1.2
		;xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.1
;xyouts, 1.15,1.0,'(E)', color=cc[0], size=1.1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


ps_off

end