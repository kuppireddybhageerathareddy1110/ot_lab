% Linear Programming using Simplex Method
% Maximize Z = 5x + 3y
% Subject to constraints:
% x + y <= 2
% 5x + 2y <= 10
% 3x + 8y <= 12

% Coefficients of the objective function
c = [5; 3];

% Coefficients of the inequality constraints matrix
A = [1 1; 5 2; 3 8];

% Right-hand side of the inequality constraints
b = [2; 10; 12];

% Initial basic feasible solution
xBasic = zeros(size(A, 2), 1);

% Solve using the simplex method
[xOptimal, ZOptimal] = simplexMethod(c, A, b, xBasic);

% Display results
disp('Optimal solution:');
disp(['x = ', num2str(xOptimal(1))]);
disp(['y = ', num2str(xOptimal(2))]);
disp(['Maximum value of Z = ', num2str(-ZOptimal)]);

% Function to implement the simplex method
function [xBasic, ZOptimal] = simplexMethod(c, A, b, ~)
    m = size(A, 1); % Number of constraints
    n = size(A, 2); % Number of variables
    
    % Initialize tableau
    tableau = [A eye(m) b; c' zeros(1, m + 1)];
    
    % Perform iterations
    while any(tableau(end, 1:n) > 0)
        enteringColumn = find(tableau(end, 1:n) > 0, 1);
        
        ratios = tableau(1:end-1, end) ./ tableau(1:end-1, enteringColumn);
        ratios(ratios <= 0) = inf; % Avoid division by zero or negative ratios
        [~, leavingRow] = min(ratios);
        
        pivotElement = tableau(leavingRow, enteringColumn);
        tableau(leavingRow, :) = tableau(leavingRow, :) / pivotElement;
        
        for i = 1:size(tableau, 1)
            if i ~= leavingRow
                tableau(i, :) = tableau(i, :) - tableau(i, enteringColumn) * tableau(leavingRow, :);
            end
        end
    end
    
    % Extract basic feasible solution
    xBasic = tableau(1:m, end);
    ZOptimal = -tableau(end, end); % Negate to return the maximization objective
end
