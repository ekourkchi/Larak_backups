;------------------------------------------------------------------------------
pro body_root000, psout, NUM

filename1='Rsigerr.cody.dE.v3.txt'
filename2='Rsigerr.matkovic.ver3.txt'
filename3='snr_R_sigerr.ehsan_v5.txt'


readcol, filename1, MAG0, sigma0, ersigma0, id0, u0, g0, r0, i0, z0
readcol, filename2, MAG1, sigma1, ersigma1, id1, u1, g1, r1, i1, z1

readcol, filename3, snr, MAG2, sigma2, ersigma2, gid2, id2, u2, g2, r2, i2, z2




   sdssR1 = r0 - 0.1837*(g0 - r0) - 0.0971;  sigma = 0.0106
   sdssR2 = r0 - 0.2936*(r0 - i0) - 0.1439;  sigma = 0.0072
   sdssR_0=0.5*(sdssR1+sdssR2)

   sdssR1 = r1 - 0.1837*(g1 - r1) - 0.0971;  sigma = 0.0106
   sdssR2 = r1 - 0.2936*(r1 - i1) - 0.1439;  sigma = 0.0072
   sdssR_1=0.5*(sdssR1+sdssR2)

   sdssR1 = r2 - 0.1837*(g2 - r2) - 0.0971;  sigma = 0.0106
   sdssR2 = r2 - 0.2936*(r2 - i2) - 0.1439;  sigma = 0.0072
   sdssR_2=0.5*(sdssR1+sdssR2)

   ;sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
   ;sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
   ;sdssI=0.5*(sdssI1+sdssI2)

   sdssB1 = u0 - 0.8116*(u0 - g0) + 0.1313;  sigma = 0.0095
   sdssB2 = g0 + 0.3130*(g0 - r0) + 0.2271;  sigma = 0.0107
   sdssB_0=0.5*(sdssB1+sdssB2)

   sdssB1 = u1 - 0.8116*(u1 - g1) + 0.1313;  sigma = 0.0095
   sdssB2 = g1 + 0.3130*(g1 - r1) + 0.2271;  sigma = 0.0107
   sdssB_1=0.5*(sdssB1+sdssB2)

   sdssB1 = u2 - 0.8116*(u2 - g2) + 0.1313;  sigma = 0.0095
   sdssB2 = g2 + 0.3130*(g2 - r2) + 0.2271;  sigma = 0.0107
   sdssB_2=0.5*(sdssB1+sdssB2)

    ;sdssI[where(gmp eq 3308)]=17.52    ; Modification using CFHT data
    ;g[where(gmp eq 3308)]=19.20        ; Modification using CFHT data
    ;SDSSR[where(gmp eq 3308)]=18.09        ; Modification using CFHT data


B_R0=sdssB_0-sdssR_0
for kh=0, n_elements(id0)-1 do begin
if id0[kh] eq 2877 then B_R0[kh]=1.23
if id0[kh] eq 3141 then B_R0[kh]=1.29
if id0[kh] eq 3308 then B_R0[kh]=1.48
endfor

B_R1=sdssB_1-sdssR_1
for kh=0, n_elements(id1)-1 do begin
if id1[kh] eq 2877 then B_R1[kh]=1.23
if id1[kh] eq 3141 then B_R1[kh]=1.29
if id1[kh] eq 3308 then B_R1[kh]=1.48
endfor

B_R2=sdssB_2-sdssR_2
for kh=0, n_elements(id2)-1 do begin
if id2[kh] eq 2877 then B_R2[kh]=1.23
if id2[kh] eq 3141 then B_R2[kh]=1.29
if id2[kh] eq 3308 then B_R2[kh]=1.48
endfor



;B_R0=g0-r0
;B_R1=g1-r1
;B_R2=g2-r2

ps_on , psout, noask='y', /color, cc=cc  , xsize=60, ysize=25, scale_factor=0.8

!y.margin=7.
!x.margin=10.

multiplot, /reset
!p.multi=[0,3,1,0,0]
multiplot

id20=id2

id2[where(id2 eq 2808)]=0
id2[where(id2 eq 2780)]=0
id2[where(id2 eq 2655)]=0
id2[where(id2 eq 3141)]=0
id2[where(id2 eq 3119)]=0
id2[where(id2 eq 2563)]=0


plot, [0], /nodata, xrange=[1.08,1.66],yrange=[1.0,2.50], xstyle=1, ystyle=1,xtitle="(B-R)!Dsdss!N [mag]", ytitle='!6log!D10!N !7r!6 Km/s', xthick=3., ythick=3., charsize=1.7
;plot, [0], /nodata, xrange=[0.5,0.85],yrange=[1.0,2.50], xstyle=1, ystyle=1,xtitle="C=(B-R)!Dsdss!N [mag]", ytitle='!6log!D10!N !7r!6 Km/s', xthick=3., ythick=3., charsize=1.7


B_R21=B_R2(where (id2 ne 0))
sigma21=sigma2(where (id2 ne 0))
mashang=id2(where (id2 ne 0))
oploterr, B_R21, alog10(sigma21),alog10(sigma21)*0 , yoursymbol(23,color=cc[0])

print, mashang(where(B_R21 lt 1.20))


B_R22=B_R2(where (id2 eq 0))
sigma22=sigma2(where (id2 eq 0))
oplot, B_R22, alog10(sigma22) , psym=4

oploterr, B_R1, alog10(sigma1),alog10(sigma1)*0, yoursymbol(26,color=cc[8])


;B_R01=B_R0(where (MAG0 lt 19))
;sigma01=sigma0(where (MAG0 lt 19))
oploterr, B_R0, alog10(sigma0),alog10(sigma0)*0, yoursymbol(21,color=cc[30])

;B_R02=B_R0(where (MAG0 gt 19))
;sigma02=sigma0(where (MAG0 gt 19))
;oplot, B_R02, alog10(sigma02) , psym=5, color=cc[30]

;for i=0,5 do print, id0[i], B_R0[i]

x=[B_R0,B_R1,B_R2]
y=[alog10(sigma0),alog10(sigma1),alog10(sigma2)]
z=[mag0-35,mag1-35,mag2]
BB=[sdssB_0,sdssB_1,sdssB_2]
RR=[sdssR_0,sdssR_1,sdssR_2]

IDDI=[id0,id1,id20]

;print, "  "
;for kh=0, n_elements(IDDI)-1 do print, round(IDDI[kh]), RR[kh]
;print, "  "

x=x(where(z lt -17))
y=y(where(z lt -17))

;y=y(where(x gt 1.30))
;x=x(where(x gt 1.30))

;x=x(where(y gt 1.60))
;y=y(where(y gt 1.60))



yerr=y*0.01
fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.1,0.1,NUM)
alfa2=fit[0]
beta2=fit[1]
m=[-10,10]
n=m*alfa2+beta2
oplot, m,n,linestyle=2., color=cc[0],thick=6.,psym=0.



item=['Co09']
lstyle=[1]
sym= 21
c_colors=[30]
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,26]
c_colors=[c_colors,8]
item=[item,'Deimos']
lstyle=[lstyle,1]
sym= [sym,23]
c_colors=[c_colors,0]
legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.3, box=0., /right
xyouts, 1.6185,2.4,'(A)', charsize=1.3, color=cc[0]


trend=fit
xyouts, 1.1,2.4,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 1.1,2.3,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.6

delta=abs(y-x*alfa2-beta2)
rms=sqrt(median(delta*delta))
oplot, m,n+rms,linestyle=1., color=cc[0],thick=3.,psym=0.
oplot, m,n-rms,linestyle=1., color=cc[0],thick=3.,psym=0.

print,'fit=',fit


gmp30=round(id20)
logsig=alog10(sigma2)
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 2655 or gmp30[pm] eq 2808 or gmp30[pm] eq 2780) then xyouts, B_R2[pm]-0.05, logsig[pm]+0.03,gmp30[pm], charsize=1.1, color=cc[0]

if (gmp30[pm] eq 3141) then xyouts, B_R2[pm]-0.05, logsig[pm]+0.01,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2563) then xyouts, B_R2[pm]-0.10, logsig[pm]-0.04,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 3119) then xyouts, B_R2[pm]-0.05, logsig[pm]-0.05,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 3146) then xyouts, B_R2[pm]-0.10, logsig[pm]+0.02,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2877) then xyouts, B_R2[pm]-0.11, logsig[pm]-0.03,gmp30[pm], charsize=1.1, color=cc[0]
endfor
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
;errors='errors.814.475.txt'
errors='errors.814.475_v01.txt'
gradient='gmp.colorgradient.txt'
galFit='galFit_allFit_814.txt'


readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, g_r, FORMAT='I,D,D,D,D,D,D,D', /SILENT

readcol, gradient, gmp4, alf, bet, dalf, dbet, FORMAT='I,D,D,D,D',  /SILENT
 
readcol, galFit, gmp5, resex, re10, re12, re20, re25, re30, n10, n12, n20, n25, n30, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D',  /SILENT





   sdssR1 = r - 0.1837*(g - r) - 0.0971;  sigma = 0.0106
   sdssR2 = r - 0.2936*(r - i) - 0.1439;  sigma = 0.0072
   sdssR=0.5*(sdssR1+sdssR2)


   sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
   sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
   sdssI=0.5*(sdssI1+sdssI2)



    sdssI[where(gmp eq 3308)]=17.52    ; Modification using CFHT data
    g[where(gmp eq 3308)]=19.20        ; Modification using CFHT data
    SDSSR[where(gmp eq 3308)]=18.09        ; Modification using CFHT data

;print, gmp[0:30]

modgmp=gmp
	;modgmp[where(modgmp eq 3471)]=0
;modgmp[where(modgmp eq 3098)]=0
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
modgmp[where(modgmp eq 3034)]=0




aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]

bb=gmp
gmp1=bb[0:30]
gmp2=bb[31:62]
gmp3=bb[63:74]

mag000=SDSSR
mag000_30=mag000[0:30]    ; DEIMOS
mag000_62=mag000[31:62]   ; MATKOVIC
mag000_74=mag000[63:74]   ; CODY
mag000_30=mag000_30;(where(modgmp1 ne 0))
mag000_62=mag000_62;(where(modgmp2 ne 0))
mag000_74=mag000_74;(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30;(where(modgmp1 ne 0))
sigma_62=sigma_62;(where(modgmp2 ne 0))
sigma_74=sigma_74;(where(modgmp3 ne 0))




bbb= mag475-mag814
	



g_r= bbb
g_r000=g_r
g_r_30=g_r000[0:30]    ; DEIMOS
g_r_62=g_r000[31:62]   ; MATKOVIC
print, g_r_62
g_r_74=g_r000[63:74]   ; CODY
g_r_30=g_r_30;(where(modgmp1 ne 0))
g_r_62=g_r_62;(where(modgmp2 ne 0))
g_r_74=g_r_74;(where(modgmp3 ne 0))


modgmp1=modgmp1;(where(modgmp1 ne 0))






;readcol, filename1, MAG0, sigma0, g_r0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
g_r0=g_r_74

;readcol, filename2, MAG1, sigma1, g_r1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
g_r1=g_r_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
g_r=g_r0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=g_r





MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
g_r=g_r1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=g_r

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,g_r]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=g_r



MAG0=mag000_30-35
sigma0=sigma_30
g_r0=g_r_30
MAGsdsss=mag000_30-35



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,g_r0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,g_r0]

MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
g_r00=g_r0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,g_r00]

multiplot

plot, [0], /nodata, xrange=[0.91,1.49],yrange=[1.0,2.50], xstyle=1, ystyle=1,xtitle="(m!D475!N-m!D814!N) [mag]", xthick=3., ythick=3., charsize=1.7

;print, modgmp1

modgmp1[where(modgmp1 eq 2808)]=0
modgmp1[where(modgmp1 eq 2780)]=0
modgmp1[where(modgmp1 eq 2655)]=0
modgmp1[where(modgmp1 eq 3141)]=0
modgmp1[where(modgmp1 eq 3119)]=0
modgmp1[where(modgmp1 eq 2563)]=0



g_r_30_1=g_r_30(where (modgmp1 ne 0))
sigma_30_1=sigma_30(where (modgmp1 ne 0))

oploterr, g_r_30_1, alog10(sigma_30_1),alog10(sigma_30_1)*0 , yoursymbol(23,color=cc[0])


kheng=modgmp1(where (modgmp1 ne 0))
print, 'kh00',kheng(where(g_r_30_1 lt 1.02))



g_r_30_2=g_r_30(where (modgmp1 eq 0))
sigma_30_2=sigma_30(where (modgmp1 eq 0))
oplot, g_r_30_2, alog10(sigma_30_2), psym=4

kheng=gmp1(where (modgmp1 eq 0))
print, 'kh00',kheng(where(g_r_30_2 lt 1.10))

oploterr, g_r_62, alog10(sigma_62),alog10(sigma_62)*0, yoursymbol(26,color=cc[8])

temp2=sigma_74
sigma_74=sigma_74(where (gmp3 ne 4430))
ggmp3=gmp3(where (gmp3 ne 4430))
sigma_74=sigma_74(where (ggmp3 ne 5365))

temp1=g_r_74
g_r_74=g_r_74(where (gmp3 ne 4430))
g_r_74=g_r_74(where (ggmp3 ne 5365))
oploterr, g_r_74, alog10(sigma_74),alog10(sigma_74)*0, yoursymbol(21,color=cc[30])


;plot, ERSIGTOT0,alog10(SIGTOT0), xrange=[0.5,0.85],yrange=[1.0,2.50], xstyle=1.0, ystyle=1.0, psym=6
;oplot, g_r_30, alog10(sigma_30), psym=3
;oplot, g_r_62, alog10(sigma_62), psym=3
;oplot, g_r_74, alog10(sigma_74), psym=3

gmp30=gmp[0:30]
logsig=alog10(sigma_30)
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 2563 or gmp30[pm] eq 3119) then xyouts, g_r_30[pm]-0.04, logsig[pm]-0.06,gmp30[pm], charsize=1.1, color=cc[0]

if (gmp30[pm] eq 2808) then xyouts, g_r_30[pm]-0.04, logsig[pm]+0.05,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2780) then xyouts, g_r_30[pm]-0.04, logsig[pm]+0.04,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 3146) then xyouts, g_r_30[pm]-0.07, logsig[pm]+0.03,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2655) then xyouts, g_r_30[pm]-0.03, logsig[pm]+0.04,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 3141) then xyouts, g_r_30[pm]-0.08, logsig[pm]-0.01,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2877) then xyouts, g_r_30[pm]-0.07, logsig[pm]-0.04,gmp30[pm], charsize=1.1, color=cc[0]
endfor





x=[g_r_30,g_r_62,g_r_74]
x=[g_r_30,g_r_62,temp1]

y=[alog10(sigma_30),alog10(sigma_62),alog10(sigma_74)]
y=[alog10(sigma_30),alog10(sigma_62),alog10(temp2)]

help, x
help, sdssR
help, y

y=y(where(sdssR lt 18))
x=x(where(sdssR lt 18))


yerr=y*0.01
fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.1,0.1,NUM)
alfa2=fit[0]
beta2=fit[1]
m=[-10,10]
n=m*alfa2+beta2
oplot, m,n,linestyle=2., color=cc[0],thick=6.,psym=0.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.3, box=0., /right
xyouts, 1.35,2.4,'(B)', charsize=1.3, color=cc[0]

trend=fit
xyouts, 0.95,2.4,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 0.95,2.3,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 0.95,2.2,'HST/ACS sub-sample', color=cc[0], size=1.5

delta=abs(y-x*alfa2-beta2)
rms=sqrt(median(delta*delta))
oplot, m,n+rms,linestyle=1., color=cc[0],thick=3.,psym=0.
oplot, m,n-rms,linestyle=1., color=cc[0],thick=3.,psym=0.


;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
;************************************************************************************
list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
;errors='errors.814.475.txt'
errors='errors.814.475_v01.txt'
gradient='gmp.colorgradient.txt'
galFit='galFit_allFit_814.txt'


readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, g_r, FORMAT='I,D,D,D,D,D,D,D', /SILENT

readcol, gradient, gmp4, alf, bet, dalf, dbet, FORMAT='I,D,D,D,D',  /SILENT
 
readcol, galFit, gmp5, resex, re10, re12, re20, re25, re30, n10, n12, n20, n25, n30, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D',  /SILENT


;print, " "
;for kh=0, n_elements(gmp)-1 do print, gmp[kh], mag814[kh]
;print, " "


   sdssR1 = r - 0.1837*(g - r) - 0.0971;  sigma = 0.0106
   sdssR2 = r - 0.2936*(r - i) - 0.1439;  sigma = 0.0072
   sdssR=0.5*(sdssR1+sdssR2)


   sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
   sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
   sdssI=0.5*(sdssI1+sdssI2)



    sdssI[where(gmp eq 3308)]=17.52    ; Modification using CFHT data
    g[where(gmp eq 3308)]=19.20        ; Modification using CFHT data
    SDSSR[where(gmp eq 3308)]=18.09        ; Modification using CFHT data

;print, gmp[0:30]

modgmp=gmp
	;modgmp[where(modgmp eq 3471)]=0
;modgmp[where(modgmp eq 3098)]=0
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
modgmp[where(modgmp eq 3034)]=0




aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]

bb=gmp
gmp1=bb[0:30]
gmp2=bb[31:62]
gmp3=bb[63:74]

mag000=SDSSR
mag000_30=mag000[0:30]    ; DEIMOS
mag000_62=mag000[31:62]   ; MATKOVIC
mag000_74=mag000[63:74]   ; CODY
mag000_30=mag000_30;(where(modgmp1 ne 0))
mag000_62=mag000_62;(where(modgmp2 ne 0))
mag000_74=mag000_74;(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30;(where(modgmp1 ne 0))
sigma_62=sigma_62;(where(modgmp2 ne 0))
sigma_74=sigma_74;(where(modgmp3 ne 0))


bbb= (-2.5*alog10(f475_2)+26.068)-(-2.5*alog10(f814_2)+25.937)
	



g_r= bbb
g_r000=g_r
g_r_30=g_r000[0:30]    ; DEIMOS
g_r_62=g_r000[31:62]   ; MATKOVIC
print, g_r_62
g_r_74=g_r000[63:74]   ; CODY
g_r_30=g_r_30;(where(modgmp1 ne 0))
g_r_62=g_r_62;(where(modgmp2 ne 0))
g_r_74=g_r_74;(where(modgmp3 ne 0))


modgmp1=modgmp1;(where(modgmp1 ne 0))






;readcol, filename1, MAG0, sigma0, g_r0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
g_r0=g_r_74

;readcol, filename2, MAG1, sigma1, g_r1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
g_r1=g_r_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
g_r=g_r0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=g_r





MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
g_r=g_r1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=g_r

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,g_r]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=g_r



MAG0=mag000_30-35
sigma0=sigma_30
g_r0=g_r_30
MAGsdsss=mag000_30-35



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,g_r0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,g_r0]

MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
g_r00=g_r0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,g_r00]






multiplot

plot, [0], /nodata, xrange=[0.88,1.46],yrange=[1.0,2.50], xstyle=1, ystyle=1, psym=1,xtitle="(m!D475!N-m!D814!N) [mag] D=0.4''", xthick=3., ythick=3., charsize=1.7

;print, modgmp1

modgmp1[where(modgmp1 eq 2808)]=0
modgmp1[where(modgmp1 eq 2780)]=0
modgmp1[where(modgmp1 eq 2655)]=0
modgmp1[where(modgmp1 eq 3141)]=0
modgmp1[where(modgmp1 eq 3119)]=0
modgmp1[where(modgmp1 eq 2563)]=0



g_r_30_1=g_r_30(where (modgmp1 ne 0))
sigma_30_1=sigma_30(where (modgmp1 ne 0))
kheng=modgmp1(where (modgmp1 ne 0))
oploterr, g_r_30_1, alog10(sigma_30_1),alog10(sigma_30_1)*0 , yoursymbol(23,color=cc[0])

print, kheng(where(g_r_30_1 lt 0.95))


g_r_30_2=g_r_30(where (modgmp1 eq 0))
sigma_30_2=sigma_30(where (modgmp1 eq 0))
oplot, g_r_30_2, alog10(sigma_30_2), psym=4

oploterr, g_r_62, alog10(sigma_62),alog10(sigma_62)*0, yoursymbol(26,color=cc[8])

temp2=sigma_74
sigma_74=sigma_74(where (gmp3 ne 4430))
ggmp3=gmp3(where (gmp3 ne 4430))
sigma_74=sigma_74(where (ggmp3 ne 5365))

temp1=g_r_74
g_r_74=g_r_74(where (gmp3 ne 4430))
g_r_74=g_r_74(where (ggmp3 ne 5365))
oploterr, g_r_74, alog10(sigma_74),alog10(sigma_74)*0, yoursymbol(21,color=cc[30])


;plot, ERSIGTOT0,alog10(SIGTOT0), xrange=[0.5,0.85],yrange=[1.0,2.50], xstyle=1.0, ystyle=1.0, psym=6
;oplot, g_r_30, alog10(sigma_30), psym=3
;oplot, g_r_62, alog10(sigma_62), psym=3
;oplot, g_r_74, alog10(sigma_74), psym=3

gmp30=gmp[0:30]
logsig=alog10(sigma_30)
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141  or  gmp30[pm] eq 2655 or gmp30[pm] eq 2563 or gmp30[pm] eq 3119) then xyouts, g_r_30[pm]-0.04, logsig[pm]-0.06,gmp30[pm], charsize=1.1, color=cc[0]

if (gmp30[pm] eq 2808) then xyouts, g_r_30[pm]-0.04, logsig[pm]+0.05,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2780) then xyouts, g_r_30[pm]-0.02, logsig[pm]-0,gmp30[pm], charsize=1.1, color=cc[0]
;if (gmp30[pm] eq 3146) then xyouts, g_r_30[pm]-0.07, logsig[pm]+0.03,gmp30[pm], charsize=1.1, color=cc[0]
endfor




x=[g_r_30,g_r_62,g_r_74]
;x=[g_r_30,g_r_62,temp1]

y=[alog10(sigma_30),alog10(sigma_62),alog10(sigma_74)]
;y=[alog10(sigma_30),alog10(sigma_62),alog10(temp2)]

help, x
help, sdssR
help, y

;y=y(where(sdssR lt 18))
;x=x(where(sdssR lt 18))

u=x
x=x(where(u gt 1.05))
y=y(where(u gt 1.05))



yerr=y*0.01
fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.1,0.1,NUM)
alfa2=fit[0]
beta2=fit[1]
m=[-10,10]
n=m*alfa2+beta2
oplot, m,n,linestyle=2., color=cc[0],thick=6.,psym=0.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.3, box=0., /right
xyouts, 1.38,2.4,'(C)', charsize=1.3, color=cc[0]

trend=fit
xyouts, 0.9,2.4,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 0.9,2.3,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.6
xyouts, 0.9,2.2,'HST/ACS sub-sample', color=cc[0], size=1.5

delta=abs(y-x*alfa2-beta2)
rms=sqrt(median(delta*delta))
oplot, m,n+rms,linestyle=1., color=cc[0],thick=3.,psym=0.
oplot, m,n-rms,linestyle=1., color=cc[0],thick=3.,psym=0.


ps_off


end
