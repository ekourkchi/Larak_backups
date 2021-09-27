pro larger, filename


fits_read, filename, image, h

nx= sxpar(h,'NAXIS1')
ny= sxpar(h,'NAXIS2')
newimage=dblarr(nx+512,ny+512)

newimage[256:nx+255,256:ny+255]=image

SXADDPAR, h, 'NAXIS1', nx+512, /SAVECOMMENT
SXADDPAR, h, 'NAXIS2', ny+512, /SAVECOMMENT

fits_write, 'lg'+filename, newimage, h

end

