% 用matlab实现迭代法解矩阵方程Ax=b
% 封装实现迭代算法的函数，这个函数输出一个列向量，内容是迭代法结果，最终误差和迭代次数
function [x, err, iter] = JacobiIter(A, b, x0, set_tol, max_iter)
    % 第一步：将解方程所用的M和b2用原始的A,b表示
    D = diag(diag(A));
    T = A - D;
    
    M = -inv(D) * T;
    b2 = inv(D) * b(:);  % 确保b是列向量
    
    % 第二步：确保x0是列向量
    x = x0(:);
    
    err = set_tol * 2;    % 初始化误差
    iter = 0;             % 初始化迭代次数
    
    while (err > set_tol) && (iter < max_iter)
        x_old = x;
        x = M * x_old + b2;  % 迭代公式
        
        err = norm(x - x_old);  % 计算误差
        iter = iter + 1;
        
        % 可选：显示每次迭代信息
        fprintf('迭代次数: %d, 误差: %.6e\n', iter, err);
    end
    
    if iter >= max_iter
        warning('达到最大迭代次数，可能未收敛');
    end
end

% 程序主体部分
A = [4, -1, 1;
     4, -8, 1;
     -2, 1, 5];

b = [7; -21; 15];  % 改为列向量

% 精确解
x_cor = A \ b;

% 迭代法解
x0 = [2; 3; 2];  % 改为列向量
[x_iter, final_err, iterations] = JacobiIter(A, b, x0, 1e-5, 100);

fprintf('\n精确解:\n');
disp(x_cor');

fprintf('迭代法解:\n');
disp(x_iter');

fprintf('最终误差: %.6e\n', final_err);
fprintf('迭代次数: %d\n', iterations);
fprintf('解的差异: %.6e\n', norm(x_cor - x_iter));