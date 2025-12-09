dt1 = 0.02;
dt2 = 0.2;
dt3 = 0.5;

dt = dt1;

x = 1:dt:5;
y = 2*(x.^2).*cos(x) + 0.8*(x.^3);

plot(x,y,'b--','linewidth',2)
hold on; grid on;

n = length(x);
df_forward  = zeros(1,n);
df_backward = zeros(1,n);
df_central  = zeros(1,n);

% 前向差分（最后一点用后退差分代替）
df_forward(1:n-1) = (y(2:n) - y(1:n-1)) / dt;
df_forward(n) = (y(n) - y(n-1)) / dt;

% 后向差分（第一点用前向差分代替）
df_backward(2:n) = (y(2:n) - y(1:n-1)) / dt;
df_backward(1) = (y(2) - y(1)) / dt;

% 中心差分（边界用前/后代替）
df_central(2:n-1) = (y(3:n) - y(1:n-2)) / (2*dt);
df_central(1) = df_forward(1);
df_central(n) = df_backward(n);

plot(x,df_forward,'r','linewidth',2);
plot(x,df_backward,'g','linewidth',2);
plot(x,df_central,'y','linewidth',2);

hold on

dt = dt2;

% 前向差分（最后一点用后退差分代替）
df_forward(1:n-1) = (y(2:n) - y(1:n-1)) / dt;
df_forward(n) = (y(n) - y(n-1)) / dt;

% 后向差分（第一点用前向差分代替）
df_backward(2:n) = (y(2:n) - y(1:n-1)) / dt;
df_backward(1) = (y(2) - y(1)) / dt;

% 中心差分（边界用前/后代替）
df_central(2:n-1) = (y(3:n) - y(1:n-2)) / (2*dt);
df_central(1) = df_forward(1);
df_central(n) = df_backward(n);

plot(x,df_forward,'r--','linewidth',2);
plot(x,df_backward,'g--','linewidth',2);
plot(x,df_central,'y--','linewidth',2);

hold on

dt = dt3;

% 前向差分（最后一点用后退差分代替）
df_forward(1:n-1) = (y(2:n) - y(1:n-1)) / dt;
df_forward(n) = (y(n) - y(n-1)) / dt;

% 后向差分（第一点用前向差分代替）
df_backward(2:n) = (y(2:n) - y(1:n-1)) / dt;
df_backward(1) = (y(2) - y(1)) / dt;

% 中心差分（边界用前/后代替）
df_central(2:n-1) = (y(3:n) - y(1:n-2)) / (2*dt);
df_central(1) = df_forward(1);
df_central(n) = df_backward(n);

plot(x,df_forward,'r:','linewidth',2);
plot(x,df_backward,'g:','linewidth',2); 
plot(x,df_central,'y:','linewidth',2);

legend('原函数','前向差分1','后向差分1','中心差分1',...
'前向差分2','后向差分2','中心差分2',...
'前向差分3','后向差分3','中心差分3');
xlabel('自变量x');
ylabel('原函数和三种方法在不同步长下生成的导数');
title('数值微分方法比较');