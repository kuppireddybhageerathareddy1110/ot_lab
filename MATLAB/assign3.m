% Define the objective function coefficients (corrected signs for maximization)
c = -[0.03 0.12 0.09 0.20 0.15 0.06 0];
% Define the constraint matrix (corrected signs)
A = [4 7 8 6 10 3 0;
 1 5 4 8 6 3 0;
 0 0.18 0.10 0.32 0.20 0.07 -1; % Corrected signs for constraint 3
 -1 0 0 0 0 0 -1; % Corrected signs for constraint 4
 1 1 1 1 1 1 1]; % Equality constraint
% Define the right-hand side of the constraints (corrected signs)
b = [7; 5; 0.1; 0.1; 1];
% Define the lower bounds for the variables
lb = zeros(7, 1);
lb(7) = 0.1; % Set lower bound for x7 to 0.1
% Define the upper bounds for the variables (optional)
ub = [inf; inf; inf; inf; inf; inf; 1]; % x7 has upper bound of 1
% Solve the LP problem using linprog
[x, fval] = linprog(c, A, b, [], [], lb, ub);
% Display the optimal solution
disp('Optimal solution:');
disp(x);
% **Corrected line to display the maximum total return with the correct sign:**
disp(['Maximum total return: ', num2str(-fval)]); % Multiply fval by -1 for correct sign
