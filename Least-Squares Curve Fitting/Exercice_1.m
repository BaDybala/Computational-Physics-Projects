% Input data
x = randi([1, 100], 1, 50);
y = rand(1, 50)*100;

% Perform linear regression
[a, b, rms] = linear_regression(x, y);
