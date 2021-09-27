pro plot_phenomenon_FPHOT, psout




ps_on , psout, noask='y', /color, cc=cc
device,filename=psout,xsize=20,ysize=20,xoffset=2.2
!y.margin=5
!x.margin=8.

multiplot,/reset   
!p.multi=[0,2,2,0,0]
ythickformat_origin=!y.tickformat
ythickname_origin=!y.tickname


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
i=1
j=2
xtitl="log(Re)-4.59*log(!7r!X)+27.11"
ytitl="<!7l!X!De!N>!D(F814W)!N [mag/arcsec!U2!N]"
delx=0

cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

alfa=2.94
beta=-7.16
gama=21.12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n1=n_elements(mag)
for w=0, n1-1  do begin
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then data1[w,*]=0.*data1[w,*]
endfor 

;x1=data[*,i-1]-delx
x1=alfa*data1[*,3-1]+beta*data1[*,5-1]+gama
y1=data1[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

x1er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y1er=2.*erre/(10.^logre)
print, ern
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=alfa*data11[*,3-1]+beta*data11[*,5-1]+gama
y11=data11[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.sn15.lst',ermag,erre,erre2,ern,ersigma,gmp

x11er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y11er=2.0*erre/(10.^logre)

n11=n_elements(mag)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'matko.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then data2[w,*]=0.*data2[w,*]
endfor 


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x2=data[*,i-1]-delx
x2=alfa*data2[*,3-1]+beta*data2[*,5-1]+gama

y2=data2[*,j-1]
x2er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y2er=2.*erre/(10.^logre)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'cody.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
endfor 


for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x3=data[*,i-1]-delx
x3=alfa*data3[*,3-1]+beta*data3[*,5-1]+gama

y3=data3[*,j-1]
x3er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y3er=2.*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])




xtitl='a*log(R!De!N)+b*log(n)+c'


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.1,  xrange=[14.5,25],yrange=[16.5,23.5], color=cc[0],  ytitle=ytitl , xstyle=1, ystyle=1

xyouts, 21.0,17.8,'a=2.94!M+!X0.97', color=cc[0], size=0.8
xyouts, 21.0,17.3,'b=-7.16!M+!X0.92', color=cc[0], size=0.8
xyouts, 21.0,16.9,'c=22.28!M+!X0.50', color=cc[0], size=0.8
xyouts, 24.0,23.0,'(a)', color=cc[50], size=0.9


oploterror, x1,y1,x1er,y1er, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oploterror, x11,y11,x11er,y11er, psym= yoursymbol(25,color=cc[0]),/nohat, ERRCOLOR=cc[0]

oploterror, x2,y2,x2er,y2er, psym= yoursymbol(22,color=cc[8]), /nohat, ERRCOLOR=cc[8]
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterror, x3,y3,x3er,y3er, psym= yoursymbol(21,color=cc[30]), /nohat, ERRCOLOR=cc[30]
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

oplot, [16.5,23.5],[16.5,23.5],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n1=n_elements(mag)

for w=0, n1-1  do begin
if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
endfor 

;x1=data[*,i-1]-delx
x1=3.45*data1[*,3-1]-4.48*data1[*,4-1]+26.88
y1=data1[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma,gmp

x1er=0.5*(3.45*erre/(10.^logre)+4.48*ersigma/(10.^logsigma))
y1er=2.0*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]




;x1=data[*,i-1]-delx
x11=3.45*data11[*,3-1]-4.48*data11[*,4-1]+26.88
y11=data11[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.sn15.lst',ermag,erre,erre2,ern,ersigma,gmp

x11er=0.5*(3.45*erre/(10.^logre)+4.48*ersigma/(10.^logsigma))
y11er=2.0*erre/(10.^logre)

n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'matko.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then data2[w,*]=0.*data2[w,*]
endfor 


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x2=data[*,i-1]-delx
x2=3.45*data2[*,3-1]-4.48*data2[*,4-1]+26.88

y2=data2[*,j-1]
x2er=0.5*(3.45*erre/(10.^logre)+4.48*ersigma/(10.^logsigma))
y2er=2.0*erre/(10.^logre)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'cody.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
endfor 



for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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
if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
endfor

endfor


;x3=data[*,i-1]-delx
x3=3.45*data3[*,3-1]-4.48*data3[*,4-1]+26.88

y3=data3[*,j-1]
x3er=0.5*(3.45*erre/(10.^logre)+4.48*ersigma/(10.^logsigma))
y3er=2.0*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])



xtitl='a*log(R!De!N)+b*log(!7r!X)+c'


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.1,  xrange=[14.5,25],yrange=[16.5,23.5], color=cc[0],  xstyle=1, ystyle=1

xyouts, 21,17.8,'a=3.45!M+!X0.39', color=cc[0], size=0.8
xyouts, 21,17.3,'b=-4.48!M+!X0.67', color=cc[0], size=0.8
xyouts, 21,16.9,'c=28.25!M+!X1.45', color=cc[0], size=0.8
xyouts, 24.0,23.0,'(b)', color=cc[50], size=0.9


oploterror, x1,y1,x1er,y1er, psym= yoursymbol(24,color=cc[0]), /nohat, ERRCOLOR=cc[0]
item=['Deimos Data']
lstyle=[1]
sym= [24]
c_colors=[0]
oploterror, x11,y11,x11er,y11er, psym= yoursymbol(24,color=cc[0]),/nohat, ERRCOLOR=cc[0]

oploterror, x2,y2,x2er,y2er, psym= yoursymbol(22,color=cc[8]), /nohat, ERRCOLOR=cc[8]
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterror, x3,y3,x3er,y3er, psym= yoursymbol(21,color=cc[30]), /nohat, ERRCOLOR=cc[30]
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

oplot, [16.5,23.5],[16.5,23.5],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot
cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'

alfa=2.49317
beta=-7.29247
gama=21.4755
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n1=n_elements(mag)
for w=0, n1-1  do begin
if data1[w,7-1] eq 3471 or data1[w,7-1] eq 2654 or data1[w,7-1] eq 3292 or data1[w,7-1] eq 3098 then data1[w,*]=0.*data1[w,*]
endfor 

;x1=data[*,i-1]-delx
x1=alfa*data1[*,3-1]+beta*data1[*,5-1]+gama
y1=data1[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

x1er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y1er=2.*erre/(10.^logre)
print, ern
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

;x1=data[*,i-1]-delx
x11=alfa*data11[*,3-1]+beta*data11[*,5-1]+gama
y11=data11[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.sn15.lst',ermag,erre,erre2,ern,ersigma,gmp

x11er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y11er=2.0*erre/(10.^logre)

n11=n_elements(mag)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'matko.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n2=n_elements(mag)
for w=0, n2-1  do begin
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then data2[w,*]=0.*data2[w,*]
endfor 


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x2=data[*,i-1]-delx
x2=alfa*data2[*,3-1]+beta*data2[*,5-1]+gama

y2=data2[*,j-1]
x2er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y2er=2.*erre/(10.^logre)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'cody.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n3=n_elements(mag)
for w=0, n3-1  do begin
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
endfor 


for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x3=data[*,i-1]-delx
x3=alfa*data3[*,3-1]+beta*data3[*,5-1]+gama

y3=data3[*,j-1]
x3er=(alfa*erre/(10.^logre)+abs(beta)*ern/(10.^logn))
y3er=2.*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])



xtitl='a*log(R!De!N)+b*log(n)+c'


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.1,  xrange=[14.5,25],yrange=[16.5,23.5], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1

xyouts, 21,17.8,'a=2.49!M+!X0.40', color=cc[0], size=0.8
xyouts, 21,17.3,'b=-7.29!M+!X0.41', color=cc[0], size=0.8
xyouts, 21,16.9,'c=22.47!M+!X0.13', color=cc[0], size=0.8
xyouts, 24.0,23.0,'(c)', color=cc[50], size=0.9


oploterror, x1,y1,x1er,y1er, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]
item=['Deimos Data']
lstyle=[1]
sym= [25]
c_colors=[0]
oploterror, x11,y11,x11er,y11er, psym= yoursymbol(25,color=cc[0]),/nohat, ERRCOLOR=cc[0]

oploterror, x2,y2,x2er,y2er, psym= yoursymbol(22,color=cc[8]), /nohat, ERRCOLOR=cc[8]
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterror, x3,y3,x3er,y3er, psym= yoursymbol(21,color=cc[30]), /nohat, ERRCOLOR=cc[30]
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

oplot, [16.5,23.5],[16.5,23.5],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
multiplot

cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'
deimos_sn15='deimos.all.sersic.sigma.master02_sn15.lst'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]


n1=n_elements(mag)

for w=0, n1-1  do begin
if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
endfor 

;x1=data[*,i-1]-delx
x1=3.27492*data1[*,3-1]-4.17199*data1[*,4-1]+26.2800
y1=data1[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma,gmp

x1er=0.5*(3.27492*erre/(10.^logre)+4.17199*ersigma/(10.^logsigma))
y1er=2.0*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos_sn15, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data11=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]




;x1=data[*,i-1]-delx
x11=3.27492*data11[*,3-1]-4.17199*data11[*,4-1]+26.2800
y11=data11[*,j-1]
readcol, 'deimos.all.sersic.sigma.errors.sn15.lst',ermag,erre,erre2,ern,ersigma,gmp

x11er=0.5*(3.27492*erre/(10.^logre)+4.17199*ersigma/(10.^logsigma))
y11er=2.0*erre/(10.^logre)

n11=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'matko.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n2=n_elements(mag)
for w=0, n2-1  do begin
;if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 then data2[w,*]=0.*data2[w,*]
if data2[w,7-1] eq 3098  or data2[w,7-1] eq 2510 or data2[w,7-1] eq 2516 or data2[w,7-1] eq 3254 or data2[w,7-1] eq 3068 or data2[w,7-1] eq 2489 or data2[w,7-1] eq 2922 then data2[w,*]=0.*data2[w,*]
endfor 


for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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


;x2=data[*,i-1]-delx
x2=3.27492*data2[*,3-1]-4.17199*data2[*,4-1]+26.2800

y2=data2[*,j-1]
x2er=0.5*(3.27492*erre/(10.^logre)+4.17199*ersigma/(10.^logsigma))
y2er=2.0*erre/(10.^logre)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, cody, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data3=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

readcol, 'cody.all.sersic.sigma.errors.lst',ermag,erre,erre2,ern,ersigma

n3=n_elements(mag)
for w=0, n3-1  do begin
;if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
if data3[w,7-1] eq 5364 or data3[w,7-1] eq 4135 or  data3[w,7-1] eq 5102 or  data3[w,7-1] eq 4381 or  data3[w,7-1] eq 5365 or  data3[w,7-1] eq 4215  then data3[w,*]=0.*data3[w,*]
endfor 



for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]
ermag[q]=0.0
erre[q]=0.0
ern[q]=0.0
ersigma[q]=0.0
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
if data1[w,7-1] eq 3471 then data1[w,*]=0.*data1[w,*]
endfor

endfor


;x3=data[*,i-1]-delx
x3=3.27492*data3[*,3-1]-4.17199*data3[*,4-1]+26.2800

y3=data3[*,j-1]
x3er=0.5*(3.27492*erre/(10.^logre)+4.17199*ersigma/(10.^logsigma))
y3er=2.0*erre/(10.^logre)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
minx= min([x1,x2,x3])
miny= min([y1,y2,y3])
maxx= max([x1,x2,x3])
maxy= max([y1,y2,y3])




xtitl='a*log(R!De!N)+b*log(!7r!X)+c'


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.1,  xrange=[14.5,25],yrange=[16.5,23.5], color=cc[0], xtitle=xtitl , xstyle=1, ystyle=1

xyouts, 21,17.8,'a=3.27!M+!X0.49', color=cc[0], size=0.8
xyouts, 21,17.3,'b=-4.17!M+!X0.86', color=cc[0], size=0.8
xyouts, 21,16.9,'c=27.58!M+!X1.86', color=cc[0], size=0.8
xyouts, 24.0,23.0,'(d)', color=cc[50], size=0.9


oploterror, x1,y1,x1er,y1er, psym= yoursymbol(24,color=cc[0]), /nohat, ERRCOLOR=cc[0]
item=['Deimos Data']
lstyle=[1]
sym= [24]
c_colors=[0]
oploterror, x11,y11,x11er,y11er, psym= yoursymbol(24,color=cc[0]),/nohat, ERRCOLOR=cc[0]

oploterror, x2,y2,x2er,y2er, psym= yoursymbol(22,color=cc[8]), /nohat, ERRCOLOR=cc[8]
item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

oploterror, x3,y3,x3er,y3er, psym= yoursymbol(21,color=cc[30]), /nohat, ERRCOLOR=cc[30]
item=[item,'Cody08']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

oplot, [16.5,23.5],[16.5,23.5],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear,charsize=0.8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




ps_off




end