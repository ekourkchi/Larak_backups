pro plot475_814_extra, psout


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=20,ysize=18, scale_factor=1;, 
;, SET_FONT="Times-Roman"

list='475.814.nsigma.ugriz.lst'
extralist='475.814.extralight.lst'
corelight='corelight.814.475.txt'
errors='errors.814.475.txt'
gradient='gmp.colorgradient.txt'
colorresid='output.new.txt'

readcol, list, mag814, re814, ser814, idver, n814, gmp, sigma, ra, dec, n475, mag475, re475, ser475, u, g, r, i, z, /SILENT, FORMAT='D,D,D,I,I,I,D,A,A,I,D,D,D,D,D,D,D,D'

readcol, extralist, gmp1, extralight, /SILENT, FORMAT='I,D'

readcol, corelight, gmp2, f814_1, f814_2, f814_3, f814_4, ef814_1, ef814_2, ef814_3, ef814_4, f475_1, f475_2, f475_3, f475_4, ef475_1, ef475_2, ef475_3, ef475_4, FORMAT='I,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D', /SILENT

readcol, errors, gmp3, ermag814, erre814, erser814, ermag475, erre475, erser475, ersigma, FORMAT='I,D,D,D,D,D,D,D', /SILENT

readcol, gradient, gmp4, alf, bet, dalf, dbet, FORMAT='I,D,D,D,D',  /SILENT

readcol, colorresid, gmp5, colorresi, FORMAT='I,D',  /SILENT

num= n_elements(mag814)

; 2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222.
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


;tresh=abs(alf/dalf)
;modgmp[where(tresh lt 1.0)]=0
;print, modgmp

aa=modgmp
modgmp1=aa[0:30]
modgmp2=aa[31:62]
modgmp3=aa[63:74]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mu814=mag814+2.5*alog10(2*3.1415*re814*re814*0.0025)
re814kpc=alog10(re814*0.05*0.4)
logsigma=alog10(sigma)

mu475=mag475+2.5*alog10(2*3.1415*re475*re475*0.0025)
re475kpc=alog10(re475*0.05*0.4)

logn814=alog10(ser814)
logn475=alog10(ser475)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

alfa=3.32749
beta=-4.14873
gama=27.5066

dalfa=0.323104
dbeta=0.302161
dgama=0.573808

dalfa = dalfa * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dbeta = dbeta * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level
dgama = dgama * 0.5    ; %95 confidence level to 1-Sigma %68 confidence level

x=alfa*re814kpc+beta*logsigma+gama
y=mu814
xer=sqrt((dalfa*re814kpc)^2+(alfa*erre814/re814)^2+(dbeta*logsigma)^2+(beta*ersigma/sigma)^2+(dgama)^2)
;xer=sqrt((2.0*re814kpc)^2+(alfa*erre814/re814)^2+(1.0*logn814)^2+(beta*erser814/ser814)^2+(0.3)^2)

;yer=(ermag814)+(5.*erre814/re814)
yer=sqrt((0.05)^2+(5.*1./re814)^2)
delta=abs(y-x)

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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





del30=delta[0:30]
del62=delta[31:62]
del74=delta[63:74]
del30=del30[where(modgmp1 ne 0)]
del62=del62[where(modgmp2 ne 0)]
del74=del74[where(modgmp3 ne 0)]


;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
gg=[modgmp[0:68],modgmp[70:74]]







	ytitl="!7D!X!DFP!N = |<!7l!X>!De!N-<!7l!X>!De!N!U*!N| [mag]"
	









;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

	bbb=extralight
	
bbb30=bbb[0:30]
bbb62=bbb[31:62]
bbb74=bbb[63:74]

bbb30=bbb30[where(modgmp1 ne 0)]
bbb62=bbb62[where(modgmp2 ne 0)]
bbb74=bbb74[where(modgmp3 ne 0)]





	
	xtitl="Central Excess Light [%] (D=0.4'')"
	plot,  [0], /nodata, xtitle=xtitl, xstyle=1, ystyle=1, charsize=1.5, xthick=3., ythick=3., yrange=[-3.5,3.5], xrange=[-15,70], xminor=4, yminor=4,xtickinterval=20, ytitle=ytitl
	oplot,  bbb30, del30, psym= yoursymbol(24,color=cc[0])
	oplot, bbb62, del62, psym= yoursymbol(22,color=cc[8])
	oplot, bbb74, del74, psym= yoursymbol(21,color=cc[30])

ss=bbb
tt=delta
;ss=[bbb[0:68],bbb[70:74]]
;tt=[delta[0:68],delta[70:74]]
ss=ss[where(modgmp ne 0)]
tt=tt[where(modgmp ne 0)]
trend=ltrend(ss,tt,tt/tt)


oplot,  [-100,100], trend[0]*[-100,100]+trend[1], linestyle=2, thick=3.
oplot,  [-100,100], [0,0], linestyle=1, thick=2.



		t= bsort(bbb, /reverse)
		bbt=bbb(t)
		delat=delta(t)
		i=0
		d=15
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
		oplot,  [-100,100], trend[0]*[-100,100]+trend[1]-3.0, linestyle=2, thick=3.
		oplot,  [-100,100], [0,0]-3.0, linestyle=1, thick=2.


xyouts, -7,-0.30,'a='+strtrim(string(trend[0], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[2],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, -7,-0.70,'b='+strtrim(string(trend[1], FORMAT='(F6.2)'),2)+'!M+!X'+strtrim(string(trend[3],FORMAT='(F5.2)'),2), color=cc[50], size=1.3
xyouts, -7,-1.1,'CC=0.12', size=1.3
;xyouts, -7,3.0,'(D)', charsize=1.0, color=cc[0]
gmp30=gmp[0:30]
gmp30=gmp30[where(modgmp1 ne 0)]
for pm=0, n_elements(gmp30)-1 do begin
if (gmp30[pm] eq 3141 or  gmp30[pm] eq 2780 or  gmp30[pm] eq 2655  or gmp30[pm] eq 3080) then xyouts, bbb30[pm]-8, del30[pm]-0.25,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 3119) then xyouts, bbb30[pm]-8, del30[pm]-0.25,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2563) then xyouts, bbb30[pm]-8, del30[pm]+0.1,gmp30[pm], charsize=1.1, color=cc[0]
if (gmp30[pm] eq 2808) then xyouts, bbb30[pm]-6, del30[pm]-0.25,gmp30[pm], charsize=1.1, color=cc[0]

endfor







item=['Deimos Sample']
lstyle=[1]
sym= [24]
c_colors=[0]

item=[item,'MG05']
lstyle=[lstyle,1]
sym= [sym,22]
c_colors=[c_colors,8]

item=[item,'Cody09']
lstyle=[lstyle,1]
sym= [sym,21]
c_colors=[c_colors,30]

polyfill, [-24,-24,-16,-16],[-3.25,-0.75,-0.75,-3.25],color=cc[10]
vv=-32
xyouts, vv, -3-0.07, 0, color=cc[0], size=1.5
xyouts, vv, -2-0.07, 1, color=cc[0], size=1.5
xyouts, vv, -1-0.07, 2, color=cc[0], size=1.5

legend, item, linestyle=lstyle, color=c_colors , psym=sym, /clear, charsize=0.9




ps_off

end
