pro plot_phenomenon_bin_multi_poster, psout




ps_on , psout, noask='y', /color, cc=cc, xsize=20,ysize=20, scale_factor=0.8
;device,filename=psout,xsize=10,ysize=10,xoffset=2.2

multiplot, /reset
multiplot,  ygap=0.07
!p.multi=[0,2,2,0,0]
xthickformat_origin=!x.tickformat
xthickname_origin=!x.tickname
;!y.margin=2.5
;!x.margin=4.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=1
j=6
xtitl="Mag [F814W]"
ytitl="<!7l!X!De!N>-<!7l!X!De!N>!U*!N"
delx=35


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
;if data1[w,7-1] eq 3471 then data1[w,*]=-100000*data1[w,*]
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

data1[w,*]=-100000*data1[w,*]
endif
endfor 





x1=data1[*,i-1]-delx
y1=abs(data1[*,2-1]-(3.45*data1[*,3-1]-4.48*data1[*,4-1]+26.88))
;y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]-delx
y11=abs(data11[*,2-1]-(3.45*data11[*,3-1]-4.48*data11[*,4-1]+26.88))

;y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=-100000*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]-delx]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]-delx]


qw4=[qw4,data2[w,xm4-1]-delx]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=-100000*data2[w,*]
endif
endfor






for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1] then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor


x2=data2[*,i-1]-delx
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y2=abs(data2[*,2-1]-(3.45*data2[*,3-1]-4.48*data2[*,4-1]+26.88))

;y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=-100000*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]-delx]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]-delx]

qw4=[qw4,data3[w,xm4-1]-delx]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=-100000*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]-delx
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y3=abs(data3[*,2-1]-(3.45*data3[*,3-1]-4.48*data3[*,4-1]+26.88))

;y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])




;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'


plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.5,  xrange=[-22,-13.5],yrange=[-0.5,3.2], color=cc[0], xtitle=xtitl, ytitle=ytitl, xstyle=1, ystyle=1





oplot, [-22,-14],[0,0],linestyle=3, color=cc[0], thick=1.

;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /right, charsize=0.8

x=[x1,x2,x3,x11]
y=[y1,y2,y3,y11]
z=x*0.0


a=where(x lt -20.5 and x ge -21.5) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=b[0]
zz=b[1]
xx=[-21]
for i=1,6 do begin
u=i*1.0
print, u
a=where(x lt -20.5+u and x ge -21.5+u) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=[yy,b[0]]
zz=[zz,b[1]]
xx=[xx,[-21+u]]
endfor

print, xx
print, yy
print, zz

oploterror, xx,yy,xx*0.0,zz, psym=symcat(9,color=cc[30])
xyouts, (-13.5+22)/20-22,2.8,'(a)', color=cc[50], size=1.1
!x.tickformat=xthickformat_origin
!x.tickname=xthickname_origin
!p.charsize=1.0
AXIS, XAXIS=0, xrange=[-22,-13.5], /noerase, xstyle=1, charsize=1.4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=5
j=6
xtitl="Log!D10!N(n)"
ytitl=""
delx=0.0


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
;if data1[w,7-1] eq 3471 then data1[w,*]=-100000*data1[w,*]
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

data1[w,*]=-100000*data1[w,*]
endif
endfor 





x1=data1[*,i-1]-delx
y1=abs(data1[*,2-1]-(3.45*data1[*,3-1]-4.48*data1[*,4-1]+26.88))
;y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]-delx
y11=abs(data11[*,2-1]-(3.45*data11[*,3-1]-4.48*data11[*,4-1]+26.88))

;y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=-100000*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]-delx]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]-delx]


qw4=[qw4,data2[w,xm4-1]-delx]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=-100000*data2[w,*]
endif
endfor






for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1] then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor


x2=data2[*,i-1]-delx
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y2=abs(data2[*,2-1]-(3.45*data2[*,3-1]-4.48*data2[*,4-1]+26.88))

;y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=-100000*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]-delx]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]-delx]

qw4=[qw4,data3[w,xm4-1]-delx]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=-100000*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]-delx
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y3=abs(data3[*,2-1]-(3.45*data3[*,3-1]-4.48*data3[*,4-1]+26.88))

;y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])


;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'


plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.5,  xrange=[-0.1,0.7],yrange=[-0.5,3.2], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1





oplot, [-0.2,0.8],[0,0],linestyle=3, color=cc[0], thick=1.

;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /right, charsize=0.8

x=[x1,x2,x3,x11]
y=[y1,y2,y3,y11]
z=x*0.0


a=where(x lt 0.05 and x ge -0.05) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=b[0]
zz=b[1]
xx=[0]
for i=1,6 do begin
u=i*0.1
print, u
a=where(x lt 0.05+u and x ge -0.05+u) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=[yy,b[0]]
zz=[zz,b[1]]
xx=[xx,[0+u]]
endfor

print, xx
print, yy
print, zz

oploterror, xx,yy,xx*0.0,zz, psym=symcat(9,color=cc[30])
xyouts, (0.7+0.1)/20-0.1,2.8,'(b)', size=1.1, color=cc[50]
!x.tickformat=xthickformat_origin
!x.tickname=xthickname_origin
!p.charsize=1.0
AXIS, XAXIS=0, xrange=[-0.1,0.7], /noerase, xstyle=1, charsize=1.4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=17
j=6
xtitl="Concentration"
ytitl="<!7l!X!De!N>-<!7l!X!De!N>!U*!N"
delx=0.0


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
;if data1[w,7-1] eq 3471 then data1[w,*]=-100000*data1[w,*]
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

data1[w,*]=-100000*data1[w,*]
endif
endfor 





x1=data1[*,i-1]-delx
y1=abs(data1[*,2-1]-(3.45*data1[*,3-1]-4.48*data1[*,4-1]+26.88))
;y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=data11[*,i-1]-delx
y11=abs(data11[*,2-1]-(3.45*data11[*,3-1]-4.48*data11[*,4-1]+26.88))

;y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=-100000*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]-delx]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]-delx]


qw4=[qw4,data2[w,xm4-1]-delx]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=-100000*data2[w,*]
endif
endfor






for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1] then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor


x2=data2[*,i-1]-delx
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y2=abs(data2[*,2-1]-(3.45*data2[*,3-1]-4.48*data2[*,4-1]+26.88))

;y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=-100000*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]-delx]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]-delx]

qw4=[qw4,data3[w,xm4-1]-delx]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=-100000*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=data3[*,i-1]-delx
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y3=abs(data3[*,2-1]-(3.45*data3[*,3-1]-4.48*data3[*,4-1]+26.88))

;y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])


;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'


plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.5,  xrange=[2.7,4.8],yrange=[-0.5,3.2], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1





oplot, [2.5,4.8],[0,0],linestyle=3, color=cc[0], thick=1.

;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /right, charsize=0.8

x=[x1,x2,x3,x11]
y=[y1,y2,y3,y11]
z=x*0.0


a=where(x lt 2.9 and x ge 2.7) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=b[0]
zz=b[1]
xx=[2.8]
for i=1,8 do begin
u=i*0.2
print, u
a=where(x lt 2.9+u and x ge 2.7+u) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=[yy,b[0]]
zz=[zz,b[1]]
xx=[xx,[2.8+u]]
endfor

print, xx
print, yy
print, zz

oploterror, xx,yy,xx*0.0,zz, psym=symcat(9,color=cc[30])

xyouts, (4.8-2.7)/20+2.7,2.8,'(c)', size=1.1, color=cc[50]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=3
j=6
xtitl="excess light (D=8 pix.)"
ytitl=""
delx=0


cody='cody.all.sersic.sigma.master03.lst'
matko='matko.all.sersic.sigma.master03.lst'
deimos='deimos.all.sersic.sigma.master03.lst'
deimos_sn15='deimos.all.sersic.sigma.master03_sn15.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
readcol, 'deimos.all.sersic.sigma.master03.2529.lst', exes, format='D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity],[exes]]


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
;if data1[w,7-1] eq 3471 then data1[w,*]=-100000*data1[w,*]
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

data1[w,*]=-100000*data1[w,*]
endif
endfor 





x1=(data1[*,23-1])
y1=abs(data1[*,2-1]-(3.45*data1[*,3-1]-4.48*data1[*,4-1]+26.88))
;y1=data1[*,j-1]
z1=y1*0.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
readcol, 'deimos.all.sersic.sigma.master03.2529_sn15.lst', exes, format='D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity],[exes]]

;x1=data[*,i-1]-delx
x11=(data11[*,23-1])
y11=abs(data11[*,2-1]-(3.45*data11[*,3-1]-4.48*data11[*,4-1]+26.88))

;y11=data11[*,j-1]
z11=y11*0.0
n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
readcol, 'matko.all.sersic.sigma.master03.2529.lst', exes, format='D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity],[exes]]

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=-100000*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then begin

qw=[qw,data2[w,i-1]-delx]
qa=[qa,data2[w,j-1]]

qw2=[qw2,data2[w,xm2-1]]
qa2=[qa2,data2[w,xn2-1]]

qw3=[qw3,data2[w,xm3-1]]
qa3=[qa3,data2[w,xn3-1]-delx]


qw4=[qw4,data2[w,xm4-1]-delx]
qa4=[qa4,data2[w,xn4-1]]

data2[w,*]=-100000*data2[w,*]
endif
endfor






for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]

endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1]  then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
for w=0, n11-1  do begin
if data2[q,7-1] eq data11[w,7-1] then begin 
data2[q,*]=-100000*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor


x2=(data2[*,23-1])
;x2=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y2=abs(data2[*,2-1]-(3.45*data2[*,3-1]-4.48*data2[*,4-1]+26.88))

;y2=data2[*,j-1]
z2=y2*0.0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
readcol, 'cody.all.sersic.sigma.master03.2529.lst', exes, format='D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity],[exes]]


n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=-100000*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then begin

qw=[qw,data3[w,i-1]-delx]
qa=[qa,data3[w,j-1]]


qw2=[qw2,data3[w,xm2-1]]
qa2=[qa2,data3[w,xn2-1]]

qw3=[qw3,data3[w,xm3-1]]
qa3=[qa3,data3[w,xn3-1]-delx]

qw4=[qw4,data3[w,xm4-1]-delx]
qa4=[qa4,data3[w,xn4-1]]

data3[w,*]=-100000*data3[w,*]
endif
endfor 

for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]

endif
endfor

for w=0, n11-1  do begin
if data3[q,7-1] eq data11[w,7-1] then begin 
data3[q,*]=-100000*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
endif
endfor
endfor



x3=(data3[*,23-1])
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y3=abs(data3[*,2-1]-(3.45*data3[*,3-1]-4.48*data3[*,4-1]+26.88))

;y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])


;xtitl='3.47*log(Re)-4.59*log(!7r!X)+27.11'


plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.5,  xrange=[-0.1,0.8],yrange=[-0.5,3.2], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1





oplot, [-0.1,0.8],[0,0],linestyle=3, color=cc[0], thick=1.

;legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, /right, charsize=0.8

x=[x1,x2,x3,x11]
y=[y1,y2,y3,y11]
z=x*0.0


a=where(x lt 0.2 and x ge 0) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=b[0]
zz=b[1]
xx=[0.1]
for i=1,3 do begin
u=i*0.2
print, u
a=where(x lt 0.2+u and x ge 0+u) 
c=y[a]
d=where(c lt 5)
b=stdev(c[d])
yy=[yy,b[0]]
zz=[zz,b[1]]
xx=[xx,[0.1+u]]
endfor

print, xx
print, yy
print, zz

oploterror, xx,yy,xx*0.0,zz, psym=symcat(9,color=cc[30])


xyouts, (0.8+0.1)/20-0.1,2.8,'(d)', size=1.1, color=cc[50]



ps_off




end