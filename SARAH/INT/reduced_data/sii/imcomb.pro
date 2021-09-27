pro imcomb, file, bpm, file1, bpm1, result


fits_read, file, image, h
fits_read, bpm, bm, hbm
fits_read, file1, image1, h1
fits_read, bpm1, bm1, hbm1

bm=(bm EQ 0.)
bm1=(bm1 EQ 0.)

bm000 = bm + bm1
bm000 = bm000 + (bm000 EQ 0.)

image000 = image * bm + image1 * bm1
image001 = image000 / bm000




fits_write, result, image001, h

end


