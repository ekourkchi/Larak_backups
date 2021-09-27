;===============================================================
;no26 elasn start 
pro plotfebm

makepsplots = 1
if (makepsplots eq 1) then begin
    set_plot,'ps'
    !p.font = -1
;     device,/landscape
;    !P.MULTI=[0,1,1]
;    !P.MULTI=[0,5,1]
;    device
    device,/portrait,xsize=6,ysize=6,xoffset=2.0,yoffset=5.0
;    device,/landscape
    endif
if (makepsplots eq 1) then begin device,filename='radover.ps'
   endif

!x.charsize=1.0
!y.charsize=1.0
!p.charsize=0.4
!p.thick=3.
!p.charthick=3.

!p.font=6
!x.ticklen=0.04
;!p.color=1
;!p.background=256

;a=findgen(32)*(!pi*2/32.0)
;usersym,(cos(a))/3,(sin(a))/3,/fill


imagesizes=20.0


;=====================================
;Plot162.50421666652 59.186566666762

im2 = readfits( 'J105001+591111.fits',h2)   
statsrad=moment(im2,sdev=sdev)
medianvalrad=median(im2)
minrad=-2.0*sdev
;minrad=0
maxrad=max(im2)
print,statsrad,medianvalrad,'sdev=',sdev,minrad,maxrad

imr = readfits( 'k1.fits',head_only)   
print,'read 3059'
sdr=sdev
print,'sdr=',sdr

sdr=0.0002 ;sdev ; Jy/beam

;pixsca=0.216
;idcenx=306
;idceny=336
;xmin=idcenx-(imagesizes/(2.0*pixsca))
;xmax=idcenx+(imagesizes/(2.0*pixsca))
;ymin=idceny-(imagesizes/(2.0*pixsca))
;ymax=idceny+(imagesizes/(2.0*pixsca))
;imrneg=imr[xmin:xmax,ymin:ymax]*(-1.0)
imrneg=imr*(-1.0)
s=size(imrneg)
stats=moment(imrneg,sdev=sdev)
medianval=median(imrneg)
minr=medianval-4.*1.0*sdev
maxr=medianval+1.5*1.0*sdev
print,stats,sdev

;minr=-625
;maxr=-600
print,minr


   icplot, imrneg, min=minr, max=maxr, full=full
print,'here',minrad,maxrad


iccontour,im2,h2,type=1,/Noerase,/rdgrid,thick=2,col=0,$
levels=[sdr,2.*sdr,4.*sdr,8.*sdr, 16.*sdr,32.*sdr,64.*sdr] ,$
           subtitle=' '

;iccontour,im2,h2,type=1,/Noerase,/rdgrid,thick=2,col=0,$
;levels=[10.] ,$
;           subtitle=' '

;          max_value=maxrad, min_value=0,nlevels=7

;	levels = 10^(findgen(9)*alog10(maxrad))
;	          levels = findgen(9) *((maxrad)/9.0)




	
;+ 2.*minrad

; xyouts,48,40,'c',size=0.6

;px = !x.window*!D.x_vsize
;py = !y.window*!D.y_vsize
;sx = px(1)-px(0)+1 & sy = py(1)-py(0)+1
;erase
;print,sx,sy,!x.window,!y.window,!D.x_vsize,!D.y_vsize
;tv,congrid(imr,sx,sy),px(0),py(0)
;iccontour,im2,h2,nlevels=7,type=1,/Noerase,thick=3 
;print,'here'

print,size(imr),size(im2)

if (makepsplots eq 1) then device, /close

set_plot,'x'
end

;=====================================================================


