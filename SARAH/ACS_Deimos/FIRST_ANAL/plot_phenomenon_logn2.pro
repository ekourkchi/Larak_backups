pro plot_phenomenon_logn2, psout


num=5000

ps_on , psout, noask='y', /color, cc=cc, xsize=12,ysize=35;, scale_factor=0.5
;device,filename=psout,xsize=10,ysize=10,xoffset=2.2


multiplot,/reset   
!p.multi=[0,1,5,0,0]
ythickformat_origin=!y.tickformat
ythickname_origin=!y.tickname

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=1
ytitl="M!D814!N [mag]"
;ytitl="!7l!X!D0!N [mag/arcsec!U2!N]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=5
xn2=21
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'



plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.0,  xrange=[-0.2,0.8],yrange=[-21.8,-14.2], color=cc[0], ytitle=ytitl , xstyle=1, ystyle=1




oplot, x1,y1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, x11,y11, psym=yoursymbol(25,color=cc[0])

oploterr, x2,y2,z2, yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterr, x3,y3,z3, yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]


xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
;fit=ortltrend( xxx, yyy)
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)

;for i=0, n_elements(xxx)-1 do begin
;print, xxx[i], yyy[i]
;endfor



qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]


xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.

;print, alf, bet, "    Mag"
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Mag    ", correlation([xxx],[yyy]) 


xyouts, 0.4,-15,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, 0.4,-15.75,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, 0.4,-16.5,'C='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=19
ytitl="<!7l!X>!De!N [mag/arcsec!U2!N]"
;ytitl="!7l!X!D0!N [mag/arcsec!U2!N]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=5
xn2=21
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'



plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.0,  xrange=[-0.2,0.8],yrange=[16.5,23.5], color=cc[0], ytitle=ytitl , xstyle=1, ystyle=1,  yminor=5, ytickinterval=2




oplot, x1,y1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, x11,y11, psym=yoursymbol(25,color=cc[0])

oploterr, x2,y2,z2, yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterr, x3,y3,z3, yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
;fit=ortltrend( xxx, yyy)
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)

xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.
;print, alf, bet, "    Mu_e"
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Mu_e    ", correlation([xxx],[yyy]) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]



xyouts, -0.15,18.75,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,18,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,17.25,'CC='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=21
xtitl="Log!D10!N(n) [Sersic index]"
ytitl="!7l!X!D0!N [mag/arcsec!U2!N]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=1
xn2=21
qw2=[qw2,data1[w,xm2-1]-35]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]-35]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]-35]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]-35]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]-35]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]-35]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'



plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.0,  xrange=[-0.2,0.8],yrange=[14,22], color=cc[0], ytitle=ytitl , xstyle=1, ystyle=1




oplot, x1,y1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, x11,y11, psym=yoursymbol(25,color=cc[0])

oploterr, x2,y2,z2, yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterr, x3,y3,z3, yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]



qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
;fit=ortltrend( xxx, yyy)
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)

xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.

;print, alf, bet, "    Mu_0"
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Mu_0    ", correlation([xxx],[yyy]) 


xyouts, -0.15,17,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,16,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,15,'CC='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;














;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=4
xtitl=""
ytitl="Log!D10!N(!7r!X) [km/s]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=5
xn2=4
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]-35]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]-35]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]-35]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]-35]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]-35]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'



plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.0,  xrange=[-0.2,0.8],yrange=[0.7,2.6], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1




oplot, x1,y1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, x11,y11, psym=yoursymbol(25,color=cc[0])

oploterr, x2,y2,z2, yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterr, x3,y3,z3, yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /bottom, charsize=0.8

;xx1=-0.2
;xx2=1.0

;alf=0.9555
;bet=1.506

;yy1=alf*xx1+bet
;yy2=alf*xx2+bet

;oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)
xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Sigma", correlation([xxx],[yyy]) 


xyouts, 0.4,1.4,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, 0.4,1.2,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, 0.4,1.0,'CC='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=17
xtitl="Log!D10!N(n) [Sersic index]"
ytitl="Concentration"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]-delx]
qa=[qa,data1[w,j-1]]

xm2=1
xn2=21
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]]
qa3=[qa3,data1[w,xn3-1]-delx]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]-delx]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 


x1=data1[*,i-1]-delx
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


n1=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]-delx
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 or data2[w,7-1] eq 2940 then begin

qw=[qw,data2[w,i-1]-delx]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]-delx]


qw4=[qw4,data2[w,xm4-1]-delx]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor





for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]-delx
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]-delx]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]-delx]

qw4=[qw4,data3[w,xm4-1]-delx]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor


x3=data3[*,i-1]-delx
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])



;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'

plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.0,  yrange=[2,5],xrange=[-0.2,0.8], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1

xx1=-0.5
xx2=1.0

alf=2.255
bet=2.842

yy1=alf*xx1+bet
yy2=alf*xx2+bet

;xx1=-22
;xx2=-14


;print, yy1,yy2
;oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.


oplot, x1,y1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, x11,y11, psym=yoursymbol(25,color=cc[0])

oploterr, x2,y2,z2, yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterr, x3,y3,z3, yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.8


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)
xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [xx1,xx2],[yy1,yy2],linestyle=3, color=cc[0], thick=1.
print, alf, bet, fit[2],  fit[3], fit[4], fit[5], fit[6], fit[7], "    Concentration  ", correlation([xxx],[yyy]) 




xyouts, -0.15,4.5,'a='+strtrim(string(fit[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[2],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,4.2,'b='+strtrim(string(fit[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(fit[3],FORMAT='(F5.2)'),2), color=cc[50], size=0.9
xyouts, -0.15,3.9,'CC='+strtrim(string(correlation([xxx],[yyy]),FORMAT='(F5.2)'),2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





ps_off


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0

i=4
j=21
xtitl="Log!D10!N(n) [Sersic index]"
ytitl="!7l!X!D0!N [mag/arcsec!U2!N]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=1
xn2=21
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]-35]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]-35]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]-35]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]-35]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'









qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
;fit=ortltrend( xxx, yyy)
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)

xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet



;print, alf, bet, "    Mu_0"
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Mu_0(sigma)    ", correlation([xxx],[yyy]) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0

i=4
j=19
xtitl="Log!D10!N(n) [Sersic index]"
ytitl="!7l!X!D0!N [mag/arcsec!U2!N]"
delx=0


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
mag=mag-35.
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

qw=0
qa=0
qw2=0
qa2=0
qw3=0
qa3=0
qw4=0
qa4=0
n1=n_elements(mag)
for w=0, n1-1  do begin
;if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then begin

qw=[qw,data1[w,i-1]]
qa=[qa,data1[w,j-1]]

xm2=1
xn2=21
qw2=[qw2,data1[w,xm2-1]]
qa2=[qa2,data1[w,xn2-1]]

xm3=1
xn3=3
qw3=[qw3,data1[w,xm3-1]]
qa3=[qa3,data1[w,xn3-1]]

xm4=3
xn4=4
qw4=[qw4,data1[w,xm4-1]]
qa4=[qa4,data1[w,xn4-1]]

data1[w,*]=0.*data1[w,*]
endif
endfor 

x1=data1[*,i-1]
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]-35]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]-35]
qa3=[qa3,data2[w,xn3-1]]


qw4=[qw4,data2[w,xm4-1]]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=0.*data2[w,*]
endif
endfor


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor

x2=data2[*,i-1]
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]-35]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]-35]
qa3=[qa3,data3[w,xn3-1]]

qw4=[qw4,data3[w,xm4-1]]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=0.*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'









qa=qa[where (qw lt 0.6 or qw gt 0.7)]
qw=qw[where (qw lt 0.6 or qw gt 0.7)]
oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xxx=[x1,x11,x2,x3]
yyy=[y1,y11,y2,y3]
xxx=xxx(where(xxx ne 0))
yyy=yyy(where(yyy ne 0))
;fit=ortltrend( xxx, yyy)
fit=ortltrenderror( xxx, yyy,0.1*xxx/xxx,0.1*yyy/yyy,0.1,0.1,num)

xx1=-1.0
xx2=1.0

alf=fit[0]
bet=fit[1]

yy1=alf*xx1+bet
yy2=alf*xx2+bet



;print, alf, bet, "    Mu_0"
print, alf, bet, fit[2], fit[3], fit[4], fit[5], fit[6], fit[7], "    Mu_e(sigma)    ", correlation([xxx],[yyy]) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;









end