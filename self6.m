clear all;close all

dt = 0.1;
t = -2 : dt : 4;
f = sin(t);
%导数真值
real_dfdt = cos(t);

%Forward
dfdt1 = (sin(t+dt)-sin(t))/dt;

%Backward
dfdt2 = (sin(t)-sin(t-dt))/dt;

%Central
dfdt3 = (sin(t+dt)-sin(t-dt))/(2*dt);

plot(t,real_dfdt,'k','linewidth',2)
%hold on:在一张图上画,加hold off停止；grid on:画网格
hold on;grid on

plot(t,dfdt1,'b','linewidth',2)
plot(t,dfdt2,'g','linewidth',2)
plot(t,dfdt3,'r','linewidth',2)