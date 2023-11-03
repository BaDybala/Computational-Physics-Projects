% Input parameters
n = input('Enter the number of data points (n): ');
m = input('Enter the order of the polynomial (m): ');
coefficients = input('Enter the coefficients [a0, a1, ..., am]: ');
e = input('Enter the experimental r.m.s value (e): ');

% Generate data using the function
data = generate_polynomial_data(n, m, coefficients, e);

% Extract x and y_err
x = data(:, 1);
y_err = data(:, 2);

% Plot the original data with error
plot(x, y_err, 'bo');
xlabel('x');
ylabel('y_{err}');
title('Original Data with Error');

% Perform polynomial curve fitting
p = polyfit(x, y_err, m);

% Generate fitted y values
y_fit = polyval(p, x);

% Plot the fitted curve
hold on;
plot(x, y_fit, 'r-');
legend('Original Data', 'Fitted Curve');
