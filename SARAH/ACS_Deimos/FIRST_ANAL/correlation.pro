function correlation, x ,y




N=n_elements(x)
M=n_elements(Y)

if M ne N then print, "X and Y must have the same dimension." 
sum=0.0

x*=1.0
y*=1.0

u=stdev(x)
mean_x=u[0]
stdev_x=u[1]

u=stdev(y)
mean_y=u[0]
stdev_y=u[1]

for i=0, N-1 do sum+=(x[i]-mean_x)*(y[i]-mean_y)

;print, sum

CC=sum/N
CC=1.0*CC/stdev_x/stdev_y
;print, mean_y, stdev_y
return, CC





end
