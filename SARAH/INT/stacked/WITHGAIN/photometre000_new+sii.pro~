pro photometre000_new_sii, str


ID='STACK_'+str+'_R.gain'
sdss1='normSTACK_'+str+'_SII.gain.r.sdss1'
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

check_1=0
check_2=0
check_3=0
check_4=0
sumtot_1=0.
sumtot2_1=0.
sumtot_2=0.
sumtot2_2=0.
sumtot_3=0.
sumtot2_3=0.
sumtot_4=0.
sumtot2_4=0.

scheck_1=0
scheck_2=0
scheck_3=0
scheck_4=0
sumstar_1=0.
sumstar2_1=0.
sumstar_2=0.
sumstar2_2=0.
sumstar_3=0.
sumstar2_3=0.
sumstar_4=0.
sumstar2_4=0.


for i=0, siz-1 do begin


;==================================================================================================
if ximage[i] ge 583 and ximage[i] le 3983 and yimage[i] ge 433 and yimage[i] le 2057 then begin
	if check_1 eq 0 then deltot_1=deltot[i] else deltot_1=[deltot_1,deltot[i]]
sumtot_1+=(deltot[i])
sumtot2_1+=(deltot[i])*(deltot[i])
check_1++
endif

if ximage[i] ge 4503 and ximage[i] le 6253 and yimage[i] ge 382 and yimage[i] le 4253 then begin
	if check_2 eq 0 then deltot_2=deltot[i] else deltot_2=[deltot_2,deltot[i]]
sumtot_2+=(deltot[i])
sumtot2_2+=(deltot[i])*(deltot[i])
check_2++
endif

if ximage[i] ge 349 and ximage[i] le 4109 and yimage[i] ge 4573 and yimage[i] le 6341 then begin
	if check_3 eq 0 then deltot_3=deltot[i] else deltot_3=[deltot_3,deltot[i]]
sumtot_3+=(deltot[i])
sumtot2_3+=(deltot[i])*(deltot[i])
check_3++
endif

if ximage[i] ge 326 and ximage[i] le 4030 and yimage[i] ge 2476 and yimage[i] le 4284 then begin
	if check_4 eq 0 then deltot_4=deltot[i] else deltot_4=[deltot_4,deltot[i]]
sumtot_4+=(deltot[i])
sumtot2_4+=(deltot[i])*(deltot[i])
check_4++
endif
;==================================================================================================
;==================================================================================================
if ximage[i] ge 583 and ximage[i] le 3983 and yimage[i] ge 433 and yimage[i] le 2057 and strtrim(type[i],2) eq 'STAR' then begin
	if scheck_1 eq 0 then delstar_1=deltot[i] else delstar_1=[delstar_1,deltot[i]]
sumstar_1+=(deltot[i])
sumstar2_1+=(deltot[i])*(deltot[i])
scheck_1++
endif

if ximage[i] ge 4503 and ximage[i] le 6253 and yimage[i] ge 382 and yimage[i] le 4253  and strtrim(type[i],2) eq 'STAR' then begin
	if scheck_2 eq 0 then delstar_2=deltot[i] else delstar_2=[delstar_2,deltot[i]]
sumstar_2+=(deltot[i])
sumstar2_2+=(deltot[i])*(deltot[i])
scheck_2++
endif

if ximage[i] ge 349 and ximage[i] le 4109 and yimage[i] ge 4573 and yimage[i] le 6341and strtrim(type[i],2) eq 'STAR'  then begin
	if scheck_3 eq 0 then delstar_3=deltot[i] else delstar_3=[delstar_3,deltot[i]]
sumstar_3+=(deltot[i])
sumstar2_3+=(deltot[i])*(deltot[i])
scheck_3++
endif

if ximage[i] ge 326 and ximage[i] le 4030 and yimage[i] ge 2476 and yimage[i] le 4284 and strtrim(type[i],2) eq 'STAR'  then begin
	if scheck_4 eq 0 then delstar_4=deltot[i] else delstar_4=[delstar_4,deltot[i]]
sumstar_4+=(deltot[i])
sumstar2_4+=(deltot[i])*(deltot[i])
scheck_4++
endif
;==================================================================================================


endfor


meantot_1=sumtot_1/check_1
meanstar_1=sumstar_1/scheck_1
meantot2_1=sumtot2_1/check_1
meanstar2_1=sumstar2_1/scheck_1

meantot_2=sumtot_2/check_2
meanstar_2=sumstar_2/scheck_2
meantot2_2=sumtot2_2/check_2
meanstar2_2=sumstar2_2/scheck_2

meantot_3=sumtot_3/check_3
meanstar_3=sumstar_3/scheck_3
meantot2_3=sumtot2_3/check_3
meanstar2_3=sumstar2_3/scheck_3

meantot_4=sumtot_4/check_4
meanstar_4=sumstar_4/scheck_4
meantot2_4=sumtot2_4/check_4
meanstar2_4=sumstar2_4/scheck_4
 
print, '               MEDIAN         MEAN              SIGMA'
print, 'Total_1 :', median(deltot_1),meantot_1,sqrt(meantot2_1-meantot_1*meantot_1)
print, 'Total_2 :', median(deltot_2),meantot_2,sqrt(meantot2_2-meantot_2*meantot_2)
print, 'Total_3 :', median(deltot_3),meantot_3,sqrt(meantot2_3-meantot_3*meantot_3)
print, 'Total_4 :', median(deltot_4),meantot_4,sqrt(meantot2_4-meantot_4*meantot_4)
print, ' '
print, 'STAR_1  :', median(delstar_1),meanstar_1,sqrt(meanstar2_1-meanstar_1*meanstar_1)
print, 'STAR_2  :', median(delstar_2),meanstar_2,sqrt(meanstar2_2-meanstar_2*meanstar_2)
print, 'STAR_3  :', median(delstar_3),meanstar_3,sqrt(meanstar2_3-meanstar_3*meanstar_3)
print, 'STAR_4  :', median(delstar_4),meanstar_4,sqrt(meanstar2_4-meanstar_4*meanstar_4)

print, '2-1  :', median(delstar_2)-median(delstar_1)
print, '3-1  :', median(delstar_3)-median(delstar_1)
print, '4-1  :', median(delstar_4)-median(delstar_1)
;==========================
; PLOT  PLOT
minn=floor(median(deltot)*10)/10.-0.6
maxx=floor(median(deltot)*10)/10.+0.6
x=findgen(floor((maxx-minn)*10)+1)/10.+minn

hist_1=Histogram(deltot_1, binsize=0.1,min=minn,max=maxx)
hist1_1=Histogram(delstar_1, binsize=0.1,min=minn,max=maxx)
hist_2=Histogram(deltot_2, binsize=0.1,min=minn,max=maxx)
hist1_2=Histogram(delstar_2, binsize=0.1,min=minn,max=maxx)
hist_3=Histogram(deltot_3, binsize=0.1,min=minn,max=maxx)
hist1_3=Histogram(delstar_3, binsize=0.1,min=minn,max=maxx)
hist_4=Histogram(deltot_4, binsize=0.1,min=minn,max=maxx)
hist1_4=Histogram(delstar_4, binsize=0.1,min=minn,max=maxx)
floormin=floor(minn/0.2)*0.2
ps_on , 'normSTACK_'+str+'_SII.gain.r.chips.ps',  noask='y', /color, cc=cc

ythickformat_origin=!y.tickformat
ythickname_origin=!y.tickname

multiplot,/reset   

!P.title=str+'  SII'

!p.multi=[0,2,2,0,0]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.6, xtickinterval=0.2, xminor=2, xrange=[minn,maxx], yrange=[0,max(hist_1)+10.], yminor=5, ytickinterval=15., color=cc[0], ytitle='No. of Objects', title=''

;------------------------------------------------------------
item='All OBJECTS'
lstyl=1
lstyle=lstyl
colorss=50
c_colors=colorss
oplot, x,hist_1,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
item=[item,'STARS (SDSS)']
lstyl=0
lstyle=[lstyle,lstyl]
colorss=30
c_colors=[c_colors,colorss]
oplot, x,hist1_1,  psym=10., thick=2., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
hh=0.8*ceil((max(hist_1)+10.)/15.)*15.
hh1=0.78*ceil((max(hist_1)+10.)/15.)*15.
hh2=0.85*ceil((max(hist_1)+10.)/15.)*15.


polyfill, [floormin+0.08,floormin+0.08,floormin+0.32,floormin+0.32],[hh1,hh2,hh2,hh1],color=cc[11]
xyouts, floormin+0.1,hh,'chip:1', size=0.8
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors , charsize=.6, spacing=0.6, /horizontal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


multiplot
plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.6, xtickinterval=0.2, xminor=2, xrange=[minn,maxx], yrange=[0,max(hist_2)+10.], yminor=5, ytickinterval=15., color=cc[0], title='', /noerase

;------------------------------------------------------------
item='All OBJECTS'
lstyl=1
lstyle=lstyl
colorss=50
c_colors=colorss
oplot, x,hist_2,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
item=[item,'STARS (SDSS)']
lstyl=0
lstyle=[lstyle,lstyl]
colorss=30
c_colors=[c_colors,colorss]
oplot, x,hist1_2,  psym=10., thick=2., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
!y.tickformat=ythickformat_origin
!y.tickname=ythickname_origin
!p.charsize=0.6

AXIS, YAXIS=1, yrange=[0,max(hist_2)+10.], yminor=5,ythick=2., ytickinterval=15., /noerase

hh=0.8*ceil((max(hist_2)+10.)/15.)*15.
hh1=0.78*ceil((max(hist_2)+10.)/15.)*15.
hh2=0.85*ceil((max(hist_2)+10.)/15.)*15.


polyfill, [floormin+0.08,floormin+0.08,floormin+0.32,floormin+0.32],[hh1,hh2,hh2,hh1],color=cc[11]
xyouts, floormin+0.1,hh,'chip:2', size=0.8
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors , charsize=.6, spacing=0.6, /horizontal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



multiplot  
plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.6, xtickinterval=0.2, ytickinterval=15., xminor=2, xrange=[minn,maxx], yrange=[0,max(hist_3)+10.], yminor=5, color=cc[0],  ytitle='No. of Objects', xtitle='Delta Mag.', title=''

;------------------------------------------------------------
item='All OBJECTS'
lstyl=1
lstyle=lstyl
colorss=50
c_colors=colorss
oplot, x,hist_3,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
item=[item,'STARS (SDSS)']
lstyl=0
lstyle=[lstyle,lstyl]
colorss=30
c_colors=[c_colors,colorss]
oplot, x,hist1_3,  psym=10., thick=2., color=cc[colorss], linestyle=lstyl
polyfill, [ceil(maxx/0.2)*0.2-0.1,ceil(maxx/0.2)*0.2-0.1,ceil(maxx/0.2)*0.2+0.1,ceil(maxx/0.2)*0.2+0.1],[-8,-2,-2,-8],color=cc[10]

hh=0.8*ceil((max(hist_3)+10.)/15.)*15.
hh1=0.78*ceil((max(hist_3)+10.)/15.)*15.
hh2=0.85*ceil((max(hist_3)+10.)/15.)*15.


polyfill, [floormin+0.08,floormin+0.08,floormin+0.32,floormin+0.32],[hh1,hh2,hh2,hh1],color=cc[11]
xyouts, floormin+0.1,hh,'chip:3', size=0.8
;------------------------------------------------------------
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors , charsize=.6, spacing=0.6, /horizontal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



multiplot  
plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.6, xtickinterval=0.2, ytickinterval=15., xminor=2, xrange=[minn,maxx], yrange=[0,max(hist_4)+10.], yminor=5, color=cc[0],   xtitle='Delta Mag.', title=''        ; , x.style=8.

;------------------------------------------------------------
item='All OBJECTS'
lstyl=1
lstyle=lstyl
colorss=50
c_colors=colorss
oplot, x,hist_4,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
item=[item,'STARS (SDSS)']
lstyl=0
lstyle=[lstyle,lstyl]
colorss=30
c_colors=[c_colors,colorss]
oplot, x,hist1_4,  psym=10., thick=2., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
!y.tickformat=ythickformat_origin
!y.tickname=ythickname_origin
!p.charsize=0.6

AXIS, YAXIS=1, yrange=[0,max(hist_4)+10.], yminor=5,ythick=2.,ytickinterval=15., /noerase

polyfill, [floormin-0.1,floormin-0.1,floormin+0.1,floormin+0.1],[-8,-2,-2,-8],color=cc[10]

hh=0.8*ceil((max(hist_4)+10.)/15.)*15.
hh1=0.78*ceil((max(hist_4)+10.)/15.)*15.
hh2=0.85*ceil((max(hist_4)+10.)/15.)*15.


polyfill, [floormin+0.08,floormin+0.08,floormin+0.32,floormin+0.32],[hh1,hh2,hh2,hh1],color=cc[11]
xyouts, floormin+0.1,hh,'chip:4', size=0.8
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors , charsize=.6, spacing=0.6, /horizontal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

multiplot,/reset
ps_off
;==========================












end