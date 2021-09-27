pro contorzane

; X0 and Y0 are the coordinates of ellipse centre
; PA (Degree- Position Angle) Counterclock-wise from y+
; SMA : Semi-Major Axis of ellipse
; e : ellipticity   >>>  SMB= (1-e)*SMA


;  m by n matrix  (m columns, n rows)

;16_1166.ver2.5.iraf.cl
;16_1166.gal.out.ver2.5.galaxy.fits

;strsplit(s,'x0=',/extract)


idfile='id814-475.txt'
readcol, idfile, all_ID, all_N814, all_N475,  format='I,I,I', /SILENT

for ids=0, n_elements(all_ID)-1 do begin
ID=all_ID[ids]
N=all_N814[ids]
N475=all_N475[ids]

print, n_elements(all_ID), ids+1, ID, N, N475


if id gt 9 then strID=strtrim(ID,2) else strID='0'+strtrim(ID,2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file=strID+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.fits"
fits_read, file, image, h
nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

readcol, strID+"_"+strtrim(N,2)+".ver2.5.iraf.cl", strx0814, stry0814,  /SILENT , SKIPLINE =9 , NUMLINE =1, FORMAT='X,X,X,A,A,X,X,X,X,X'
x0814=double(strmid(strx0814,3,strlen(strx0814)))
y0814=double(strmid(strx0814,3,strlen(strx0814)))

;print, strx0814, stry0814
;print, x0814, y0814
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file475="../"+strID+"_"+strtrim(N475,2)+".gal.out.475.ver2.5.galaxy.fits"
fits_read, file475, image475, h1
nx475= sxpar(h1,'NAXIS1')
ny475= sxpar(h1,'NAXIS2')

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

isophots=strID+"_"+strtrim(N,2)+".ver2.5.isogal.txt"

readcol, isophots, aSMA,aINTENS,aINT_ERR,aELLIP,aELLIP_ERR,aPA,aPA_ERR,aX0,aX0_ERR,aY0,aY0_ERR,aMAG, format='D,D,D,X,X,D,D,D,D,D,D,D,D,X,X,X,X,D', /SILENT, SKIPLINE=42

openw, out814, strID+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.withISOPHOTS.reg", /get_lun
openw, out475, "../"+strID+"_"+strtrim(N475,2)+".gal.out.475.ver2.5.galaxy.withISOPHOTS.reg", /get_lun


for J=0, n_elements(aSMA)-1,3  do begin
X0=aX0[J]
Y0=aY0[J]
PA=aPA[J]
SMA=aSMA[J]
e=aELLIP[J]
;print, j

smb = (1.-e) * sma
parad= !pi*pa/180.

st814="image;ellipse("+strtrim(X0,2)+ ","+ strtrim(Y0,2)+ ","+ strtrim(SMA,2)+ ","+ strtrim(SMB,2)+ ","+ strtrim(90.+PA,2)+ ")  #color=red"
st475="image;ellipse("+strtrim(X0+delx,2)+ ","+ strtrim(Y0+dely,2)+ ","+ strtrim(SMA,2)+ ","+ strtrim(SMB,2)+ ","+ strtrim(90.+PA,2)+ ")  # color=red"
printf, out814, st814
printf, out475, st475



;print, parad
;plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3,  xrange=[0, naxis1],yrange=[0, naxis2]

;xf10=10000
;yf10=10000

xf10=1
yf10=1


xf20=1
yf20=1

xf10475=1
yf10475=1


xf20475=1
yf20475=1

for i=ceil(-smb), floor(smb) do begin

x=i*1.
y1= sma*sqrt(1-x*x/smb/smb)
y2= -sma*sqrt(1-x*x/smb/smb)


xf1=x*cos(parad)-y1*sin(parad)+x0
yf1=x*sin(parad)+y1*cos(parad)+y0

xf2=x*cos(parad)-y2*sin(parad)+x0
yf2=x*sin(parad)+y2*cos(parad)+y0

if xf1 ge 1 and xf1 le nx and yf1 ge 1 and yf1 le ny then begin
xf10=[xf10,round(xf1)]
yf10=[yf10,round(yf1)]
endif 

if xf2 ge 1 and xf2 le nx and yf2 ge 1 and yf2 le ny then begin
xf20=[xf20,round(xf2)]
yf20=[yf20,round(yf2)]
endif



xf1+=delx
yf1+=dely
xf2+=delx
yf2+=dely
if xf1 ge 1 and xf1 le nx475 and yf1 ge 1 and yf1 le ny475 then begin
xf10475=[xf10475,round(xf1)]
yf10475=[yf10475,round(yf1)]
endif 
if xf2 ge 1 and xf2 le nx475 and yf2 ge 1 and yf2 le ny475 then begin
xf20475=[xf20475,round(xf2)]
yf20475=[yf20475,round(yf2)]
endif

endfor

for i=-ceil(sma), floor(sma) do begin
y=i*1.
x1= smb*sqrt(1-y*y/sma/sma)
x2= -smb*sqrt(1-y*y/sma/sma)


xf1=x1*cos(parad)-y*sin(parad)+x0
yf1=x1*sin(parad)+y*cos(parad)+y0

xf2=x2*cos(parad)-y*sin(parad)+x0
yf2=x2*sin(parad)+y*cos(parad)+y0


if xf1 ge 1 and xf1 le nx and yf1 ge 1 and yf1 le ny then begin
xf10=[xf10,round(xf1)]
yf10=[yf10,round(yf1)]
endif

if xf2 ge 1 and xf2 le nx and yf2 ge 1 and yf2 le ny then begin
xf20=[xf20,round(xf2)]
yf20=[yf20,round(yf2)]
endif


xf1+=delx
yf1+=dely
xf2+=delx
yf2+=dely
if xf1 ge 1 and xf1 le nx475 and yf1 ge 1 and yf1 le ny475 then begin
xf10475=[xf10475,round(xf1)]
yf10475=[yf10475,round(yf1)]
endif 
if xf2 ge 1 and xf2 le nx475 and yf2 ge 1 and yf2 le ny475 then begin
xf20475=[xf20475,round(xf2)]
yf20475=[yf20475,round(yf2)]
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


for i=1,n_elements(xf10)-1    do   image[xf10[i]-1,yf10[i]-1]=300.

for i=1,n_elements(xf20)-1    do   image[xf20[i]-1,yf20[i]-1]=300.

for i=1,n_elements(xf10475)-1    do  image475[xf10475[i]-1,yf10475[i]-1]=300.

for i=1,n_elements(xf20475)-1 do image475[xf20475[i]-1,yf20475[i]-1]=300.







endfor



file=strID+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.withISOPHOTS.fits"
fits_write, file, image, h

file="../"+strID+"_"+strtrim(N475,2)+".gal.out.475.ver2.5.galaxy.withISOPHOTS.fits"
fits_write, file, image475, h


close,out814
free_lun,out814

close,out475
free_lun,out475

endfor

end
