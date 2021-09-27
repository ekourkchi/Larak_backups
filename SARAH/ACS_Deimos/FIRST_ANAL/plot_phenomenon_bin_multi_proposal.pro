pro plot_phenomenon_bin_multi_proposal, psout




ps_on , psout, noask='y', /color, cc=cc, xsize=40,ysize=18, scale_factor=0.8
;device,filename=psout,xsize=10,ysize=10,xoffset=2.2

multiplot, /reset
;multiplot,  ygap=0.07
!p.multi=[0,4,1,0,0]
xthickformat_origin=!x.tickformat
xthickname_origin=!x.tickname
!y.margin=5
!x.margin=7.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=1
j=6
xtitl="Mag [F814W]"
ytitl="!7D!X!DFP!N = <!7l!X!De!N>-<!7l!X!De!N>!U*!N [mag/arcsec!U2!N]"
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





oplot, [-22,-14],[0,0],linestyle=1, color=cc[0], thick=1.

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
 xyouts, (-13.5+22)/20-22,2.8,'(A)', color=cc[50], size=1.1
!x.tickformat=xthickformat_origin
!x.tickname=xthickname_origin
!p.charsize=1.0
;AXIS, XAXIS=0, xrange=[-22,-13.5], /noerase, xstyle=1, charsize=1.4



trend=ltrend(xx,yy,zz)
xyouts, -20,2.8,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, -20,2.5,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
oplot,  [-100,100], trend[0]*[-100,100]+trend[1], linestyle=2, thick=3.


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





oplot, [-0.2,0.8],[0,0],linestyle=1, color=cc[0], thick=1.

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
xyouts, (0.7+0.1)/20-0.1,2.8,'(B)', size=1.1, color=cc[50]
!x.tickformat=xthickformat_origin
!x.tickname=xthickname_origin
!p.charsize=1.0
;AXIS, XAXIS=0, xrange=[-0.1,0.7], /noerase, xstyle=1, charsize=1.4



trend=ltrend(xx,yy,zz)
xyouts, 0.1,2.8,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 0.1,2.5,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
oplot,  [-100,100], trend[0]*[-100,100]+trend[1], linestyle=2, thick=3.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;plot_phenomenon, 'n_mu0_v02.ps', 21,5,"!7l!X!D0!N [mag/arcsec!U2!N]", "Log!D10!N(n) [Sersic index]", 0
multiplot
i=17
j=6
xtitl="Concentration"
ytitl=" "
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


plot, [0], /nodata, xthick=5.,ythick=5.,charsize=1.5,  xrange=[2.5,4.3],yrange=[-0.5,3.2], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1





oplot, [2.5,4.8],[0,0],linestyle=1, color=cc[0], thick=1.

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


xx=xx[0:n_elements(xx)-2]
yy=yy[0:n_elements(xx)-2]
zz=zz[0:n_elements(xx)-2]


oploterror, xx,yy,xx*0.0,zz, psym=symcat(9,color=cc[30])

xyouts, (4.8-2.7)/20+2.5,2.8,'(C)', size=1.1, color=cc[50]



trend=ltrend(xx,yy,zz)
xyouts, 3.2,2.8,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, 3.2,2.5,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
oplot,  [-100,100], trend[0]*[-100,100]+trend[1], linestyle=2, thick=3.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
limag=17
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT


   sdssR1 = r - 0.1837*(g - r) - 0.0971;  sigma = 0.0106
   sdssR2 = r - 0.2936*(r - i) - 0.1439;  sigma = 0.0072
   sdssR=0.5*(sdssR1+sdssR2)


   sdssI1 = r - 1.2444*(r - i) - 0.3820;  sigma = 0.0078
   sdssI2 = i - 0.3780*(i - z)  -0.3974;  sigma = 0.0063
   sdssI=0.5*(sdssI1+sdssI2)

num= n_elements(mag814)
Ms_Lg=dblarr(1,num)
Ms_Lr=dblarr(1,num)
Ms_Li=dblarr(1,num)

for j=0, num-1 do begin
a1=-0.221+0.485*(u[j]-g[j])
a2=-0.390+0.417*(u[j]-r[j])
a3=-0.375+0.359*(u[j]-i[j])
a4=-0.400+0.332*(u[j]-z[j])
a5=-0.499+1.519*(g[j]-r[j])
a6=-0.379+0.914*(g[j]-i[j])
a7=-0.367+0.698*(g[j]-z[j])
a8=-0.106+1.982*(r[j]-i[j])
a9=-0.124+1.067*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Lg[j]=median(a)

a1=-0.099+0.345*(u[j]-g[j])
a2=-0.223+0.299*(u[j]-r[j])
a3=-0.212+0.257*(u[j]-i[j])
a4=-0.232+0.239*(u[j]-z[j])
a5=-0.306+1.097*(g[j]-r[j])
a6=-0.220+0.661*(g[j]-i[j])
a7=-0.215+0.508*(g[j]-z[j])
a8=-0.022+1.431*(r[j]-i[j])
a9=-0.041+0.780*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Lr[j]=median(a)


a1=-0.053+0.268*(u[j]-g[j])
a2=-0.151+0.233*(u[j]-r[j])
a3=-0.144+0.201*(u[j]-i[j])
a4=-0.161+0.187*(u[j]-z[j])
a5=-0.222+0.864*(g[j]-r[j])
a6=-0.152+0.518*(g[j]-i[j])
a7=-0.153+0.402*(g[j]-z[j])
a8= 0.006+1.114*(r[j]-i[j])
a9=-0.018+0.623*(r[j]-z[j])
a=[a1,a2,a3,a4,a5,a6,a7,a8,a9]
b=a(bsort(a))
a=b[1:7]
Ms_Li[j]=median(a)
endfor


re=0.5*(re475+re814)

mu_814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_475=mag475+2.5*alog10(2*3.1415*re475*re475*0.0025)

mu_u=u+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_g=g+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_r=r+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_i=i+2.5*alog10(2*3.1415*re814*re814*0.0025)
mu_z=z+2.5*alog10(2*3.1415*re814*re814*0.0025)

B_R=1.506*(g-r)+0.37
Ms_LII=-0.405+0.518*B_R

M_Lu=2*alog10(sigma)+0.4*mu_u-alog10(re814*0.05*0.4)
M_Lg=2*alog10(sigma)+0.4*mu_g-alog10(re814*0.05*0.4)
M_Lr=2*alog10(sigma)+0.4*mu_r-alog10(re814*0.05*0.4)
M_Li=2*alog10(sigma)+0.4*mu_i-alog10(re814*0.05*0.4)
M_Lz=2*alog10(sigma)+0.4*mu_z-alog10(re814*0.05*0.4)

M_L814=2*alog10(sigma)+0.4*mu_814-alog10(re814*0.05*0.4)
M_L475=2*alog10(sigma)+0.4*mu_475-alog10(re814*0.05*0.4)

M=2*alog10(sigma)+alog10(re814*0.05*0.4)


g_r=g-r
M_Ms=M_Lg-Ms_Lg


mlg30=M_L814[0:30]  ; filter correction
mag814_30=mag814[0:30]

mlg62=M_L814[31:62]       ; filter correction
mlg74=M_L814[63:74]       ; filter correction

mag814_62=mag814[31:62]
mag814_74=mag814[63:74]

print, mag814
mlg300=mlg30(where(mag814_30 gt limag))
mlg620=mlg62(where(mag814_62 gt limag ))
mlg740=mlg74(where(mag814_74 gt limag ))


fp=3.2045*aLOG10(re814*0.05*0.4)-3.8196*aLOG10(sigma)+26.8134
delta=mu_814-3.32749*aLOG10(re814*0.05*0.4)+4.14873*aLOG10(sigma)-27.5066

delta0=delta(where(mag814 gt limag))
print, "DEX=", mean(delta0*delta0) 


;mlg30=sigma[0:30]  ; filter correction
del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]


;plot, alog10(f814_1/f475_1), delta, psym=4
;plot, g-r, delta, psym=4

;limag= 17.5


del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag))

;plot, mlg310, del310, psym=4;, xrange=[0.3,0.7],yrange=[-3,6]
;oplot, mlg740, del740, psym=2;, xrange=[0.3,0.7],yrange=[-3,6]



;------------------------------------------------------------------------------
mlg=[mlg300,mlg620,mlg740]
del=[del300,del620,del740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=mlg
y=del
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


a1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
a0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

da1=sqrt(s/(S*Sx2-Sx*Sx))
da0=sqrt(Sx2/(S*Sx2-Sx*Sx))


print, '   y=a1*x+a0' 
print, '       a1            a0           da1           da0'
print, a1,a0,da1,da0




;------------------------------------------------------------------------------

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))


ccc=M_L814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 gt limag))
ccc620=ccc62(where(mag814_62 gt limag ))
ccc740=ccc74(where(mag814_74 gt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))


;print, '   y=b1*x+b0' 
;print, '       b1            b0           db1           db0'
;print, b1,b0,db1,db0

;		multiplot,/reset   
;		!p.multi=[0,1,2,0,0]
;		multiplot



		
		xtitl=" "
		ytitl="!MA!X log (M/L!D814!N)"

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 lt limag))
bbb620=bbb62(where(mag814_62 lt limag ))
bbb740=bbb74(where(mag814_74 lt limag ))


ccc=M_L814
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 lt limag))
ccc620=ccc62(where(mag814_62 lt limag ))
ccc740=ccc74(where(mag814_74 lt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))



bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))


ccc=M_L475
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 gt limag))
ccc620=ccc62(where(mag814_62 gt limag ))
ccc740=ccc74(where(mag814_74 gt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))



xtitl="!MA!X log(Mass)"
ytitl="!MA!X log(M/L!Df475w!N)"

bbb=M
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]
bbb300=bbb30(where(mag814_30 lt limag))
bbb620=bbb62(where(mag814_62 lt limag ))
bbb740=bbb74(where(mag814_74 lt limag ))


ccc=M_L475
ccc30=ccc[0:30]
ccc62=ccc[31:62]
ccc74=ccc[63:74]
ccc300=ccc30(where(mag814_30 lt limag))
ccc620=ccc62(where(mag814_62 lt limag ))
ccc740=ccc74(where(mag814_74 lt limag ))



xx=[bbb300,bbb620,bbb740]
yy=[ccc300,ccc620,ccc740]
Q1=size(mlg)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


b1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

db1=sqrt(s/(S*Sx2-Sx*Sx))
db0=sqrt(Sx2/(S*Sx2-Sx*Sx))



		bbb=M_L814
		;bbb=mag475-mag814

bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

del300=del30(where(mag814_30 gt limag))
del620=del62(where(mag814_62 gt limag))
del740=del74(where(mag814_74 gt limag)) 
bbb=[bbb300,bbb620,bbb740]
del=[del300,del620,del740]
Q1=size(bbb)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=bbb
y=del
yerr=x/x

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)


a1=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
a0=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

da1=sqrt(s/(S*Sx2-Sx*Sx))
da0=sqrt(Sx2/(S*Sx2-Sx*Sx))


delta=abs(mu_814-3.32749*aLOG10(re814*0.05*0.4)+4.14873*aLOG10(sigma)-27.5066)


del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]


	bbb= g-r
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))





;	multiplot

	ytitl="!7D!X!DFP!N = <!7l!X!De!N>-<!7l!X!De!N>!U*!N [mag/arcsec!U2!N]"

	bbb= (-2.5*alog10(f475_2)+26.068)-(-2.5*alog10(f814_2)+25.937)
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb300=bbb30(where(mag814_30 gt limag))
bbb620=bbb62(where(mag814_62 gt limag ))
bbb740=bbb74(where(mag814_74 gt limag ))

multiplot
	
	xtitl="(m!D475!N-m!D814!N) [mag] D=0.4''"
	plot,  bbb30, del30, psym=yoursymbol(25,color=cc[0]), xtitle=xtitl, xstyle=1, ystyle=1, charsize=1.3, xthick=5., ythick=5., yrange=[-0.5,3.2], xrange=[0.825,1.475], xminor=4,xtickinterval=0.1
	oplot, bbb62, del62, psym=yoursymbol(22,color=cc[8]), color=cc[8]
	oplot, bbb74, del74, psym=yoursymbol(21,color=cc[30]), color=cc[30]

trend=ltrend(bbb,delta,bbb/bbb)
;oplot,  [-10,10], trend[0]*[-10,10]+trend[1], linestyle=2, thick=3.
oplot,  [-10,10], [0,0], linestyle=1, thick=2.



		t= bsort(bbb)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=10
		yy=1000.
		zz=0
		xx=1000.
		while ( i+d lt num) do begin
		u=stdev(delta[i:i+d])
		yy=[yy,u[0]]
		zz=[zz,u[1]]
		v=stdev(bbt[i:i+d])
		xx=[xx,v[0]]
		jj=[xx,v[1]]
		i=i+d+1
		endwhile
		oploterror, xx,yy-3.0,xx*0.0,zz, psym=symcat(9,color=cc[48])
		oplot,  [-10,10], trend[0]*[-10,10]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-10,10], [0,0]-3.0, linestyle=1, thick=2.



xyouts, 1.40,2.45,'(D)', charsize=1.1, color=cc[50]


gmp30=gmp[0:30]
for pm=0, n_elements(gmp30)-1 do begin
;if (gmp30[pm] eq 3141 or gmp30[pm] eq 2808 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 2655 or gmp30[pm] eq 2563) then xyouts, bbb30[pm]-0.03, del30[pm]-0.08,gmp30[pm], charsize=0.9, color=cc[0]
;if (gmp30[pm] eq 3119) then xyouts, bbb30[pm]-0.08, del30[pm]-0.22,gmp30[pm], charsize=0.9, color=cc[0]
endfor

gmp62=gmp[31:62]
for pm=0, n_elements(gmp62)-1 do begin
;if (gmp62[pm] eq 3034) then xyouts, bbb62[pm]-0.08, del62[pm]-0.25,gmp62[pm], charsize=0.9, color=cc[8]

endfor



item=['Existing Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]

item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

item=[item,'Cody09']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=1.0, /right
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------









ps_off




end