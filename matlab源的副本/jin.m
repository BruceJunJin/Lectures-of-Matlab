
function jin
 clear;clc
 [t,x]=ode45(@jindot,[0,100],[0.1;0.2]);
 plot(x(:,1),x(:,2))

function dx=jindot(t,x)
 dx=[
   x(2)+x(1).*(1-x(1).^2-x(2).^2);
   -x(1)+x(2).*(1-x(1).^2-x(2).^2)
 ];
 

