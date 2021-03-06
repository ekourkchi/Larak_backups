;***********************************************************************

PRO ICPLOT, im, head, min=min, max=max, respen=respen, _extra=extra, noscale=noscale,full=full

;+
; NAME:
;	ICPLOT
;
; PURPOSE:
;	Plots an image on current display device. If a FITS header is
;	supplied then coordinates are overlayed in a style defined by
;       the /type keyword (see iccontour). The greyscale levels can be
;	adjusted with the min and max keywords and a number of reserved
;	pens can be saved with the /respen keyword.
;
; CALLING SEQUENCE:
;	ICPLOT ,im [,head ,/min ,/max ,/respen ,/extra]
;
; INPUTS:
;	im: data array containing image (e.g from readfits)
;
; OPTIONAL INPUTS:
;	head: FITS file header (e.g. from readfits)
;
; KEYWORD PARAMETERS:
;	min: minimum value to plot
;	max: maximum value to plot
;   noscale: image is ploted "as is" with no byte scaling useful for gifs etc
;            with predefined LUTs
;      full: if set then full window is used for image
;	Any keyword accepted by ICCONTOUR may be passed through ICPLOT.
;
; EXAMPLE:
;	im = readfits( '0026+1041.fit',head )    Reads in fits file
;	icplot, im, head, min=0, max=100         Plot image on display
;
; MODIFICATION HISTORY:
; 	Written by:	Nick Eaton  10 May 1996
;        4 Jun 1996	Allow for !p.multi plots. (N.Eaton)
;       14 Jun 1996	Add _extra paramter. (N.Eaton)
;        1 Nov 1996	Remove /type keyword from iccontour call. (N.Eaton)
;        1 Nov 1996	Add /respen keyword to reserve pens. (N.Eaton)
;       18 Jun 1997     added noscale keyword useful for gifs (S. Oliver)
;-

; Return to caller for error conditions
on_error, 2
 
; Check that there are sufficient input parameters 
if ( n_params() lt 1 ) then begin
   print, 'Usage: icplot, im [,head ,min= ,max= ,respen= ,/extra]'
   return
endif

; Test image dimensions 
s = size( im )
if ( s( 0 ) ne 2 ) then begin
   print, 'Image must be 2-dimensional'
   return
endif

; Check if device has scalable pixels
if ( !d.flags and 1 ) then scale = 1 else scale = 0

; Set the number of reserved pens
if not keyword_set( respen ) then respen = 0

; If a FITS header has been supplied use iccontour to set window parameters
; Plot in the background colour so no axes appear
if keyword_set( head ) then begin
   if keyword_set(full) then begin
     iccontour, im, head, _extra=extra,color = !p.background, /nodata,/full
   endif else begin
     iccontour, im, head, _extra=extra,color = !p.background, /nodata
   endelse
; Get size of window for scaleable or non-scaleable devices
   if ( scale ) then begin
      px = !x.window
      py = !y.window
   endif else begin
      px = !x.window * !d.x_vsize
      py = !y.window * !d.y_vsize
   endelse

; If there is no FITS header then set the window parameters so that the
; limits match the array size to the window size, or in the case of
; multiple plots the sub-window.
endif else begin

; Clear the screen at the start of a new page
   if ( !p.multi( 0 ) eq 0 ) then erase

; Set the plot area to be a set fraction of the sub-window area
   p1 = max( [ 1.0, float( !p.multi( 1 ) ) ] )
   p2 = max( [ 1.0, float( !p.multi( 2 ) ) ] )
   x1 = 0.15 / p1
   x2 = 0.95 / p1
   y1 = 0.15 / p2
   y2 = 0.95 / p2
if keyword_set(full) then begin
   x1 = 0. / p1
   x2 = 1. / p1
   y1 = 0. / p2
   y2 = 1. / p2
endif

; For multiple plots set the plot origin to the sub-window origin
   np = !p.multi( 1 ) * !p.multi( 2 )
   if ( np gt 0 ) then begin
      ny = !p.multi( 0 ) / !p.multi( 1 )
      x0 = float( !p.multi( 0 ) - ny * !p.multi( 1 ) ) / p1
      y0 = float( !p.multi( 2 ) - 1 - ny ) / p2

; Increment the plot counter
      !p.multi( 0 ) = !p.multi( 0 ) + 1
      if ( !p.multi( 0 ) ge np ) then !p.multi( 0 ) = 0

; For single plots set the plot origin to the window origin
   endif else begin
      x0 = 0.0
      y0 = 0.0
   endelse

; Set the plotting limits to ensure square pixels
   sx = p1 * float( s( 1 ) )
   sy = p2 * float( s( 2 ) )
   rx = float( !d.x_vsize ) / sx
   ry = float( !d.y_vsize ) / sy
   r = min( [ rx, ry ] )
   if ( scale ) then begin
      px = [ x0 + x1 * r / rx, x0 + x2 * r / rx ]
      py = [ y0 + y1 * r / ry, y0 + y2 * r / ry ]
   endif else begin
      x0 = x0 * float( !d.x_vsize )
      y0 = y0 * float( !d.y_vsize )
      px = [ x0 + x1 * r * sx, x0 + x2 * r * sx ]
      py = [ y0 + y1 * r * sy, y0 + y2 * r * sy ]
   endelse

; Finished setting window parameters
endelse

; Set and report minimum and maximum greyscale levels
if keyword_set( min ) then min_p = min else min_p = min( im )
if keyword_set( max ) then max_p = max else max_p = max( im )
print, 'Minimum value for plot (black) is ', min_p
print, 'Maximum value for plot (white) is ', max_p
print, 'Number of levels is ', !d.table_size-respen

; Define size and origin of plotted image
sx = px( 1 ) - px( 0 )
sy = py( 1 ) - py( 0 )
x0 = px( 0 )
y0 = py( 0 )

;ss=size(im)
;imm=rebin(im,10*ss[1],10*ss[2])
;im=imm

if keyword_set (noscale) then begin 
   tvim=im
endif else begin
tvim=255B-bytscl( sqrt(im) , min=min_p, max=max_p, top=!d.table_size-respen-1 )+respen

;tvim =  LogScl(sqrt(im), Max=max_p, Min=min_p, $
 ;                  Mean=0.7*(max_p+min_p), Exponent=2.7, Negative=1)
    

endelse

; Plot pixel map scaled from min to max value into avalable colour map
; allowing for the reserved pens.
; For scaleable devices use normalised-device coordinates
if ( scale ) then $
   tv, tvim,  x0, y0, xsize = sx, ysize = sy, /norm $

; Otherwise construct a pixel map of the desired size
else $
   tv, congrid(tvim, sx, sy ), x0, y0

; Overlay axis labels but with no contours
if keyword_set( head ) and not keyword_set(full) then begin
   if keyword_set(full) then begin
     iccontour, im, head, _extra=extra, /noerase, /nodata,/full
   endif else begin
     iccontour, im, head, _extra=extra, /noerase, /nodata
   endelse
endif


return

end

