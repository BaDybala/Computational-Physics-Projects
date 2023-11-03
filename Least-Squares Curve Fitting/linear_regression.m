function [a, b, rms] = linear_regression(x, y)
    N = length(x);  % Number of data points

    % Calculate summations
    sum_x = sum(x);
    sum_y = sum(y);
    sum_x_squared = sum(x.^2);
    sum_xy = sum(x .* y);

    % Calculate coefficients a and b
    a = (sum_y * sum_x_squared - sum_x * sum_xy) / (N * sum_x_squared - sum_x^2);
    b = (N * sum_xy - sum_x * sum_y) / (N * sum_x_squared - sum_x^2);

    % Calculate the fitted values
    y_fit = a + b * x;

    % Calculate the root mean square (RMS) value
    rms = sqrt(sum((y - y_fit).^2) / N);

    % Display the results
    fprintf('a = %.4f\n', a);
    fprintf('b = %.4f\n', b);
    fprintf('RMS = %.4f\n', rms);

    % Plot the original data and the fitted line
    figure;
    plot(x, y, 'o', 'DisplayName', 'Data');
    hold on;
    plot(x, y_fit, 'r-', 'DisplayName', 'Fitted Line');
    xlabel('x');
    ylabel('y');
    legend('Location', 'best');
    title('Linear Regression');
    grid on;
    hold off;
end