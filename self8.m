a=0;
b=10;
dx=0.01;
xf=a:dx:b;
yf=sin(xf);

n=length(xf);

%左端点估计
area_left=0;
%for i=1:n-1
%    area_left=area_left+yf(i)*dx;
%end
area_left=sum(yf(1:n-1))*dx;

%右端点估计
area_right=0;
%or j=2:n
%    area_right=area_right+yf(j)*dx;
%end
area_right=sum(yf(2:n))*dx;

%梯形法
area_trap=0;
%area_trap=(yf(1)+yf(n))*dx/2;
%for k=2:n-1
%    area_trap=area_trap+*yf(k)*dx;
%end
area_trap=(yf(1)+yf(n))*dx/2 + sum(yf(2:n-1))*dx;

%area3=trapz(xf,yf);
%area4=quad(@x sin(x+1),a,b);
%quad(function,a,b)可以直接计算定积分
%@x可以隐性定义函数
disp(area_left)
disp(area_right)
disp(area_trap)