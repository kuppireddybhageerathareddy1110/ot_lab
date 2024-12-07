 %Define the cost matrix
C = [2, 7, 4 ;
 3, 3, 1 ;
 5, 4, 7 
 1, 6, 2 ];
% Define supply and demand
supply = [5, 8, 7, 14];
demand = [7, 9, 18 ];
% Initialize variables
[m, n] = size(C);
allocation = zeros(m, n);
% Initialize indices for traversing the cost matrix
i = 1;
j = 1;
% Implement the North-West Corner method
while i <= m && j <= n
 % Determine the quantity to be allocated
 quantity = min(supply(i), demand(j));
 
 % Update allocation, supply, and demand
 allocation(i, j) = quantity;
 supply(i) = supply(i) - quantity;
 demand(j) = demand(j) - quantity;
 
 % Update indices based on which constraint is satisfied
 if supply(i) == 0 && i < m
 i = i + 1;
 elseif demand(j) == 0 && j < n
 j = j + 1;
 else
 break; % Break the loop if neither supply nor demand can be fulfilled 
further
 end
end
% Display the optimal allocation
disp('Optimal Allocation using North-West Corner method:');
disp(allocation);
% Calculate the total cost
totalCost = sum(sum(allocation .* C));
disp(['Total Cost: ', num2str(totalCost)]);