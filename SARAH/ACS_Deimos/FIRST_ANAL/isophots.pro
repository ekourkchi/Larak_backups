pro isophots,ID,N,N475,GMP

; X0 and Y0 are the coordinates of ellipse centre
; PA (Degree- Position Angle) Counterclock-wise from y+
; SMA : Semi-Major Axis of ellipse
; e : ellipticity   >>>  SMB= (1-e)*SMA


;  m by n matrix  (m columns, n rows)




	;idfile='gmp_id814-475.txt'
	;readcol, idfile, all_gmp, all_ID, all_N814, all_N475,  format='I,I,I,I', /SILENT

	;openw, out, 'output.new.txt' , /get_lun

;
	;for ids=0, n_elements(all_ID)-1 do begin
	;ID=all_ID[ids]
	;N=all_N814[ids]
	;N475=all_N475[ids]
	;GMP=all_gmp[ids]


	;print, n_elements(all_ID), ids+1, ID, N, N475, gmp





if id gt 9 then strID=strtrim(ID,2) else strID='0'+strtrim(ID,2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
psout=strID+"_"+strtrim(N,2)+"_"+strtrim(N475,2)+"_gmp"+strtrim(gmp,2)+"_color_gradient.ps"
!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=18,ysize=15, scale_factor=0.8;, 
;, SET_FONT="Times-Roman"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

file=strID+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.fits"
fits_read, file, image, h
nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

file=strID+"_"+strtrim(N,2)+".badmap.ver2.5.fits"
fits_read, file, bad814, h0

readcol, strID+"_"+strtrim(N,2)+".ver2.5.iraf.cl", strx0814, stry0814,  /SILENT , SKIPLINE =9 , NUMLINE =1, FORMAT='X,X,X,A,A,X,X,X,X,X'
x0814=double(strmid(strx0814,3,strlen(strx0814)))
y0814=double(strmid(strx0814,3,strlen(strx0814)))

;print, strx0814, stry0814
;print, x0814, y0814
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, strID+"_"+strtrim(N,2)+".galfit.ver2.5", re, format='X,X,X,X,X,X,D', SKIPLINE =7 , NUMLINE =1, /SILENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file475="../"+strID+"_"+strtrim(N475,2)+".gal.out.475.ver2.5.galaxy.fits"
fits_read, file475, image475, h1
nx475= sxpar(h1,'NAXIS1')
ny475= sxpar(h1,'NAXIS2')

file="../"+strID+"_"+strtrim(N475,2)+".badmap.475.ver2.5.fits"
fits_read, file, bad475, h00

readcol, "../"+strID+"_"+strtrim(N475,2)+".475.ver2.5.iraf.cl", strx0475, stry0475,  /SILENT , SKIPLINE =9 , NUMLINE =1, FORMAT='X,X,X,A,A,X,X,X,X,X'
x0475=double(strmid(strx0475,3,strlen(strx0475)))
y0475=double(strmid(strx0475,3,strlen(strx0475)))
;print, strx0475, stry0475
;print, x0475, y0475
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
delx=x0475-x0814
dely=y0475-y0814
;help , delx, dely
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

isophots_file=strID+"_"+strtrim(N,2)+".ver2.5.isogal.txt"

readcol, isophots_file, aSMA,aINTENS,aINT_ERR,aELLIP,aELLIP_ERR,aPA,aPA_ERR,aX0,aX0_ERR,aY0,aY0_ERR,aMAG, format='D,D,D,X,X,D,D,D,D,D,D,D,D,X,X,X,X,D', /SILENT, SKIPLINE=42


del_mag0=1
del_mag_err0=1
norm_radius0=1



for J=0, n_elements(aSMA)-1,1  do begin
X0=aX0[J]
Y0=aY0[J]
PA=aPA[J]
SMA=aSMA[J]
e=aELLIP[J]
;print, j

smb = (1.-e) * sma
parad= !pi*pa/180.


;print, parad
;plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3,  xrange=[0, naxis1],yrange=[0, naxis2]



s475=1
s8114=1

s8140=1
s4750=1


ntik=1.0
tik=(floor(smb)-ceil(-smb))*ntik
for i=0, tik do begin


x=i*(floor(smb)-ceil(-smb))/ntik+ ceil(-smb)
y1= sma*sqrt(1-x*x/smb/smb)
y2= -sma*sqrt(1-x*x/smb/smb)


xf1=x*cos(parad)-y1*sin(parad)+x0
yf1=x*sin(parad)+y1*cos(parad)+y0

xf2=x*cos(parad)-y2*sin(parad)+x0
yf2=x*sin(parad)+y2*cos(parad)+y0

if xf1 ge 1 and xf1 le nx and yf1 ge 1 and yf1 le ny then begin
xb=floor(xf1)
xt=ceil(xf1)
yb=floor(yf1)
yt=ceil(yf1)

d1=1./((xf1-xb)^2+(yf1-yb)^2)
d2=1./((xf1-xt)^2+(yf1-yb)^2)
d3=1./((xf1-xb)^2+(yf1-yt)^2)
d4=1./((xf1-xt)^2+(yf1-yt)^2)

if bad814[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad814[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad814[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad814[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s814= (w1*d1*image[xb-1,yb-1] + w2*d2*image[xt-1,yb-1] + w3*d3*image[xb-1,yt-1] + w4*d4*image[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s8140=[s8140,s814]
endif 

if xf2 ge 1 and xf2 le nx and yf2 ge 1 and yf2 le ny then begin
xb=floor(xf2)
xt=ceil(xf2)
yb=floor(yf2)
yt=ceil(yf2)

d1=1./((xf2-xb)^2+(yf2-yb)^2)
d2=1./((xf2-xt)^2+(yf2-yb)^2)
d3=1./((xf2-xb)^2+(yf2-yt)^2)
d4=1./((xf2-xt)^2+(yf2-yt)^2)

if bad814[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad814[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad814[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad814[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s814= (w1*d1*image[xb-1,yb-1] + w2*d2*image[xt-1,yb-1] + w3*d3*image[xb-1,yt-1] + w4*d4*image[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s8140=[s8140,s814]
endif



xf1+=delx
yf1+=dely
xf2+=delx
yf2+=dely
if xf1 ge 1 and xf1 le nx475 and yf1 ge 1 and yf1 le ny475 then begin
xb=floor(xf1)
xt=ceil(xf1)
yb=floor(yf1)
yt=ceil(yf1)

d1=1./((xf1-xb)^2+(yf1-yb)^2)
d2=1./((xf1-xt)^2+(yf1-yb)^2)
d3=1./((xf1-xb)^2+(yf1-yt)^2)
d4=1./((xf1-xt)^2+(yf1-yt)^2)

if bad475[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad475[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad475[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad475[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s475= (w1*d1*image475[xb-1,yb-1] + w2*d2*image475[xt-1,yb-1] + w3*d3*image475[xb-1,yt-1] + w4*d4*image475[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s4750=[s4750,s475]
endif 
if xf2 ge 1 and xf2 le nx475 and yf2 ge 1 and yf2 le ny475 then begin
xb=floor(xf2)
xt=ceil(xf2)
yb=floor(yf2)
yt=ceil(yf2)

d1=1./((xf2-xb)^2+(yf2-yb)^2)
d2=1./((xf2-xt)^2+(yf2-yb)^2)
d3=1./((xf2-xb)^2+(yf2-yt)^2)
d4=1./((xf2-xt)^2+(yf2-yt)^2)

if bad475[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad475[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad475[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad475[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s475= (w1*d1*image475[xb-1,yb-1] + w2*d2*image475[xt-1,yb-1] + w3*d3*image475[xb-1,yt-1] + w4*d4*image475[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s4750=[s4750,s475]
endif

endfor



tik=(floor(sma)-ceil(-sma))*ntik
for i=0, tik do begin
y=i*(floor(sma)-ceil(-sma))/ntik+ ceil(-sma)

x1= smb*sqrt(1-y*y/sma/sma)
x2= -smb*sqrt(1-y*y/sma/sma)


xf1=x1*cos(parad)-y*sin(parad)+x0
yf1=x1*sin(parad)+y*cos(parad)+y0

xf2=x2*cos(parad)-y*sin(parad)+x0
yf2=x2*sin(parad)+y*cos(parad)+y0


if xf1 ge 1 and xf1 le nx and yf1 ge 1 and yf1 le ny then begin
xb=floor(xf1)
xt=ceil(xf1)
yb=floor(yf1)
yt=ceil(yf1)

d1=1./((xf1-xb)^2+(yf1-yb)^2)
d2=1./((xf1-xt)^2+(yf1-yb)^2)
d3=1./((xf1-xb)^2+(yf1-yt)^2)
d4=1./((xf1-xt)^2+(yf1-yt)^2)

if bad814[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad814[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad814[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad814[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s814= (w1*d1*image[xb-1,yb-1] + w2*d2*image[xt-1,yb-1] + w3*d3*image[xb-1,yt-1] + w4*d4*image[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s8140=[s8140,s814]
endif 

if xf2 ge 1 and xf2 le nx and yf2 ge 1 and yf2 le ny then begin
xb=floor(xf2)
xt=ceil(xf2)
yb=floor(yf2)
yt=ceil(yf2)

d1=1./((xf2-xb)^2+(yf2-yb)^2)
d2=1./((xf2-xt)^2+(yf2-yb)^2)
d3=1./((xf2-xb)^2+(yf2-yt)^2)
d4=1./((xf2-xt)^2+(yf2-yt)^2)

if bad814[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad814[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad814[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad814[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s814= (w1*d1*image[xb-1,yb-1] + w2*d2*image[xt-1,yb-1] + w3*d3*image[xb-1,yt-1] + w4*d4*image[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s8140=[s8140,s814]
endif



xf1+=delx
yf1+=dely
xf2+=delx
yf2+=dely
if xf1 ge 1 and xf1 le nx475 and yf1 ge 1 and yf1 le ny475 then begin
xb=floor(xf1)
xt=ceil(xf1)
yb=floor(yf1)
yt=ceil(yf1)

d1=1./((xf1-xb)^2+(yf1-yb)^2)
d2=1./((xf1-xt)^2+(yf1-yb)^2)
d3=1./((xf1-xb)^2+(yf1-yt)^2)
d4=1./((xf1-xt)^2+(yf1-yt)^2)

if bad475[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad475[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad475[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad475[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s475= (w1*d1*image475[xb-1,yb-1] + w2*d2*image475[xt-1,yb-1] + w3*d3*image475[xb-1,yt-1] + w4*d4*image475[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s4750=[s4750,s475]
endif 
if xf2 ge 1 and xf2 le nx475 and yf2 ge 1 and yf2 le ny475 then begin
xb=floor(xf2)
xt=ceil(xf2)
yb=floor(yf2)
yt=ceil(yf2)

d1=1./((xf2-xb)^2+(yf2-yb)^2)
d2=1./((xf2-xt)^2+(yf2-yb)^2)
d3=1./((xf2-xb)^2+(yf2-yt)^2)
d4=1./((xf2-xt)^2+(yf2-yt)^2)

if bad475[xb-1,yb-1] eq 0  then  w1=1 else w1=0
if bad475[xt-1,yb-1] eq 0  then  w2=1 else w2=0
if bad475[xb-1,yt-1] eq 0  then  w3=1 else w3=0
if bad475[xt-1,yt-1] eq 0  then  w4=1 else w4=0

s475= (w1*d1*image475[xb-1,yb-1] + w2*d2*image475[xt-1,yb-1] + w3*d3*image475[xb-1,yt-1] + w4*d4*image475[xt-1,yt-1])/(w1*d1+w2*d2+w3*d3+w4*d4)
s4750=[s4750,s475]
endif

endfor

;oplot, xf10, yf10, psym=1
;oplot, xf20, yf20, psym=1

;print , 'aaaaaaaaaaaaaaaaa'
;print, n_elements(xf10)
;help, xf20
;help, yf20

;print , 'bbbbbbbbbbbbbbbbbb'
;print, n_elements(xf10475)
;help, xf20475
;help, yf20475


s8140=s8140[1:n_elements(s8140)-1]
s4750=s4750[1:n_elements(s4750)-1]

isointensity814= stdev(s8140)
isointensity475= stdev(s4750)

;print, isointensity814[0], aINTENS[j], isointensity475[0], 100.*isointensity814[1]/isointensity814[0]
;print, aMAG[j], -2.5*alog10(aINTENS[j])

isomu814=-2.5*alog10(isointensity814[0])+19.43185
isomu475=-2.5*alog10(isointensity475[0])+19.56285
dm814=2.5*isointensity814[1]/isointensity814[0]/alog(10.)
dm475=2.5*isointensity475[1]/isointensity475[0]/alog(10.)
;print, isomu814, isomu475, isomu475-isomu814, sqrt(dm814^2+dm475^2), sqrt(sma*smb), re

del_mag=isomu475-isomu814
del_mag_err=sqrt(dm814^2+dm475^2)
norm_radius=sqrt(sma*smb)/re

del_mag0=[del_mag0,del_mag]
del_mag_err0=[del_mag_err0,del_mag_err]
norm_radius0=[norm_radius0,norm_radius]

endfor


del_mag0=del_mag0[1:n_elements(del_mag0)-1]
del_mag_err0=del_mag_err0[1:n_elements(del_mag_err0)-1]
norm_radius0=norm_radius0[1:n_elements(norm_radius0)-1]


xtitl="log (R/R!De!N)"
ytitl="!7l!X!D475!N - !7l!X!D814!N  [mag arcsec!U-2!N]"
plot, [0], /nodata, xrange=[min(alog10(norm_radius0)), min([max(alog10(norm_radius0)),0.5])], yrange=[min(del_mag0)-0.5,2],  xthick=3.,ythick=3., xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1,charsize=1.3
oploterror, alog10(norm_radius0), del_mag0, 0.*del_mag0, del_mag_err0, psym=2., /nohat, ERRCOLOR=cc[38]


a=alog10(norm_radius0)
filt=0
for khi=0, n_elements(norm_radius0)-1 do if norm_radius0[khi] le 1.0  then filt=[filt,khi]
filt=filt[1:n_elements(filt)-1]

;print,filt
a=a(filt)
b=del_mag0(filt)
erb=del_mag_err0(filt)
trend=ltrend(a,b,erb)
oplot, [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2., color=cc[50], thick=4
;oplot, [alog10(1.5/re),alog10(1.5/re)], [-10,10.0], linestyle=1., color=cc[30], thick=4


xyouts, min(alog10(norm_radius0))+0.3, 1.85, 'GMP: '+strtrim(GMP,2), size=1.3 , color=cc[0]

xyouts, min(alog10(norm_radius0))+0.3, 0.5, 'R!De!N: '+strtrim(string(Re*0.05, FORMAT='(F6.1)'),2)+' [arcsec]    (' +strtrim(string(Re*0.463*0.05, FORMAT='(F6.1)'),2)+' kpc)', size=1.3 , color=cc[0]

xyouts, min(alog10(norm_radius0))+0.3, 1.72, '!7a!X='  +strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2], FORMAT='(F6.2)'),2) , size=1.3 , color=cc[50]
xyouts, min(alog10(norm_radius0))+0.3, 1.59, '!7b!X='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3], FORMAT='(F6.2)'),2), size=1.3, color=cc[50]

	;printf,  out, gmp, trend[0], trend[1], trend[2], trend[3]




;--------------------------------------------------------------------------------
; Here, the color of the galaxy body is derived
filt=0
for khi=0, n_elements(norm_radius0)-1 do if norm_radius0[khi] le 1.0  and alog10(norm_radius0[khi]) ge -1.0  then filt=[filt,khi]
filt=filt[1:n_elements(filt)-1]
b1=del_mag0(filt)
b1=median(b1)

a=alog10(norm_radius0)
a=a(filt)
b=del_mag0(filt)
erb=del_mag_err0(filt)
trend=ltrend(a,b,erb)
oplot, [-10,10], trend[0]*[-10,10]+trend[1], linestyle=1., color=cc[30], thick=4
	;printf,  out, gmp, trend[0], trend[1], trend[2], trend[3]

xyouts, min(alog10(norm_radius0))+1.2, 1.72, '!7a!X!D0!N='  +strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2], FORMAT='(F6.2)'),2) , size=1.3 , color=cc[30]
xyouts, min(alog10(norm_radius0))+1.2, 1.59, '!7b!X!D0!N='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3], FORMAT='(F6.2)'),2), size=1.3, color=cc[30]

;--------------------------------------------------------------------------------

radius=0
for khi=0, n_elements(norm_radius0)-1 do radius=[radius,re*norm_radius0[khi]]
radius=radius[1:n_elements(radius)-1]

;print, radius

;--------------------------------------------------------------------------------
; Here, the color of the galaxy core is derived
filt=0
for khi=0, n_elements(norm_radius0)-1 do if Radius[khi] le 1.0 then filt=[filt,khi]

if n_elements(filt) eq 1 then begin
filt=0
for khi=0, n_elements(norm_radius0)-1 do if Radius[khi] le 5.0 then filt=[filt,khi]
endif 

filt=filt[1:n_elements(filt)-1]
b2=del_mag0(filt)
b2=median(b2)
;--------------------------------------------------------------------------------




;printf,  out, gmp, b1-b2


ps_off
	;endfor

	;close,out
	;free_lun,out

end
