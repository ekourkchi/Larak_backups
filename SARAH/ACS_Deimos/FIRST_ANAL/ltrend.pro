function ltrend, xx, yy, yyerr



Q1=size(xx)
x=dblarr(1,Q1[1])
y=dblarr(1,Q1[1])
yerr=dblarr(1,Q1[1])

x=xx
y=yy
yerr=yyerr

S=1.*total(1./yerr/yerr)
Sx=1.*total(x/yerr/yerr)
Sy=1.*total(y/yerr/yerr)
Sx2=1.*total(x*x/yerr/yerr)
Sy2=1.*total(y*y/yerr/yerr)
Sxy=1.*total(x*y/yerr/yerr)

; y=ax+b
a=(S*Sxy-Sx*Sy)/(S*Sx2-Sx*Sx)
b=(Sy*Sx2-Sx*Sxy)/(S*Sx2-Sx*Sx)

da=sqrt(s/(S*Sx2-Sx*Sx))
db=sqrt(Sx2/(S*Sx2-Sx*Sx))


out=[a,b,da,db]

return, out

end function


