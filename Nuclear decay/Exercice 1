% Input half-lives for X and Y
half_life_X = input('Enter the half-life of X (in years): ');
half_life_Y = input('Enter the half-life of Y (in years): ');

% Calculate decay rates from half-lives
alpha_X = log(2) / half_life_X;
alpha_Y = log(2) / half_life_Y;

% Initialize time and population arrays
t = 0:50;
N_X = zeros(size(t));
N_Y = zeros(size(t));
N_Z = zeros(size(t));

% Calculate populations at each time step
for i = 1:length(t)
    [N_X(i), N_Y(i), N_Z(i)] = atomic_population(1, alpha_X, alpha_Y, t(i));
end

% Plot the populations
plot(t, N_X, '-o', t, N_Y, '-s', t, N_Z, '-^');
xlabel('Time (years)');
ylabel('Number of Particles');
title('Nuclear Decay Over Time');
legend('X', 'Y', 'Z', 'Location', 'best');

% Save populations to a file
populations = [t' N_X' N_Y' N_Z'];
save('populations.txt', 'populations', '-ascii');


