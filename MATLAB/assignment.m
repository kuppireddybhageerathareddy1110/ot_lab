% Define the cost matrix
cost_matrix = [20 13 9 8 12; 
               15 19 11 16 14; 
               10 18 17 12 7; 
               22 15 13 20 11; 
               18 16 14 19 10];

% Determine the number of individuals and jobs
[num_individuals, num_jobs] = size(cost_matrix);

% Flatten the cost matrix for linear programming
cost_vector = cost_matrix(:);

% Create equality constraints for individuals and jobs
Aeq = zeros(num_individuals + num_jobs, num_individuals * num_jobs);

% Constraints for each individual to have one job
for i = 1:num_individuals
    Aeq(i, (i - 1) * num_jobs + 1:i * num_jobs) = 1;
end

% Constraints for each job to be assigned to one individual
for j = 1:num_jobs
    Aeq(num_individuals + j, j:num_jobs:end) = 1;
end

% Right-hand side for constraints
beq = ones(size(Aeq, 1), 1);

% Lower and upper bounds for binary constraints
lb = zeros(num_individuals * num_jobs, 1);
ub = ones(num_individuals * num_jobs, 1);

% Solve with integer linear programming to find optimal assignments
options = optimoptions('intlinprog', 'Display', 'off');
[x, total_cost] = intlinprog(cost_vector, 1:num_jobs * num_individuals, [], [], Aeq, beq, lb, ub, options);

% Reshape the solution to get assignments
assignments = reshape(x, [num_jobs, num_individuals])';

% Determine job assignments for each individual
jobs = zeros(num_individuals, 1);
for i = 1:num_individuals
    [~, jobs(i)] = max(assignments(i, :));  % Get the assigned job for each individual
end

% Calculate the cost for each optimal assignment
costs = arrayfun(@(i) cost_matrix(i, jobs(i)), 1:num_individuals);

% Display optimal assignments and their costs
disp('Optimal Assignments:');
for i = 1:num_individuals
    job = jobs(i);
    cost = cost_matrix(i, job);
    disp(['Individual ', num2str(i + 1), ' is assigned to Job ', num2str(job), ...
          ' with cost ', num2str(cost)]);
end

% Display the total cost of optimal assignments
disp(['Total cost: ', num2str(total_cost)]);
