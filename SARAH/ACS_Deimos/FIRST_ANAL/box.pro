pro box, x1,x2, linestyle=linestyle, color=color, thick=thick


x=x1[0]
y=x1[1]

z=x2[0]
t=x2[1]


oplot, [x,z],[y,y], linestyle=linestyle, color=color, thick=thick
oplot, [x,x],[y,t], linestyle=linestyle, color=color, thick=thick
oplot, [x,z],[t,t], linestyle=linestyle, color=color, thick=thick
oplot, [z,z],[y,t], linestyle=linestyle, color=color, thick=thick









end