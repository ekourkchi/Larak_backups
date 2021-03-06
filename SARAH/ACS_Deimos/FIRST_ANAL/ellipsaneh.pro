pro ellipsaneh, ID, N, X0, Y0, PA, SMA, e

; X0 and Y0 are the coordinates of ellipse centre
; PA (Degree- Position Angle) Counterclock-wise from y+
; SMA : Semi-Major Axis of ellipse
; e : ellipticity   >>>  SMB= (1-e)*SMA


;  m by n matrix  (m columns, n rows)

;16_1166.ver2.5.iraf.cl
;16_1166.gal.out.ver2.5.galaxy.fits

;strsplit(s,'x0=',/extract)

file=strtrim(ID,2)+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.fits"
print, file
fits_read, file, image, h
nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')

smb = (1.-e) * sma
parad= !pi*pa/180.
;print, parad
;plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3,  xrange=[0, naxis1],yrange=[0, naxis2]

;xf10=10000
;yf10=10000

xf10=1
yf10=1


xf20=1
yf20=1


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

endfor

;oplot, xf10, yf10, psym=1
;oplot, xf20, yf20, psym=1


for i=1,n_elements(xf10)-1 do begin

image[xf10[i]-1,yf10[i]-1]=5.

endfor

for i=1,n_elements(xf20)-1 do begin

image[xf20[i]-1,yf20[i]-1]=5.

endfor

file=strtrim(ID,2)+"_"+strtrim(N,2)+".gal.out.ver2.5.galaxy.testIDL.fits"
fits_write, file, image, h

end
