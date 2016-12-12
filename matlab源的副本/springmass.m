function springmass  
theta0=1.5*pi/10; 
m = 20/9.8; 
k = 80; 
g = 9.8;  
L0 = 1; 
L = L0 + m*g/k; 
[t,u1] = ode45(@weifen,[0 : 0.05: 15],[L0 0 theta0 0],[],L,k,m,g);  
[y1,x1] = pol2cart(u1(:,3),u1(:,1));
y1 = -y1;
axis([0 16 -1.5 4]);  
grid;
text(0,u1(1,1),'摆长l');
text(0,u1(1,3),'摆角\theta');
title('弹簧摆是坠吼的','fontsize',15) 
xlabel('时间t 单位秒'); 
ylabel('对应变量'); 
hold on;  
R =0.055;
yy = -L0 : 0.01 : 0;  
xx = R*sin(yy./L0*30*pi);
[a,r] = cart2pol(xx,yy); 
a = a + theta0;  
[xx,yy] = pol2cart(a,r);
xx=2*xx+7;
yy=yy+3.5; 
line([6 8],[3.5 3.5],'color','k','linewidth',4)
for i=1:9      
    line([6+0.2*i 6+0.2*i+0.2],[3.5 3.7],'color','k','linewidth',1); 
end
line([7 7],[3.5 2.3],'color','k','linestyle','-.','linewidth',1) 
ball = plot(xx(1),yy(1),'color','b','marker','.','markersize',50,'erasemode','xor');  
balline = plot(xx(1),yy(1),'color','g','linestyle','-','linewidth',1.3,'erasemode','none');  
spring = plot(xx,yy,'color','k','linewidth',2,'erasemode', 'xor'); 
pause(2)  
for i = 2 : length(t)  
    yy = -u1(i,1) : 0.01 : 0;
    xx = R*sin(yy./u1(i,1)*30*pi); 
    [a,r] = cart2pol(xx,yy); 
    a = a + u1(i,3);  
    plot([t(i-1),t(i)],[u1((i-1),1),u1(i,1)],'xr'); 
    plot([t(i-1),t(i)],[u1((i-1),3),u1(i,3)],'*b'); 
    [xx,yy] = pol2cart(a,r); 
    xx=2*xx+7;
    yy=yy+3.5;  
    set(ball,'XData',2*x1(i)+7,'YData',y1(i)+3.5); 
    plot([2*x1(i-1)+7,2*x1(i)+7],[y1(i-1)+3.5,y1(i)+3.5],'-g'); 
    set(spring,'XData',xx,'YData',yy);
    drawnow;
end  