clear all
syms t y
u=exp(-5*t)*cos(2*t-1)+5;
uu=5*diff(u,t,2)+4*diff(u,t)+2*u
y=dsolve('D4y+10*D3y+35*D2y+50*Dy+24*y=uu')
