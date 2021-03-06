pro match_pointings,  cat1, cat2

; match_pointings, 'test.ps', 'COMA1', 'COMA1~'     

psout=cat1+'_'+cat2+'.match.ps'
sexcat1='normSTACK_'+cat1+'_R.gain.cat'
sexcat2='normSTACK_'+cat2+'_R.gain.cat'
thresh=0.30
thresh=thresh/3600.

cat1='F3'
cat2='F4'


readcol, sexcat1, no1, ximage1, yimage1, wcs11, wcs21, flux1, fluxerr1, magaut1, magauterr1, SKIPLINE=9,format='I,D,D,D,D,D,D,D,D', /SILEN
readcol, sexcat2, no2, ximage2, yimage2, wcs12, wcs22, flux2, fluxerr2, magaut2, magauterr2, SKIPLINE=9,format='I,D,D,D,D,D,D,D,D', /SILEN

ps_on , psout, noask='y', /color, cc=cc
device,filename=psout,xsize=18,ysize=18,xoffset=2.2

siz1=n_elements(flux1)
;print, 'size1=',siz1
siz2=n_elements(flux2)
;print, 'size2=',siz2


a=0.
b=0.

for i=0, siz1-1 do begin
del=10000000.
n=0.
for j=0, siz2-1 do begin

delta=sqrt((wcs11[i]-wcs12[j])^2+(wcs21[i]-wcs22[j])^2)
if delta lt del then begin
del=delta
n=j
endif

endfor
;print, delta
if del lt thresh then begin

;print, no1[i], wcs11[i], wcs21[i], magaut1[i], "    ........    ", no2[n], wcs12[n], wcs22[n], magaut2[n], del*3600
a=[a,magaut1[i]]
b=[b,magaut2[n]]
endif 

endfor

a=a[1:n_elements(a)-1]
b=b[1:n_elements(b)-1]

a=a[where(a lt  30.0)]
b=b[where(a lt  30.0)]

a=a[where(b lt  30.0)]
b=b[where(b lt  30.0)]

differ=abs(a-b)
a=a[where(differ lt 1.0)]
b=b[where(differ lt 1.0)]

plot, [0], /nodata , xrange=[min(a)-0.3,max(a)+0.50], yrange=[min(a)-0.3,max(a)+0.50], xstyle=1,ystyle=1, xthick=4.,ythick=4., charsize=1.2, xtitle='R [mag] - '+cat1,ytitle='R [mag] - '+cat2


oplot, a, b  , psym=symcat(16), color=cc[50]
oplot, [0,100],[0,100], linestyle=1, thick=7, color=cc[0]
oplot, [23.5,min(a)-0.3],[23.5,23.5], linestyle=0, color=cc[30], thick=3
oplot, [23.5,23.50],[23.5,min(a)-0.3], linestyle=0, color=cc[30], thick=3


aa=a[where(a lt  23.5)]
bb=b[where(a lt  23.5)]

aa=aa[where(bb lt  23.5)]
bb=bb[where(bb lt  23.5)]




del=aa-bb



std=stdev(del)

xyouts, min(a)-0.3+0.50,24, 'RMS='+strtrim(string(std,FORMAT='(F5.2)'),2)+' mag', size=1.2


ps_off
print, psout+'         ... Created ... !'



end




