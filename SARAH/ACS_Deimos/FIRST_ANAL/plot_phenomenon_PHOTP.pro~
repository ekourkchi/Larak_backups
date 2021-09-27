pro plot_phenomenon_PHOTP,psout,i,j, xtitl,ytitl, delx


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



ps_on , psout, noask='y', /color, cc=cc

xtitl='a*log(R!De!N)+b*log(n)+c'


plot, [0], /nodata, xthick=3.,ythick=3.,charsize=1.1,  xrange=[minx-.2,26],yrange=[17,23], color=cc[0], xtitle=xtitl, ytitle=ytitl , xstyle=1, ystyle=1

xyouts, 23.5,18.0,'a=2.49!M+!X0.40', color=cc[0], size=0.8
xyouts, 23.5,17.7,'b=-7.29!M+!X0.41', color=cc[0], size=0.8
xyouts, 23.5,17.4,'c=22.47!M+!X0.13', color=cc[0], size=0.8


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

oplot, [17,23],[17,23],linestyle=3, color=cc[0], thick=1.

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.8


ps_off




end