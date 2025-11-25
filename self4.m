x=3;
a=[0:0.01:2];
b=a*x+0.1*randn(size(a));
figure(1)
plot(a,x*a,'k',Linewidth=3)
hold on
plot(a,b,'rx',Linewidth=3)

x1=regress(b,a);
[U,S,V]=svd(a','econ');
x2=V*inv(S)*U'*b';
plot(a,x2*a,'c--',Linewidth=3)