% Test the oscillatory_integral function for different values of x and n
x_values = [0.2, 0.4, 0.6, 0.8, 1.0];
n_values = 1:100;

for x = x_values
    for n = n_values
        oscillatory_integral(x, n);
    end
end
