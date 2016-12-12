clear 
clc

data = [5   5   5   5   5   5   5   10  10  10  10  10  10  10  15  15  15  15  15  15  15  20  20  20  20  20  20  20  25  25  25  25  25  25  25  30  30  30  30  30  30  30  
144 176 208 240 272 320 512 144 176 208 240 272 320 512 144 176 208 240 272 320 512 144 176 208 240 272 320 512 144 176 208 240 272 320 512 144 176 208 240 272 320 512  
135.346 138.193 147.369 137.871 140.782 143.022 146.985 179.075 230.787 236.99  240.18  232.734 248.473 249.812 218.834 242.56  276.038 282.54  293.582 320.17  279.204 215.68  286.505 313.645 334.782 325.526 332.145 337.282 231.54  261.884 324.214 343.436 367.167 372.446 340.181 259.584 302.132 313.351 347.63  340.478 414.03  443.249]';

x1 = data(:,1);  
x2 = data(:,2);  
y = data(:,3); 

X = [ones(size(x1)) x1.*x1 x1 x2.*x2 x2 x1.*x2];

[b,bint,r,rint,stats] = regress(y,X,0.05)

subplot(1,2,1),
scatter3(x1,x2,y,'filled')

hold on

x1g = min(x1):0.5:max(x1);  
x2g = min(x2):0.5:max(x2);  
[X1g,X2g] = meshgrid(x1g,x2g);  
Yg = b(1)+ b(2)*X1g.*X1g+b(3)*X1g + b(4)*X2g.*X2g + b(5)*X2g + b(6)*X1g.*X2g;  
mesh(X1g,X2g,Yg) 
xlabel('x1')  
ylabel('x2')  
zlabel('Y')  
view(140,30)

subplot(1,2,2),
rcoplot(r,rint)
 