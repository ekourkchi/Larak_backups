pro new02_plot_phenomenon_FPHOT_research, psout

ps_on , psout, noask='y', /color, cc=cc, xsize=20,ysize=13, scale_factor=0.8
;device,filename=psout,xsize=25,ysize=35,xoffset=2.2
;!y.margin=5
;!x.margin=8.

;multiplot,/reset   
;!p.multi=[0,2,3,0,0]
ythickformat_origin=!y.tickformat
ythickname_origin=!y.tickname



list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
re814kpc=alog10(re814*0.05*0.4)
logsigma=alog10(sigma)

mu475=mag475+2.5*alog10(2*3.1415*re475*re475*0.0025)
re475kpc=alog10(re475*0.05*0.4)

logn814=alog10(ser814)
logn475=alog10(ser475)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

multiplot

alfa=3.21792
beta=-3.92405
gama=26.8202

dalfa=0.323878
dbeta=0.317703
dgama=0.590451

dalfa = dalfa * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dbeta = dbeta * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dgama = dgama * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level

x=alfa*re814kpc+beta*logsigma+gama
y=mu814
;xer=sqrt((dalfa*re814kpc)^2+(alfa*erre814/re814)^2+(dbeta*logsigma)^2+(beta*ersigma/sigma)^2+(dgama)^2)
;xer=sqrt((2.0*re814kpc)^2+(alfa*erre814/re814)^2+(1.0*logn814)^2+(beta*erser814/ser814)^2+(0.3)^2)
xer=sqrt((alfa*erre814/re814)^2+(beta*ersigma/sigma)^2)

;yer=(ermag814)+(5.*erre814/re814)
yer=sqrt((0.05)^2+(5.*1./re814)^2)

aa=x
x1=aa[0:30]
x2=aa[31:62]
x3=aa[63:74]
aa=y
y1=aa[0:30]
y2=aa[31:62]
y3=aa[63:74]
aa=xer
x1er=aa[0:30]
x2er=aa[31:62]
x3er=aa[63:74]
aa=yer
y1er=aa[0:30]
y2er=aa[31:62]
y3er=aa[63:74]

xtitl='a*log(R!De!N)+b*log(n)+c'
ytitl="<!7l!X>!De!N!U(F814W)!N [mag/arcsec!U2!N]"


;f=mag814(where (mu814 ge 21))
;print, min(f), max(f)
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


aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]

alfa=3.32749
beta=-4.14874
gama=27.2953

dalfa=0.322765
dbeta=0.301835
dgama=0.563008

dalfa = dalfa * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dbeta = dbeta * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dgama = dgama * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level

x=alfa*re814kpc+beta*logsigma+gama
y=mu814
xer=sqrt((dalfa*re814kpc)^2+(alfa*erre814/re814)^2+(dbeta*logsigma)^2+(beta*ersigma/sigma)^2+(dgama)^2)
;xer=sqrt((2.0*re814kpc)^2+(alfa*erre814/re814)^2+(1.0*logn814)^2+(beta*erser814/ser814)^2+(0.3)^2)

;yer=(ermag814)+(5.*erre814/re814)
yer=sqrt((0.05)^2+(5.*1./re814)^2)

xer=0*xer
yer=yer*0





;delfp=abs(mu814-x)
;help, gmp1, gmp2, mag814, logn814, logsigma, re814kpc, extralight, delfp
;es_mag814=mag814[where(modgmp ne 0)]
;es_gmp2 =gmp2[where(modgmp ne 0)]
es_gmp1 =gmp1 [where(modgmp ne 0)]
;es_logn814 =logn814[where(modgmp ne 0)]
;es_logsigma =logsigma[where(modgmp ne 0)]
;es_re814kpc =re814kpc[where(modgmp ne 0)]
;es_extralight =extralight[where(modgmp ne 0)]
;es_delfp= delfp[where(modgmp ne 0)]


c1=g-r
c2=mag475-mag814
c3=(-2.5*alog10(f475_2)+26.068)-(-2.5*alog10(f814_2)+25.937)
c4=(-2.5*alog10(f475_3)+26.068)-(-2.5*alog10(f814_3)+25.937)

es_c1=c1[where(modgmp ne 0)]
es_c2=c2[where(modgmp ne 0)]
es_c3=c3[where(modgmp ne 0)]
es_c4=c4[where(modgmp ne 0)]

help, es_c1,es_c2,es_c3,es_c4

for i=0, n_elements(es_gmp1)-1 do begin
;print, es_gmp1[i],es_gmp2[i],es_mag814[i],es_logn814[i],es_logsigma[i],es_re814kpc[i],es_extralight[i], es_delfp[i]
print, es_gmp1[i],es_c1[i],es_c2[i],es_c3[i],es_c4[i]
endfor

















aa=x
x1=aa[0:30]
x2=aa[31:62]
x3=aa[63:74]
aa=y
y1=aa[0:30]
y2=aa[31:62]
y3=aa[63:74]
aa=xer
x1er=aa[0:30]
x2er=aa[31:62]
x3er=aa[63:74]
aa=yer
y1er=aa[0:30]
y2er=aa[31:62]
y3er=aa[63:74]


x1=x1[where(modgmp1 ne 0)]
x2=x2[where(modgmp2 ne 0)]
x3=x3[where(modgmp3 ne 0)]
y1=y1[where(modgmp1 ne 0)]
y2=y2[where(modgmp2 ne 0)]
y3=y3[where(modgmp3 ne 0)]
x1er=x1er[where(modgmp1 ne 0)]
x2er=x2er[where(modgmp2 ne 0)]
x3er=x3er[where(modgmp3 ne 0)]
y1er=y1er[where(modgmp1 ne 0)]
y2er=y2er[where(modgmp2 ne 0)]
y3er=y3er[where(modgmp3 ne 0)]

xtitl='a*log(R!De!N)+b*log(!7r!X)+c'
ytitl="<!7l!X>!De!N!U(F814W)!N [mag/arcsec!U2!N]"


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.3,  xrange=[15.5,24],yrange=[16.5,23.5], color=cc[0],  ytitle=ytitl , xstyle=1, ystyle=1, xtitle=xtitl

xyouts, 21.0,17.7,'a='+strtrim(string(alfa, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(dalfa, FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, 21.0,17.3,'b='+strtrim(string(beta, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(dbeta, FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, 21.0,16.9,'c='+strtrim(string(gama, FORMAT='(F5.2)'),2)+'!M+!X'+strtrim(string(dgama, FORMAT='(F5.2)'),2), color=cc[0], size=1.2
xyouts, 21.0,18.1,'(FP-F814W)', color=cc[50], size=1.3
;xyouts, 21.0,18.5,'Modified Sample', color=cc[50], size=1.3
;xyouts, 24.5,23.0,'(c)', color=cc[50], size=0.9

;oploterror, x1,y1,x1er,y1er, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]
oplot, x1,y1, psym= yoursymbol(25,color=cc[0])

;oplot, x1,y1, psym= yoursymbol(25,color=cc[0])


item=['Deimos Sample']
lstyle=[1]
sym= [25]
c_colors=[0]

oploterror, x2,y2,x2er,y2er, psym= yoursymbol(22,color=cc[8]), /nohat, ERRCOLOR=cc[8]
;oplot, x2,y2, psym= yoursymbol(22,color=cc[8])

item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterror, x3,y3,x3er,y3er, psym= yoursymbol(21,color=cc[30]), /nohat, ERRCOLOR=cc[30]
;oplot, x3,y3, psym= yoursymbol(21,color=cc[30])

item=[item,'Cody09']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

oplot, [16.5,23.5],[16.5,23.5],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym,  charsize=1.0, box=0




print, "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
re_s= (y-beta*logsigma-gama)/alfa

delmu=y-x
delre=re814kpc-re_s

delmu=delmu[where(modgmp ne 0)]
delre=delre[where(modgmp ne 0)]
mmu814=mu814[where(modgmp ne 0)]

delmugt21=delmu(where (mmu814 gt 21))
delregt21=delre(where (mmu814 gt 21))

delmult21=delmu(where (mmu814 le 21))
delrelt21=delre(where (mmu814 le 21))


rms_mu= stdev(delmu)
rms_mu=rms_mu[1]
rms_re= stdev(delre)
rms_re=rms_re[1]
print, rms_mu, rms_re


rms_mu= stdev(delmult21)
rms_mu=rms_mu[1]
rms_re= stdev(delrelt21)
rms_re=rms_re[1]
print, rms_mu, rms_re


rms_mu= stdev(delmugt21)
rms_mu=rms_mu[1]
rms_re= stdev(delregt21)
rms_re=rms_re[1]
print, rms_mu, rms_re

print, "-------------------------------"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;












ps_off



end