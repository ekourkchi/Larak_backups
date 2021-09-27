PRO standard_colors, plot=plot, cc=cc, invert=invert
;** Standard set of colours for postscript or X output
;** depending on !d.name system variable;
;** Code for colors is put into 'cc' array, used by e.g. color=cc[1].
;** To view colors on screen use IDL> standard_colors, /plot
;** author: Ivan Baldry

;** 0 = Black, 1-9 = 3x(R, G, B), 10 = white, 11-13 = grey, 14-22 = 3x(Y,C,M)

R = [0,255,0,0,192,0,0,128,0,0,255,192,128,64,255,0,255,192,0,192,128,0,128]
G = [0,0,255,0,0,192,0,0,128,0,255,192,128,64,255,255,0,192,192,0,128,128,0]
B = [0,0,0,255,0,0,192,0,0,128,255,192,128,64,0,255,255,0,192,192,0,128,128]

;** 23-25 = orange, 26-28=pink, 29=?

R = [R,255,192,128,255,192,128,130]
G = [G,128, 96, 64,  0,  0,  0,100]
B = [B,  0,  0,  0,128, 96, 64, 80]

;** sequencing
R = [R, round(255.*(1.-findgen(11)/11.)), intarr(9)                        ]
G = [G, round(255.*( findgen(11)/11.  )), round(255.*(1.-findgen(9)/8.) ) ]
B = [B, intarr(11)                      , round(255.*( findgen(9)/8.  ))  ]

;** blue to red
R = [R,36*indgen(8)    ]
G = [G,intarr(8)       ]
B = [B,252-36*indgen(8)]

;** invert colors if keyword set
if keyword_set(invert) EQ 1 then begin
  R = byte(255) - R  &    G = byte(255) - G  &    B = byte(255) - B
endif

;** load colors into table for PS ploting
tvlct, R, G, B

if !d.name EQ 'PS' then cc = indgen( n_elements(R) ) else $
  cc = R + 256L * ( G + 256L * B )

if keyword_set(invert) EQ 1 then background=cc(10) else background=cc(0)
if keyword_set(plot) EQ 1 then begin
  plot, [0,1], [0,1], /nodata, xticklen=0.001, yticklen=0.001, $
    xtickname=[' ',' '], ytickname=[' ',' '], xticks=1, yticks=1, $
    background=background
  for i=0, n_elements(R)-1 do xyouts, (i MOD 10)*0.1+0.05, 0.90-i/10*0.1, $
    string('!6',i,form='(a,i2.2)'), color=cc(i), align=0.5, chars=3, chart=3
endif

end
