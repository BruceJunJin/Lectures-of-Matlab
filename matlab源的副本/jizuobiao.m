clear all
theta=0:0.01:2*pi;
rho=sin(3*theta).*cos(5*theta);
polar(theta,rho,'r');