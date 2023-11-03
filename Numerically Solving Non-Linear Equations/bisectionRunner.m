% Define the function f(x)
f = @(x) 3 * exp(-x) - x + 3;

% Set the initial interval [a, b] and tolerance
a = 0;
b = 6;
tolerance = 1e-6;

% Find the root using the Bisection Method
bisectionRoot = bisectionMethod(f, a, b, tolerance);
disp(['Bisection Method Root: ', num2str(bisectionRoot)]);