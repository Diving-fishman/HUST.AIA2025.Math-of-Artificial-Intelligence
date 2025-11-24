% Problem 2 3: Solve the system of linear equations using the Jacobi iterative method and the Gauss-Seidel iterative method, and save the average number of iterations in a row vector.

% A is the coefficient matrix, and V1, V2, V3 form the vector v
A = [20 + 15 + 40,-20,-15;
-20,20+25+20,-20;
-15,-20,15+20+30];

v = [0,0,200];

X1 = [];
X2 = [];
Iter1 = [];
Iter2 = [];

% Use the Jacobi iterative method to solve the system of linear equations
D = diag(diag(A));
T = A - D;

M = -inv(D) * T;

for i=1:2:100
    v = v + [2, 0, 0];
    b_2 = inv(D) * v';
    x = [0;0;0];
    iter1 = 1;
    tol = 1e-6;
    err = tol * 2;
    while (err > tol) && (iter1 < 100)
        x(:, iter1+1) = M * x(:, iter1) + b_2;
        err = norm(x(:, iter1+1) - x(:, iter1), Inf);
        iter1 = iter1 + 1;
    end
    x_add = x(:, end)';
    X1 = [X1; x_add];
    Iter1 = [Iter1 , iter1];
end

% Use the Gauss-Seidel iterative method to solve the system of linear equations
v = [0,0,200];  % Reset v

S = tril(A);
T=A - S;

for j = 1:2:100         % Use another loop to avoid the previous loop reaching the upper limit
    v = v + [2, 0, 0];
    x = [0;0;0];
    tol = 1e-6;
    err=2*tol;
    iter2 = 1;

    while (err > tol) && (iter2 < 100)
    x(:,iter2+1)=-S\T*x(:,iter2)+S\v';
    err=norm(x(:,iter2+1)-x(:,iter2),Inf);
    iter2=iter2+1;
    end
    x2_add = x(:, end)';
    X2 = [X2; x2_add];
    Iter2 = [Iter2 , iter2];
end

% Calculate the average number of iterations for both methods
avg_iter1 = mean(Iter1);
avg_iter2 = mean(Iter2);
avg = [avg_iter1, avg_iter2];

% Display the results
X1
X2
disp("Average number of iterations (first component is Jacobi, second component is Gauss-Seidel):")
disp(avg)