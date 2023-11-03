function data = generate_polynomial_data(n, m, coefficients, e)
    % Generate x values
    x = linspace(-5, 5, n);

    % Initialize data matrix
    data = zeros(n, 2);

    % Generate the polynomial curve
    y = polyval(coefficients, x);

    % Add Gaussian random errors
    errors = e * randn(size(x));
    y_err = y + errors;

    % Store x and y_err in the data matrix
    data(:, 1) = x;
    data(:, 2) = y_err;
end
