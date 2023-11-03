function oscillatory_integral(x, n)
    % Define the function to be integrated
    f = @(t) (2/sqrt(pi)) * (sin(100*pi*t).^2) .* exp(-t.^2);

    % Initialize variables
    h = x / n;
    integral_sum = 0;

    for i = 0:n
        t = i * h;
        term = f(t);
        
        % Multiply by the appropriate weight (1, 4, or 2)
        if i == 0 || i == n
            integral_sum = integral_sum + term;
        elseif mod(i, 2) == 1
            integral_sum = integral_sum + 4 * term;
        else
            integral_sum = integral_sum + 2 * term;
        end
    end
    
    % Calculate the final result using Simpson's rule formula
    result = (h / 3) * integral_sum;

    % Print the result with 10 decimal places
    fprintf('For x = %.1f and n = %d: %.10f\n', x, n, result);
end