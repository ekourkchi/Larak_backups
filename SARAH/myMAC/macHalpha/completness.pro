pro completness, filename, psfile

; example: completness, 'mag.R.FINAL.sex', 'mag.R.FINAL.ps'

readcol, filename, mag


siz=n_elements(mag)




minn=10.
maxx=25.

;print, maxx
x=findgen(floor((maxx-minn)*2)+1)/2.+minn
print, x

hist=Histogram(mag, binsize=0.5,min=minn,max=maxx)
hist=100.*hist/siz

ps_on , psfile,  noask='y', /color, cc=cc
plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2, xrange=[minn,maxx], yminor=5, yrange=[0.,max(hist)],xtitle='R Apparent magnitude', ytitle='Count (%)', color=cc[0]



;print, hist
;------------------------------------------------------------
item='Filter R'
lstyl=0
lstyle=lstyl
colorss=30
c_colors=colorss
oplot, x,hist,  psym=10., thick=4., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
;------------------------------------------------------------
;item=[item,'STARS (SDSS)']
;lstyl=0
;lstyle=[lstyle,lstyl]
;colorss=30
;c_colors=[c_colors,colorss]
;oplot, x,hist1,  psym=10., thick=2., color=cc[colorss], linestyle=lstyl
;------------------------------------------------------------
!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle,color=c_colors ,/clear,/right_legend, charsize=.8


ps_off
end
