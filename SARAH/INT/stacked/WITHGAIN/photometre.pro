pro photometre, str

ID='STACK_'+str+'_R.gain'
sdss1=ID+'.sdss1'
sdss2=ID+'.sdss2'



readcol, sdss1, no, ximage, yimage, wcs1, wcs2, magaut, magauterr
readcol, sdss2, name,objID,ra,dec,type,sdssu,sdssg,sdssr,sdssi,sdssz,R1,R2, format='F,D,D,D,A,D,D,D,D,D,D,D'


siz=n_elements(no)
print, n_elements(no)
print, n_elements(name)
;openw, out, output, /get_lun
;openw, out0, output0, /get_lun

;help, type


R=0.5*(R1+R2)
deltot=magaut-R


sumtot=0.
sumstar=0.
sumtot2=0.
sumstar2=0.
check=0
for i=0, siz-1 do begin
sumtot=sumtot+(deltot[i])
sumtot2=sumtot2+(deltot[i])*(deltot[i])

if strtrim(type[i],2) eq 'STAR' then begin
	if check eq 0 then delstar=deltot[i] else delstar=[delstar,deltot[i]]
sumstar=sumstar+(deltot[i])
sumstar2=sumstar2+(deltot[i])*(deltot[i])
check++
endif

endfor


;print, 'Total Median=', median(deltot)
;print, 'STAR Median=', median(delstar)

meantot=sumtot/siz
meanstar=sumstar/check
meantot2=sumtot2/siz
meanstar2=sumstar2/check

;print, 'Total MEAN=', meantot
;print, 'STAR MEAN=', meanstar
print, '             MEDIAN        MEAN             SIGMA'
print, 'Total :', median(deltot),meantot,sqrt(meantot2-meantot*meantot)
print, 'STAR  :', median(delstar),meanstar,sqrt(meanstar2-meanstar*meanstar)



minn=floor(meantot*10)/10.-0.6
maxx=floor(meantot*10)/10.+0.6
hist=Histogram(deltot, binsize=0.1,min=minn,max=maxx)
;print, minn
;print, maxx
x=findgen(floor((maxx-minn)*10)+1)/10.+minn
;print, x
ps_on , ID+'.ps',  noask='y', /color, cc=cc

!p.font=0.
plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.0, xtickinterval=0.2, xminor=2, xrange=[minn,maxx], yrange=[0,max(hist)+10.], yminor=5, xtitle='Delta R Magnitude (image-SDSS)', ytitle='!6Number of Objects',title='!6Delta Mag. Histogram ('+str+')', color=cc[0]

hist=Histogram(deltot, binsize=0.1,min=minn,max=maxx)
hist1=Histogram(delstar, binsize=0.1,min=minn,max=maxx)

;print, hist
;------------------------------------------------------------
item='All OBJECTS'
lstyl=0
lstyle=lstyl
colorss=50
c_colors=colorss
oplot, x,hist,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
item=[item,'STARS (SDSS)']
lstyl=3
lstyle=[lstyle,lstyl]
colorss=30
c_colors=[c_colors,colorss]
oplot, x,hist1,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors ,/clear,/right_legend, charsize=1.0


;close,out
;free_lun,out
;close,out0
;free_lun,out0



sumtot=0.
sumstar=0.
sumtot2=0.
sumstar2=0.
check=0
for i=0, siz-1 do begin

if deltot[i] ge minn and deltot[i] le maxx  then begin
	if check eq 0 then selected=deltot[i] else selected=[delstar,deltot[i]]
sumstar=sumstar+(deltot[i])
sumstar2=sumstar2+(deltot[i])*(deltot[i])
check++
endif

endfor
meanstar=sumstar/check
meanstar2=sumstar2/check

print, 'SIG=',sqrt(meanstar2-meanstar*meanstar)
print, 'MEDIAN=', median(selected)



s1='FINAL:'+strtrim(string(median(selected),Format='(F6.2)'),2)
s2='STAR :'+strtrim(string(median(delstar),Format='(F6.2)'),2)
s3='TOTAL:'+strtrim(string(median(deltot),Format='(F6.2)'),2)

s4='SIGMA:'+strtrim(string(sqrt(meanstar2-meanstar*meanstar),Format='(F6.2)'),2)



xyouts, maxx-0.28, max(hist)-60., s2, color=cc[30]
xyouts, maxx-0.28, max(hist)-85., s3, color=cc[50]
xyouts, maxx-0.28, max(hist)-110., s1
xyouts, maxx-0.28, max(hist)-135., s4

ps_off
end