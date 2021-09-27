pro new2_tidal_mass, psout


!P.FONT = -1
;!P.FONT = 0

;SET_FONT = "tahoma*ITALIC*24" 
ps_on , psout, noask='y', /color, cc=cc  , xsize=25,ysize=35, scale_factor=0.8,xoffset=3.0
;, SET_FONT="Times-Roman"


!y.margin=9.0
!x.margin=14.0


multiplot,/reset   
!p.multi=[0,1,2,0,0]
list='gmp.r.ra.dec.dyn.stellar.tidal.txt'


readcol, list, gmp, r, ra, dec, m_dyn, m_stellar, m_tidal, err_m_dyn, /SILENT, FORMAT='I,D,A,A,D,D,D,D'




xtitl="log(M!Dtidal!N/M!D!9n!N!X)" ; - (minimum required tidal mass)"	
ytitl="log(M!D*!N/M!D!9n!N!X)"	

multiplot
;plot,  m_tidal, m_stellar, psym=yoursymbol(25,color=cc[0]),  xthick=6.,ythick=6.,   xstyle=1, ystyle=1, charsize=2.2, ytickinterval=1, yminor=10 ,  xtickinterval=1, xminor=10, ytitle=ytitl, yrange=[6.7,11.3], xrange=[6.7,11.3]

plot,  [0], /nodata , psym=yoursymbol(25,color=cc[0]),  xthick=6.,ythick=6.,   xstyle=1, ystyle=1, charsize=2.2, ytickinterval=1, yminor=10 ,  xtickinterval=1, xminor=10, ytitle=ytitl, yrange=[6.7,11.3], xrange=[6.7,11.3]

oploterror, m_tidal, m_stellar, 0.1*m_tidal/m_tidal, 0.3*m_tidal/m_tidal, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]

;oploterror, [7.5], [10.5], 0.1, 0.3, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]

oplot, [0,20], [0,20], linestyle=2, thick=4.



multiplot


ytitl="log(M!Ddyn!N/M!D!9n!N!X)"

plot,  [0], /nodata, xthick=6.,ythick=6.,   xstyle=1, ystyle=1, charsize=2.2, ytickinterval=1, yminor=10 ,  xtickinterval=1, xminor=10, ytitle=ytitl, yrange=[6.7,11.3], xrange=[6.7,11.3], xtitle=xtitl

oploterror, m_tidal, m_dyn, 0.1*m_tidal/m_tidal, sqrt(err_m_dyn^2+0.04), psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]

;oploterror, [7.5], [10.5], 0.1, 0.3, psym= yoursymbol(25,color=cc[0]), /nohat, ERRCOLOR=cc[0]

oplot, [0,20], [0,20], linestyle=2, thick=4.




ps_off

end
