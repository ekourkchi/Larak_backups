pro plot_phenomenon_cor,i,j, delx


cody='cody.all.sersic.sigma.master02.lst'
matko='matko.all.sersic.sigma.master02.lst'
deimos='deimos.all.sersic.sigma.master02.lst'

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, deimos, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data1=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

x1=data1[*,i-1]-delx
;x1=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11
y1=data1[*,j-1]
z1=y1*0.0


n1=n_elements(mag)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readcol, matko, mag,mu_e,logre,logsigma,logn,dfp,gmp,ra,dec,chi2,arms,aabs,rrms,rabs,r80,r20,c,m_use,mu_egalfit,mu_0se,mu_0galfit,ellipticity, format='D,D,D,D,D,D,D,A,A,D,D,D,D,D,D,D,D,D,D,D,D,D', /silent
data2=[[mag],[mu_e],[logre],[logsigma],[logn],[dfp],[gmp],[ra],[dec],[chi2],[arms],[aabs],[rrms],[rabs],[r80],[r20],[c],[m_use],[mu_egalfit],[mu_0se],[mu_0galfit],[ellipticity]]

n2=n_elements(mag)
for q=0, n2-1  do begin
for w=0, n1-1  do begin
if data2[q,7-1] eq data1[w,7-1]  then begin 
data2[q,*]=0.*data2[q,*]

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
for q=0, n3-1  do begin
for w=0, n1-1  do begin
if data3[q,7-1] eq data1[w,7-1] then begin 
data3[q,*]=0.*data3[q,*]

endif
endfor
endfor


x3=data3[*,i-1]-delx
;x3=3.47*data[*,3-1]-4.59*data[*,4-1]+27.11

y3=data3[*,j-1]
z3=y3*0.0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





x=[x1,x2,x3]
y=[y1,y2,y3]


a=where(x ne -delx ) 
x=(x[a])
y=(y[a])

n=n_elements(x)

;print,  x
;print,  y


sx=stdev(x)
sy=stdev(y)
;help , sx

C=((x-sx[0])##transpose(y-sy[0]))/(n-1)/(sx[1])/(sy[1])



print ,"Correlation("+strtrim(i,2) +","+strtrim(j,2)+")=", C







end