% Define the objective function coefficients (corrected signs for maximization)
c = -[0.03, 0.12, 0.09, 0.20, 0.15, 0.06, 0];

% Define the constraint matrix (corrected signs)
A = [
    4, 7, 8, 6, 10, 3, 0;  % Constraint 1
    1, 1, 1, 1, 1, 1, -1; % Constraint 2
    0, 0.18, 0.10, 0.32, 0.20, 0.07, -1; % Constraint 3
    -1, 0, 0, 0, 0, 0, -1; % Constraint 4 (x1 >= 1)
    1, 0, 0, 0, 0, 0, 1  % Constraint 5 (x1 + x7 = 1)
];

% Define the right-hand side of the constraints (corrected signs)
b = [7; 5; 0.1; 0.1; 1];

% Define the lower bounds for the variables
lb = zeros(7, 1); % Renamed variable from `1b` to `lb`
lb(7) = 0.1; % Set lower bound for x7 to 0.1

% Define the upper bounds for the variables (optional)
ub = [inf; inf; inf; inf; inf; inf; 1]; % x7 has an upper bound of 1

% Solve the LP problem using linprog
[x, fval, exitflag, output] = linprog(c, A, b, [], [], lb, ub);

% Display the optimal solution
disp('Optimal solution:');
disp(x);

% Display the maximum total return with the correct sign
disp(['Maximum total return: ', num2str(-fval)]); % Negative `fval` because of sign correction for maximization
