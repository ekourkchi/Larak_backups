;------------------------------------------------------------------------------
pro DUAL_ACS_m_sigma3_Rsdss_paperv03,  psout, NUM





!P.FONT = -1
;!P.FONT = 0
;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=45,ysize=15, scale_factor=0.8;, 
;, SET_FONT="Times-Roman"
multiplot, /reset
!p.multi=[0,3,1,0,0]





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

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

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


modgmp=gmp
;modgmp[where(modgmp eq 3471)]=0
modgmp[where(modgmp eq 3098)]=0
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
mag000_30=mag000_30(where(modgmp1 ne 0))
mag000_62=mag000_62(where(modgmp2 ne 0))
mag000_74=mag000_74(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30(where(modgmp1 ne 0))
sigma_62=sigma_62(where(modgmp2 ne 0))
sigma_74=sigma_74(where(modgmp3 ne 0))

ersigma000=ersigma
ersigma_30=ersigma000[0:30]    ; DEIMOS
ersigma_62=ersigma000[31:62]   ; MATKOVIC
print, ersigma_62
ersigma_74=ersigma000[63:74]   ; CODY
ersigma_30=ersigma_30(where(modgmp1 ne 0))
ersigma_62=ersigma_62(where(modgmp2 ne 0))
ersigma_74=ersigma_74(where(modgmp3 ne 0))


modgmp1=modgmp1(where(modgmp1 ne 0))



print, gmp2


;readcol, filename1, MAG0, sigma0, ersigma0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
ersigma0=ersigma_74

;readcol, filename2, MAG1, sigma1, ersigma1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
ersigma1=ersigma_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
ersigma=ersigma0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=ersigma






!P.thick = 2
!P.color = cc[30]


x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

oploterr, x,y,  yerr, yoursymbol(21,color=cc[30])
item=['Co09']
lstyle=[1]
sym= 21
c_colors=[30]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
ersigma=ersigma1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=ersigma

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,ersigma]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=ersigma

x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

!P.thick = 2
!P.color = cc[8]
oploterr, x,y,  yerr, yoursymbol(26,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,26]
c_colors=[c_colors,8]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;readcol, filename3, snr, MAG0, sigma0, ersigma0,id, GMP3    ; Deimso
MAG0=mag000_30-35
sigma0=sigma_30
ersigma0=ersigma_30
MAGsdsss=mag000_30-35



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,ersigma0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,ersigma0]

MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
ersigma00=ersigma0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,ersigma00]



x=MAG0
y=alog(sigma0)/alog(10.)
yerr=ersigma0/(sigma0*alog(10))

x=x(where(modgmp1 ne 3080))
y=y(where(modgmp1 ne 3080))
yerr=yerr(where(modgmp1 ne 3080))


item=[item,'Deimos']
lstyle=[lstyle,1]
sym= [sym,23]
c_colors=[c_colors,0]

;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
multiplot


xbegin=-21.5
ymax=2.5
qp=0.4
;qp=-1.2  ; for g-band f475w

;ACS_m_sigma3_Rsdss_paperv03,  'test.ps', 5000


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

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

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


modgmp=gmp
;modgmp[where(modgmp eq 3471)]=0
modgmp[where(modgmp eq 3098)]=0
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


mag000=mag814
mag000_30=mag000[0:30]    ; DEIMOS
mag000_62=mag000[31:62]   ; MATKOVIC
mag000_74=mag000[63:74]   ; CODY
mag000_30=mag000_30(where(modgmp1 ne 0))
mag000_62=mag000_62(where(modgmp2 ne 0))
mag000_74=mag000_74(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30(where(modgmp1 ne 0))
sigma_62=sigma_62(where(modgmp2 ne 0))
sigma_74=sigma_74(where(modgmp3 ne 0))

ersigma000=ersigma
ersigma_30=ersigma000[0:30]    ; DEIMOS
ersigma_62=ersigma000[31:62]   ; MATKOVIC
print, ersigma_62
ersigma_74=ersigma000[63:74]   ; CODY
ersigma_30=ersigma_30(where(modgmp1 ne 0))
ersigma_62=ersigma_62(where(modgmp2 ne 0))
ersigma_74=ersigma_74(where(modgmp3 ne 0))

modgmp1=modgmp1(where(modgmp1 ne 0))


print, gmp2


;readcol, filename1, MAG0, sigma0, ersigma0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
ersigma0=ersigma_74

;readcol, filename2, MAG1, sigma1, ersigma1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
ersigma1=ersigma_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
ersigma=ersigma0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=ersigma







plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3, xtickinterval=1., xminor=2., xrange=[xbegin,-14.5], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6ACS M!DF814W!N (I) [Mag]', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[xbegin,-14], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6ACS M!DF814W!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0]



;plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1





!P.thick = 2
!P.color = cc[30]


x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

oploterr, x,y,  yerr, yoursymbol(21,color=cc[30])
;item=['Cody et al. (2009)']
lstyle=[1]
sym= 21
c_colors=[30]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
ersigma=ersigma1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=ersigma

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,ersigma]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=ersigma

x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

!P.thick = 2
!P.color = cc[8]
oploterr, x,y,  yerr, yoursymbol(26,color=cc[8])
;item=[item,'Matkovic, Guzman (2005)']
lstyle=[lstyle,1]
sym= [sym,26]
c_colors=[c_colors,8]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;readcol, filename3, snr, MAG0, sigma0, ersigma0,id, GMP3    ; Deimso
MAG0=mag000_30-35
sigma0=sigma_30
ersigma0=ersigma_30



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,ersigma0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,ersigma0]


MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
ersigma00=ersigma0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,ersigma00]





x=MAG0
y=alog(sigma0)/alog(10.)
yerr=ersigma0/(sigma0*alog(10))


x=x(where(modgmp1 ne 3080))
y=y(where(modgmp1 ne 3080))
yerr=yerr(where(modgmp1 ne 3080))

;xt=x[29:n_elements(snr)-1]
;yt=y[29:n_elements(snr)-1]
;idt=id[29:n_elements(snr)-1]

;for i=0, n_elements(idt)-1 do  xyouts, xt[i]+0.05,yt[i]+0.025,strtrim(string(idt[i]),2),size=0.5

!P.thick = 2
!P.color = cc[0]
u = [-.8, 0, .8, 0, -.8]
v = [0, .8, 0, -.8, 0]
oploterr, x,y,  yerr, yoursymbol(23,color=cc[0])
;item=[item,'Existing Deimos Data']
lstyle=[lstyle,1]
sym= [sym,23]
c_colors=[c_colors,0]


!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.2, box=0.



;NUM=100
;1111111111111111111111111111111111111111111111111111111111111111111111111111111111



;2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222



;333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
x=MAGTOT                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT)
yerr=ERSIGTOT/(SIGTOT*alog(10))

Fit=ltrenderror(x,y,0.05*x/x,yerr,1,1,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "INE1d", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5

Fit=ltrenderror(y,x,yerr,0.05*x/x,1,1,NUM)
b1=Fit[0]
b0=Fit[1]
db1=Fit[2]
db0=Fit[3]
print, "INE1e", b1, db1, b0, db0, "   n:", -1.0*b1/2.5, db1/2.5

a1=0.5*(a1+b1)
a0=0.5*(a0+b0)
da1=sqrt((da1^2+db1^2)*0.5)
da0=sqrt((da0^2+db0^2)*0.5)
print, "Bisector Line", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5
alfa2=a1
beta2=a0
m=[0,3]
n=m*alfa2+beta2
oplot, n,m,linestyle=2., color=cc[50],thick=4.,psym=0.
lable='Bisector Fit: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
;xyouts, -18,2.35,lable, color=cc[0]
xyouts, -18.55-qp,2.15,lable, color=cc[0],size=1.3
oplot, [-19.05-qp,-18.65-qp],[2.17,2.17],linestyle=2., color=cc[50],thick=5.,psym=0.

;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
oplot, [-30,30], a1*[-30,30]+a0,linestyle=1, color=cc[30]
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-13]
n=m*alfa2+beta2
oplot, m,n,linestyle=3., color=cc[50],thick=4.,psym=0.
lable=' Orthogonal Fit : !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp,2.35,lable, color=cc[0],size=1.3
oplot, [-19.27-qp,-18.87-qp],[2.37,2.37],linestyle=3., color=cc[50],thick=5.,psym=0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
x=MAGTOT0                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT0)
yerr=ERSIGTOT0/(SIGTOT0*alog(10))


;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "MAGTOT0 Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-14]
n=m*alfa2+beta2
;n=m*a1+a0

oplot, m,n,linestyle=1., color=cc[0],thick=6.,psym=0.
lable='[Orthogonal Fit]!U*!N: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp,2.25,lable, color=cc[0],size=1.3
oplot, [-19.27-qp,-18.87-qp],[2.27,2.27],linestyle=1., color=cc[0],thick=6.,psym=0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
;BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
;BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
;BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

multiplot


xbegin=-20.5
ymax=2.5
qp=0.4
qp=-0.9  ; for g-band f475w

;ACS_m_sigma3_Rsdss_paperv03,  'test.ps', 5000


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

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

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


modgmp=gmp
;modgmp[where(modgmp eq 3471)]=0
modgmp[where(modgmp eq 3098)]=0
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


mag000=mag475
mag000_30=mag000[0:30]    ; DEIMOS
mag000_62=mag000[31:62]   ; MATKOVIC
mag000_74=mag000[63:74]   ; CODY
mag000_30=mag000_30(where(modgmp1 ne 0))
mag000_62=mag000_62(where(modgmp2 ne 0))
mag000_74=mag000_74(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30(where(modgmp1 ne 0))
sigma_62=sigma_62(where(modgmp2 ne 0))
sigma_74=sigma_74(where(modgmp3 ne 0))

ersigma000=ersigma
ersigma_30=ersigma000[0:30]    ; DEIMOS
ersigma_62=ersigma000[31:62]   ; MATKOVIC
print, ersigma_62
ersigma_74=ersigma000[63:74]   ; CODY
ersigma_30=ersigma_30(where(modgmp1 ne 0))
ersigma_62=ersigma_62(where(modgmp2 ne 0))
ersigma_74=ersigma_74(where(modgmp3 ne 0))

modgmp1=modgmp1(where(modgmp1 ne 0))


print, gmp2


;readcol, filename1, MAG0, sigma0, ersigma0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
ersigma0=ersigma_74

;readcol, filename2, MAG1, sigma1, ersigma1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
ersigma1=ersigma_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
ersigma=ersigma0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=ersigma







plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3, xtickinterval=1., xminor=2., xrange=[xbegin,-13.5], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6ACS M!DF475W!N (g) [Mag]', ytitle='',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[xbegin,-14], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6ACS M!DF814W!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0]



;plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1





!P.thick = 2
!P.color = cc[30]


x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

oploterr, x,y,  yerr, yoursymbol(21,color=cc[30])
;item=['Cody et al. (2009)']
lstyle=[1]
sym= 21
c_colors=[30]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
ersigma=ersigma1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=ersigma

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,ersigma]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=ersigma

x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

!P.thick = 2
!P.color = cc[8]
oploterr, x,y,  yerr, yoursymbol(26,color=cc[8])
;item=[item,'Matkovic, Guzman (2005)']
lstyle=[lstyle,1]
sym= [sym,26]
c_colors=[c_colors,8]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;readcol, filename3, snr, MAG0, sigma0, ersigma0,id, GMP3    ; Deimso
MAG0=mag000_30-35
sigma0=sigma_30
ersigma0=ersigma_30



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,ersigma0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,ersigma0]



MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
ersigma00=ersigma0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,ersigma00]




x=MAG0
y=alog(sigma0)/alog(10.)
yerr=ersigma0/(sigma0*alog(10))


x=x(where(modgmp1 ne 3080))
y=y(where(modgmp1 ne 3080))
yerr=yerr(where(modgmp1 ne 3080))

;xt=x[29:n_elements(snr)-1]
;yt=y[29:n_elements(snr)-1]
;idt=id[29:n_elements(snr)-1]

;for i=0, n_elements(idt)-1 do  xyouts, xt[i]+0.05,yt[i]+0.025,strtrim(string(idt[i]),2),size=0.5

!P.thick = 2
!P.color = cc[0]
u = [-.8, 0, .8, 0, -.8]
v = [0, .8, 0, -.8, 0]
oploterr, x,y,  yerr, yoursymbol(23,color=cc[0])
;item=[item,'Existing Deimos Data']
lstyle=[lstyle,1]
sym= [sym,23]
c_colors=[c_colors,0]


!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.2, box=0.



;NUM=100
;1111111111111111111111111111111111111111111111111111111111111111111111111111111111



;2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222



;333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
x=MAGTOT                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT)
yerr=ERSIGTOT/(SIGTOT*alog(10))

Fit=ltrenderror(x,y,0.05*x/x,yerr,1,1,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "INE1d", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5

Fit=ltrenderror(y,x,yerr,0.05*x/x,1,1,NUM)
b1=Fit[0]
b0=Fit[1]
db1=Fit[2]
db0=Fit[3]
print, "INE1e", b1, db1, b0, db0, "   n:", -1.0*b1/2.5, db1/2.5

a1=0.5*(a1+b1)
a0=0.5*(a0+b0)
da1=sqrt((da1^2+db1^2)*0.5)
da0=sqrt((da0^2+db0^2)*0.5)
print, "Bisector Line", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5
alfa2=a1
beta2=a0
m=[0,3]
n=m*alfa2+beta2
oplot, n,m,linestyle=2., color=cc[50],thick=4.,psym=0.
lable='Bisector Fit: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
;xyouts, -18,2.35,lable, color=cc[0]
xyouts, -18.55-qp-0.25,2.15,lable, color=cc[0],size=1.3
oplot, [-19.05-qp-0.25,-18.65-qp-0.25],[2.17,2.17],linestyle=2., color=cc[50],thick=5.,psym=0.

;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
oplot, [-30,30], a1*[-30,30]+a0,linestyle=1, color=cc[30]
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-13]
n=m*alfa2+beta2
oplot, m,n,linestyle=3., color=cc[50],thick=4.,psym=0.
lable=' Orthogonal Fit : !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp-0.5,2.35,lable, color=cc[0],size=1.3
oplot, [-19.27-qp-0.5,-18.87-qp-0.5],[2.37,2.37],linestyle=3., color=cc[50],thick=5.,psym=0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
x=MAGTOT0                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT0)
yerr=ERSIGTOT0/(SIGTOT0*alog(10))


;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "MAGTOT0 Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-13]
n=m*alfa2+beta2
;n=m*a1+a0

oplot, m,n,linestyle=1., color=cc[0],thick=6.,psym=0.
lable='[Orthogonal Fit]!U*!N: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp-0.5,2.25,lable, color=cc[0],size=1.3
oplot, [-19.27-qp-0.5,-18.87-qp-0.5],[2.27,2.27],linestyle=1., color=cc[0],thick=6.,psym=0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
multiplot


xbegin=-21.5
ymax=2.5
qp=0.4
;qp=-1.2  ; for g-band f475w

;ACS_m_sigma3_Rsdss_paperv03,  'test.ps', 5000


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

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

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


modgmp=gmp
;modgmp[where(modgmp eq 3471)]=0
modgmp[where(modgmp eq 3098)]=0
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
mag000_30=mag000_30(where(modgmp1 ne 0))
mag000_62=mag000_62(where(modgmp2 ne 0))
mag000_74=mag000_74(where(modgmp3 ne 0))

sigma000=sigma
sigma_30=sigma000[0:30]    ; DEIMOS
sigma_62=sigma000[31:62]   ; MATKOVIC
sigma_74=sigma000[63:74]   ; CODY
sigma_30=sigma_30(where(modgmp1 ne 0))
sigma_62=sigma_62(where(modgmp2 ne 0))
sigma_74=sigma_74(where(modgmp3 ne 0))

ersigma000=ersigma
ersigma_30=ersigma000[0:30]    ; DEIMOS
ersigma_62=ersigma000[31:62]   ; MATKOVIC
print, ersigma_62
ersigma_74=ersigma000[63:74]   ; CODY
ersigma_30=ersigma_30(where(modgmp1 ne 0))
ersigma_62=ersigma_62(where(modgmp2 ne 0))
ersigma_74=ersigma_74(where(modgmp3 ne 0))


modgmp1=modgmp1(where(modgmp1 ne 0))



print, gmp2


;readcol, filename1, MAG0, sigma0, ersigma0, GMP1    ; CODY
MAG0=mag000_74
sigma0=sigma_74
ersigma0=ersigma_74

;readcol, filename2, MAG1, sigma1, ersigma1, GMP2    ; MATKOVIC
MAG1=mag000_62
sigma1=sigma_62
ersigma1=ersigma_62


MAG=MAG0-35.   ; CODY
Sigma=Sigma0
ersigma=ersigma0

MAGTOT=MAG
SIGTOT=Sigma
ERSIGTOT=ersigma







plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3, xtickinterval=1., xminor=2., xrange=[xbegin,-14.5], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N [Mag]',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[xbegin,-14], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6ACS M!DF814W!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0]



;plot, [0], /nodata, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1
;polyfill, [-16,-16,-14,-14],[1,2.5,2.5,1],color=cc[11]

;plot, [0], /noerase, xthick=2.,ythick=2.,charsize=0.9, xtickinterval=1., xminor=2., xrange=[-17,-14.8], ytickinterval=0.1, yminor=2, yrange=[1.0,ymax], xtitle='!6SDSS M!DR!N (Mag)', ytitle='!6log!D10!N !7r!6 Km/s',title=' ', color=cc[0],  xstyle=1, ystyle=1





!P.thick = 2
!P.color = cc[30]


x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

oploterr, x,y,  yerr, yoursymbol(21,color=cc[30])
item=['Co09']
lstyle=[1]
sym= 21
c_colors=[30]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MAG=MAG1-35   ; Matkovic
Sigma=Sigma1
ersigma=ersigma1


MAGTOT3=MAG                   ;  MAGTOT3 is  MATKOVIC
SIGTOT3=SIGma
ERSIGTOT3=ersigma

MAGTOT=[MAGTOT,MAG]
SIGTOT=[SIGTOT,sigma]
ERSIGTOT=[ERSIGTOT,ersigma]

MAGTOT1=MAG
SIGTOT1=sigma
ERSIGTOT1=ersigma

x=MAG
y=alog(sigma)/alog(10.)
yerr=ersigma/(sigma*alog(10))

!P.thick = 2
!P.color = cc[8]
oploterr, x,y,  yerr, yoursymbol(26,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,26]
c_colors=[c_colors,8]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;readcol, filename3, snr, MAG0, sigma0, ersigma0,id, GMP3    ; Deimso
MAG0=mag000_30-35
sigma0=sigma_30
ersigma0=ersigma_30
MAGsdsss=mag000_30-35



MAGTOT2=MAGTOT                   ;  MAGTOT2 is  CODY+MATKOVIC
SIGTOT2=SIGTOT
ERSIGTOT2=ERSIGTOT

MAGTOT=[MAGTOT2,MAG0]                           ;  MAGTOT is  CODY+MATKOVIC+DEIMOS
SIGTOT=[SIGTOT2,sigma0]
ERSIGTOT=[ERSIGTOT2,ersigma0]

MAGTOT1=[MAGTOT1,MAG0]                           ;  MAGTOT1 is  MATKOVIC+DEIMOS
SIGTOT1=[SIGTOT1,sigma0]
ERSIGTOT1=[ERSIGTOT1,ersigma0]

MAG00=MAG0(where(magsdsss lt -16))
sigma00=sigma0(where(magsdsss lt -16))
ersigma00=ersigma0(where(magsdsss lt -16))

MAGTOT0=[MAGTOT2,MAG00]           ;  MAGTOT0 is  CODY+MATKOVIC+DEIMOS (S/N > 15)
SIGTOT0=[SIGTOT2,sigma00]
ERSIGTOT0=[ERSIGTOT2,ersigma00]



x=MAG0
y=alog(sigma0)/alog(10.)
yerr=ersigma0/(sigma0*alog(10))

x=x(where(modgmp1 ne 3080))
y=y(where(modgmp1 ne 3080))
yerr=yerr(where(modgmp1 ne 3080))


;xt=x[29:n_elements(snr)-1]
;yt=y[29:n_elements(snr)-1]
;idt=id[29:n_elements(snr)-1]

;for i=0, n_elements(idt)-1 do  xyouts, xt[i]+0.05,yt[i]+0.025,strtrim(string(idt[i]),2),size=0.5

!P.thick = 2
!P.color = cc[0]

oploterror, x,y, x*0., yerr, psym=yoursymbol(23,color=cc[0]), /nohat, ERRCOLOR=cc[0]



item=[item,'Deimos']
lstyle=[lstyle,1]
sym= [sym,23]
c_colors=[c_colors,0]


!P.color=cc[0]
!P.thick=3.
legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=1.2, box=0.



;NUM=100
;1111111111111111111111111111111111111111111111111111111111111111111111111111111111



;2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222



;333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
x=MAGTOT                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT)
yerr=ERSIGTOT/(SIGTOT*alog(10))

Fit=ltrenderror(x,y,0.05*x/x,yerr,1,1,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "INE1d", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5

Fit=ltrenderror(y,x,yerr,0.05*x/x,1,1,NUM)
b1=Fit[0]
b0=Fit[1]
db1=Fit[2]
db0=Fit[3]
print, "INE1e", b1, db1, b0, db0, "   n:", -1.0*b1/2.5, db1/2.5

a1=0.5*(a1+b1)
a0=0.5*(a0+b0)
da1=sqrt((da1^2+db1^2)*0.5)
da0=sqrt((da0^2+db0^2)*0.5)
print, "Bisector Line", a1, da1, a0, da0, "   n:", -1.0*a1/2.5, da1/2.5
alfa2=a1
beta2=a0
m=[0,3]
n=m*alfa2+beta2
oplot, n,m,linestyle=2., color=cc[50],thick=4.,psym=0.
lable='Bisector Fit: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
;xyouts, -18,2.35,lable, color=cc[0]
xyouts, -18.55-qp,2.15,lable, color=cc[0],size=1.3
oplot, [-19.05-qp,-18.65-qp],[2.17,2.17],linestyle=2., color=cc[50],thick=5.,psym=0.

;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
oplot, [-30,30], a1*[-30,30]+a0,linestyle=1, color=cc[30]
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-13]
n=m*alfa2+beta2
oplot, m,n,linestyle=3., color=cc[50],thick=4.,psym=0.
lable=' Orthogonal Fit : !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp,2.35,lable, color=cc[0],size=1.3
oplot, [-19.27-qp,-18.87-qp],[2.37,2.37],linestyle=3., color=cc[50],thick=5.,psym=0.
x=MAGTOT0                                              ;  MAGTOT is  MATKOVIC+DEIMOS+CODY Only
y=alog10(SIGTOT0)
yerr=ERSIGTOT0/(SIGTOT0*alog(10))


;Orthogonal
Fit=ortltrenderror(1.*x,y,x/x*0.05,yerr,0.01,0.01,NUM)
a1=Fit[4]
a0=Fit[5]
da1=Fit[6]
da0=Fit[7]
print, "MAGTOT0 Orthogonal", a1, da1, a0, da0, "    n:", -1.0*a1/2.5, da1/2.5
print, "     "
alfa2=Fit[0]
beta2=Fit[1]

m=[-22,-14]
n=m*alfa2+beta2
;n=m*a1+a0

oplot, m,n,linestyle=1., color=cc[0],thick=6.,psym=0.
lable='[Orthogonal Fit]!U*!N: !6L!9?!X!7r!U'+strtrim(string(-1.0*a1/2.5, FORMAT='(F5.2)'),2)+'!9+!X'+strtrim(string(da1/2.5, FORMAT='(F5.2)'),2)+'!6'
xyouts, -18.77-qp,2.25,lable, color=cc[0],size=1.3
oplot, [-19.27-qp,-18.87-qp],[2.27,2.27],linestyle=1., color=cc[0],thick=6.,psym=0.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





ps_off
end
