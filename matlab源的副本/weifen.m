function fuck=weifen(t,u,l,k,m,g)  
fuck=[u(2); u(1).*u(4).^2+g*cos(u(3))-k/m*(u(1)-l+m*g/k); u(4);  -2.*u(2).*u(4)./u(1)-g*sin(u(3))./u(1)]; 
