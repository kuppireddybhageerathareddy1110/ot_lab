% Objective function coefficients for maximization (using negative for linprog)
f = [-3; -2; -5];

% Inequality constraints matrix
A = [1, 2, 1;   % First constraint
     3, 0, 2;   % Second constraint
     1, 0, 4];  % Third constraint


% Inequality constraints vector
b = [430; 460; 420];

% Lower bounds for variables
lb = zeros(3, 1);  % Variables must be non-negative

% Options for linprog (interior-point algorithm)
options = optimoptions('linprog', 'Algorithm', 'interior-point');

% Solve the linear programming problem
[x, fval, exitflag, output] = linprog(f, A, b, [], [], lb, [], options);

% Display results
disp('Optimal solution:');
disp(x);  % Optimal variable values
disp('Optimal function value:');
disp(-fval);  % Correct sign for maximization
disp('Exit flag:');
disp(exitflag);  % Indicates status of solver
disp('Output:');
disp(output);  % Detailed solver output
