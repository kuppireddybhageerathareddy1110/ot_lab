% Define the coefficients of the objective function
c = [0.03; 0.12; 0.09; 0.20; 0.15; 0.06; 0];
% Define the coefficient matrix for the constraints
A = [
 -1 -5 -4 -8 -6 -3 0;
 0 0.18 0.10 0.32 0.20 0.07 -1;
 0 0 0 0 0 0 1;
 1 1 1 1 1 1 1;
 -4 -7 -8 -6 -10 -3 0
];
% Define the right-hand side of the constraints
b = [5; -0.10; 0.10; 1; 7];
% Define the lower and upper bounds for the variables
lb = [0; 0; 0; 0; 0; 0; 0];
ub = [];
% Solve the linear programming problem
options = optimoptions('linprog', 'Algorithm', 'dual-simplex', 'Display', 'iter');
[x, fval, exitflag, output, lambda] = linprog(-c, A, b, [], [], lb, ub, options);
% Display the results
disp('Optimal Solution:')
disp(['x1 = ', num2str(x(1))])
disp(['x2 = ', num2str(x(2))])
disp(['x3 = ', num2str(x(3))])
disp(['x4 = ', num2str(x(4))])
disp(['x5 = ', num2str(x(5))])
disp(['x6 = ', num2str(x(6))])
disp(['x7 = ', num2str(x(7))])
disp(['Optimal Objective Value (Z) = ', num2str(-fval)])
