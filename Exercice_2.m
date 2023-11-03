% Parameters
N_0 = 1000000;
alpha_x = log(2) / 2;
alpha_y = log(2) / 16;
delta_t = 1;  % Time step
num_steps = 51;  % Number of time steps

% Run the decay simulation
decay_simulation(N_0, alpha_x, alpha_y, delta_t, num_steps);
