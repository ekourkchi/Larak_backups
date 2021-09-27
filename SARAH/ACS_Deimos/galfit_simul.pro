pro galfit_simul, outfile, acsid, no, ver, seed

sersic=ACSID+'_'+no+'.gal.out.ver'+ver+'.sersic.fits'
residual=ACSID+'_'+no+'.gal.out.ver'+ver+'.residu.BACK.fits'
residual_rms=ACSID+'_'+no+'.gal.out.ver'+ver+'.residu.RMS.fits'


fits_read, sersic, imsersic, hsersic
fits_read, residual, imresidual, hresidual
fits_read, residual_rms, imresidual_rms, hresidual_rms

nx= sxpar(hsersic,'NAXIS1')
ny= sxpar(hsersic,'NAXIS2')
newsersic=dblarr(nx,ny)


;newsersic=imsersic
newsersic=imsersic+imresidual+3.*imresidual_rms*randomn(seed,nx,ny)


fits_write, outfile , newsersic, hsersic
print, "File ", outfile,"     created ....."

end