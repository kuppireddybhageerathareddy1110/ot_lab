% Define the times for each expert and programming language
times = [6 7 9 1; % Sharukh Khan
         10 8 2 12; % Salman Khan
         5 3 11 13; % Amir Khan
         4 6 8 10]; % Hrithik Roshan

% Define the names of the experts and programming languages
experts = {'Sharukh Khan', 'Salman Khan', 'Amir Khan', 'Hrithik Roshan'};
languages = {'C', 'C++', 'Java', 'Python'};

% Find the minimum time for each programming language
[minTimes, indices] = min(times, [], 1);

% Display the minimum times for each programming language
disp('Minimum times for each programming language:');
for i = 1:numel(languages)  % Loop over each programming language
    minTime = minTimes(i);  % Minimum time for the current language
    expert = experts{indices(i)};  % Expert with the minimum time
    language = languages{i};  % Current programming language
    
    % Display language, cost (time), and expert's name
    disp(['Language: ', language, ' | Time: ', num2str(minTime), ...
          ' hours | Expert: ', expert]);
end

% Calculate the total cost as the sum of the minimum times
totalCost = sum(minTimes);

% Display the total cost in hours
disp(['Total cost: ', num2str(totalCost), ' hours']);
