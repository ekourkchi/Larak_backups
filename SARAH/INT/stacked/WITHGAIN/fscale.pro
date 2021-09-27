pro fscale, str1, str2

; ID2 ... reference 
; ID1 .... main

ID1='STACK_'+str1+'_R.gain'
sdss1=ID1+'.sdss2'
ID2='STACK_'+str2+'_R.gain'
sdss2=ID2+'.sdss2'
sexcat1=ID1+'.cat'
sexcat2=ID2+'.cat'
MATCH=str1+'_'+str2+'.match'


readcol, sexcat1, no1, ximage1, yimage1, wcs11, wcs21, flux1, fluxerr1, magaut1, magauterr1
readcol, sexcat2, no2, ximage2, yimage2, wcs12, wcs22, flux2, fluxerr2, magaut2, magauterr2
readcol, match, temp1,temp2,temp3,temp4,num2,num1

readcol, sdss1, name,objID,ra,dec,type,sdssu,sdssg,sdssr,sdssi,sdssz,R1,R2, format='F,D,D,D,A,D,D,D,D,D,D,D'
size_sdss1=n_elements(name)
Rsdss1=0.5*(R1+R2)

siz=n_elements(temp1)
print, siz
siz1=n_elements(flux1)
print, 'size1=',siz1
siz2=n_elements(flux2)
print, 'size2=',siz2

ratio=flux1[num1[0]-1]/flux2[num2[0]-1]
sdssstarratio=ratio
delmag=magaut1[num1[0]-1]-magaut2[num2[0]-1]
sdssstardelmag=delmag

for i=1, siz-1 do begin

ratio=[ratio,flux1[num1[i]-1]/flux2[num2[i]-1]]
delmag=[delmag,magaut1[num1[i]-1]-magaut2[num2[i]-1]]
;if i le 100 then print,  magaut2[num2[i]-1],magaut1[num1[i]-1],magaut2[num2[i]-1]-magaut1[num1[i]-1], floor(num2[i]), floor(num1[i]), flux1[num1[i]-1]/flux2[num2[i]-1]
k=0
    for j=0, size_sdss1-1 do if num1[i] eq name[j]  then k=j
        if k ne 0  then begin 
	print,  magaut2[num2[i]-1],magaut1[num1[i]-1],magaut1[num1[i]-1]-magaut2[num2[i]-1], floor(num2[i]), floor(num1[i]), flux1[num1[i]-1]/flux2[num2[i]-1]
	print, 'SDSS MAG=',Rsdss1[k], '  sdss-m2=', Rsdss1[k]-magaut2[num2[i]-1],'   sdss-m1=', Rsdss1[k]-magaut1[num1[i]-1]
	print, '  '
	print, '      m2            m1          m1-m2           n2           n1         f1/f2'
	endif
	if k ne 0 then begin
	sdssstarratio=[sdssstarratio,flux1[num1[i]-1]/flux2[num2[i]-1]]
	sdssstardelmag=[sdssstardelmag,magaut1[num1[i]-1]-magaut2[num2[i]-1]]
	endif

endfor

;for i=0, 10 do begin
;print, num1[i], num2[i]
;k=0
;    for j=0, size_sdss1-1 do if num1[i] eq name[j] then k=j

;print, ratio[i], wcs11[num1[i]-1],wcs12[num2[i]-1],delmag[i],Rsdss1[k],ra[k]
;if k eq 0 then print, 'notmatch'

;endfor

size_total=n_elements(delmag)
totsum=0.
totsum2=0.
size_star=n_elements(sdssstardelmag)
starsum=0.
starsum2=0.

u=bsort(delmag,delmag)
u=bsort(sdssstardelmag,sdssstardelmag)

mtot=0.
t=floor(0.2*size_total)
for i=t, size_total-1-t do begin
totsum+=delmag[i]
totsum2+=delmag[i]*delmag[i]
mtot++
endfor

mstar=0.
t=floor(0.1*size_star)
for i=t, size_star-1-t do begin
starsum+=sdssstardelmag[i]
;print, sdssstardelmag[i]
starsum2+=sdssstardelmag[i]*sdssstardelmag[i]
mstar++
endfor

totave=totsum/mtot
totave2=totsum2/mtot
totsig=sqrt(totave2-totave*totave)

starave=starsum/mstar
starave2=starsum2/mstar
starsig=sqrt(starave2-starave*starave)


print, '   '
;print, '     del.mag       f.ratio     sdss.star.del.mag     sdss.star.f.ratio   totsig  starsig  totmean   starmean '
;print, 'median', median(delmag), median(ratio),median(sdssstardelmag), median(sdssstarratio),totsig,starsig,totave,starave

print, '-------------------------------------------------------------------'
print, str1,',',str2
print, '-------------------------------------------------------------------'
print, '     del.mag       sdss.star.del.mag     totmean    totsig   starmean   starsig'
print, 'median', median(delmag), median(sdssstardelmag), totave,totsig,starave,starsig

;print, 'max ', max(delmag), max(ratio), max(sdssstardelmag), max(sdssstarratio)
;print, 'min ', min(delmag), min(ratio), min(sdssstardelmag), min(sdssstarratio)


end
