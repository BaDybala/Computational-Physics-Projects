% Test the erf_simpson function for different values of x and n
x_values = [0.2, 0.4, 0.6, 0.8, 1.0];
n_values = [1, 10, 100];

for x = x_values
    for n = n_values
        erf_simpson(x, n);
        erf(x)   %to compare with the actual erf() function in Matlab
    end
end

