A = [4,-1,1
4,-8,1;
-2,1,5];

b = [7;-21;15];

xsol = A\b;

%下三角矩阵
S = tril(A);
T=A - S;

x0=[2,2,1];
tol = 1e-6;
err=2*tol;

x(:,1)=x0;
index = 1;

while(err > tol) && (index < 100)
    x(:,index+1)=-S\T*x(:,index)+S\b;
    err=norm(x(:,index+1)-x(:,index),Inf);
    index=index+1;
end
disp(x(:,index))