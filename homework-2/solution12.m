dt = 0.01;

x = 1:dt:5;
y = 2*(x.^2).*cos(x) + 0.8*(x.^3);

plot(x,y,'b','linewidth',2)
hold on; grid on;

n = length(x);
d2f = zeros(1,n);

% 二阶中心差分（边界用前向和后退差分代替）
d2f(2:n-1)=(y(3:n)+y(1:n-2)-2*y(2:n-1))/(dt^2);

% 首项
d2f(1)=(2*y(2)-y(3)-y(1))/(2*dt^2);
% 末项
d2f(n)=(2*y(n-1)-y(n-2)-y(n))/(2*dt^2);

% 绘图
plot(x,d2f,'r','linewidth',2);
legend('原函数','二阶导数');

xlabel('自变量x');
ylabel('原函数和二阶导数');
title('自行推导二阶导数方法');