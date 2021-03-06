pro k_space, psout




ps_on , psout, noask='y', /color, cc=cc, xsize=30,ysize=9;, scale_factor=0.5
;device,filename=psout,xsize=10,ysize=10,xoffset=2.2


multiplot,/reset   
multiplot,  xgap=0.035
!p.multi=[0,3,1,0,0]
ythickformat_origin=!y.tickformat
ythickname_origin=!y.tickname


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=21
xtitl="!7j!X!D1!N"
ytitl="!7j!X!D3!N"
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

k1_1=(2.*(data1[*,4-1])+(data1[*,3-1]-0.39794))/sqrt(2.)
k2_1=(2.*(data1[*,4-1])+2.*(-0.4*data1[*,2-1]+0.4*27.)-(data1[*,3-1]-0.39794))/sqrt(6.)
k3_1=(2.*(data1[*,4-1])-(-0.4*data1[*,2-1]+0.4*27.)-(data1[*,3-1]-0.39794))/sqrt(3.)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]
y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

k1_11=(2.*(data11[*,4-1])+(data11[*,3-1]-0.39794))/sqrt(2.)
k2_11=(2.*(data11[*,4-1])+2.*(-0.4*data11[*,2-1]+0.4*27.)-(data11[*,3-1]-0.39794))/sqrt(6.)
k3_11=(2.*(data11[*,4-1])-(-0.4*data11[*,2-1]+0.4*27.)-(data11[*,3-1]-0.39794))/sqrt(3.)
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

k1_2=(2.*(data2[*,4-1])+(data2[*,3-1]-0.39794))/sqrt(2.)
k2_2=(2.*(data2[*,4-1])+2.*(-0.4*data2[*,2-1]+0.4*27.)-(data2[*,3-1]-0.39794))/sqrt(6.)
k3_2=(2.*(data2[*,4-1])-(-0.4*data2[*,2-1]+0.4*27.)-(data2[*,3-1]-0.39794))/sqrt(3.)

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


k1_3=(2.*(data3[*,4-1])+(data3[*,3-1]-0.39794))/sqrt(2.)
k2_3=(2.*(data3[*,4-1])+2.*(-0.4*data3[*,2-1]+0.4*27.)-(data3[*,3-1]-0.39794))/sqrt(6.)
k3_3=(2.*(data3[*,4-1])-(-0.4*data3[*,2-1]+0.4*27.)-(data3[*,3-1]-0.39794))/sqrt(3.)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3,x11])
miny= min([y1,y2,y3,y11])
maxx= max([x1,x2,x3,x11])
maxy= max([y1,y2,y3,y11])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'



plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.3,  xrange=[1,3.5],yrange=[0.0,1.5], color=cc[0], ytitle=ytitl ,xtitle=xtitl , xstyle=1, ystyle=0




oplot, k1_1,k3_1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, k1_11,k3_11, psym=yoursymbol(25,color=cc[0])

oplot, k1_2,k3_2, psym=yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oplot, k1_3,k3_3, psym=yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]


;oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]

!y.tickformat=ythickformat_origin
!y.tickname=ythickname_origin
AXIS, YAXIS=0, yrange=[0.0,1.5], /noerase, ystyle=0,charsize=1.3


xx1=1
xx2=3.5

alf=0.2046
bet=-0.09352

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot,[xx1,xx2], [yy1,yy2],linestyle=3, color=cc[0], thick=2.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

multiplot
xtitl="!7j!X!D1!N"
ytitl="!7j!X!D2!N"

plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.3,  xrange=[1,3.5],yrange=[2,6], color=cc[0], ytitle=ytitl ,xtitle=xtitl , xstyle=1, ystyle=1




oplot, k1_1,k2_1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, k1_11,k2_11, psym=yoursymbol(25,color=cc[0])

oplot, k1_2,k2_2, psym=yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oplot, k1_3,k2_3, psym=yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]


;oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]

!y.tickformat=ythickformat_origin
!y.tickname=ythickname_origin
AXIS, YAXIS=0, yrange=[2,6], /noerase, ystyle=1,charsize=1.3


xx1=14
xx2=22

alf=-0.09745
bet=2.065

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [yy1,yy2],[xx1,xx2],linestyle=3, color=cc[0], thick=1.

oplot, [1.0,3.5],[8.,8.]-[1.0,3.5], linestyle=2, thick=2.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
xtitl="!7j!X!D2!N"
ytitl="!7j!X!D3!N"

plot, [0], /nodata, xthick=2.,ythick=2.,charsize=1.3,  xrange=[2,6],yrange=[0.0,1.5], color=cc[0], ytitle=ytitl ,xtitle=xtitl , xstyle=1, ystyle=0





oplot, k2_1,k3_1, psym=yoursymbol(25,color=cc[0])
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oplot, k2_11,k3_11, psym=yoursymbol(25,color=cc[0])

oplot, k2_2,k3_2, psym=yoursymbol(22,color=cc[8])
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oplot, k2_3,k3_3, psym=yoursymbol(21,color=cc[30])
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]


;oplot, qw,qa, psym=symcat(45,color=cc[24])
;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8, position=[0.42,21.5]
!y.tickformat=ythickformat_origin
!y.tickname=ythickname_origin
AXIS, YAXIS=0, yrange=[0.0,1.5], /noerase, ystyle=0,charsize=1.3


xx1=14
xx2=22

alf=-0.09745
bet=2.065

yy1=alf*xx1+bet
yy2=alf*xx2+bet

oplot, [yy1,yy2],[xx1,xx2],linestyle=3, color=cc[0], thick=1.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



ps_off




end