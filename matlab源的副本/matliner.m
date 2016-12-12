clear all
a0=[2 3;6 4]; 
a1=[-10 1;-20 3]; 
a2=[1 3;5 2]; 
syms p1 p2 p3 p4 p; 
p=[p1 p2;p3 p4]
%二次矩阵方程是：p^2*a2+p*a1+a0=0; 
eq=p^2*a2+p*a1+a0;
[p1,p2,p3,p4]=solve(eq(1,1),eq(1,2),eq(2,1),eq(2,2),p1,p2,p3,p4);
p1=double(p1)
p2=double(p2)
p3=double(p3)
p4=double(p4)
t=1;
[m,n]=size(p1);
pp=zeros(2,2,m);
for i=1:m
    if (imag(p1(i))==0)&(imag(p2(i))==0)&(imag(p3(i))==0)&(imag(p4(i))==0)
         P1=p1(i,1);P2=p2(i,1);P3=p3(i,1);P4=p4(i,1);
        pp(:,:,t)=[P1,P2;P3,P4];
        t=t+1;
        %非0计数器
    end
end
P=pp(:,:,1:t-1)

