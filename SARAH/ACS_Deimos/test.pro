pro test

; please see myfig.ps and myfig8.ps for example

!p.charsize=1.5
!p.charthick=3.
!x.thick=3.
!y.thick=3.
!p.thick=3.
!P.multi=[0,1,1]

psout="myfig.ps"
ps_on , psout, noask='y',  cc=cc

im=readfits( 'test.fits', header)      
icplot, im, header, min=0, max=0.429


ps_off


end


