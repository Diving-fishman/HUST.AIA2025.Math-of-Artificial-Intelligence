% Problem 1: Solve the system of linear equations using the direct method

% A is the coefficient matrix, and V1, V2, V3 form the vector v
A = [20 + 15 + 40,-20,-15;
-20,20+25+20,-20;
-15,-20,15+20+30];

v = [0,0,200];  % v is a column vector
    
X = (A \ v')';  % Transpose X to a row vector for subsequent appending

% Loop to increment the first component of v
for i=1:2:100
    v = v + [2, 0, 0];
    x = A \ v';
    X = [X; x'];
end

% Display the results
disp(X)