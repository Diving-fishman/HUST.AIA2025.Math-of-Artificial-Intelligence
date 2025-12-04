clear all;close all

x = .1 : .1 : 3 ;

f = sin(x);

plot(x ,f , 'k')

hold on
%维数length(x)
n = length(f);

%需要安装符号计算工具箱
dfdx = zeros(n,1);

dfdx(1) = (f(2)-f(1))/(x(2)-x(1));

for k = 2: n-1
    dfdx(k) = (f(k+1)-f(k-1))/(x(k+1)-x(k-1));
end

dfdx(n) = (f(n)-f(n-1))/(x(n)-x(n-1));


figure
plot(x,cos(x),'k')
hold on
plot(x,dfdx,'r')