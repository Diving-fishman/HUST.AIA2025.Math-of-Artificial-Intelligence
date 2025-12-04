clear all;close all

x = -10:.1:10;
y = sin(x);

plot(x,y,'k','linewidth',2)
axis([-10,10,-10,10])
grid on;hold on

%多项式表达：从高到低，写系数
P = [1 0];   %y=x+0
yT1 = polyval(P , x);
plot(x,yT1,'b--','linewidth',2)

%阶乘函数：factorial(x)
P = [-1/factorial(3) 0 1 0];   
yT2 = polyval(P , x);
plot(x,yT1,'r--','linewidth',2)

P = [1/factorial(5) 0 -1/factorial(3) 0 1 0];   
yT3 = polyval(P , x);
plot(x,yT1,'g--','linewidth',2)