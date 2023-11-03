% Define the function f(x) and its derivative f'(x)
f = @(x) 3 * exp(-x) - x + 3;
df = @(x) -3 * exp(-x) - 1;

% Set the initial guess and tolerance
initialGuess = 3;
tolerance = 1e-6;

% Find the root using the Newton-Raphson Method
newtonRaphsonRoot = newtonRaphsonMethod(f, df, initialGuess, tolerance);
disp(['Newton-Raphson Method Root: ', num2str(newtonRaphsonRoot)]);

% Use fzero() to find the root, for comparison
fzeroRoot = fzero(f, initialGuess);
disp(['fzero() Root: ', num2str(fzeroRoot)]);