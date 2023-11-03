function [N_X, N_Y, N_Z] = atomic_population(N_0, alpha_X, alpha_Y, t)
    if alpha_X ~= alpha_Y
        N_X = N_0 * exp(-alpha_X * t);
        N_Y = N_0 * alpha_X * (exp(-alpha_X * t) - exp(-alpha_Y * t)) / (alpha_Y - alpha_X);
    else
        N_X = N_0 * exp(-alpha_X * t);
        N_Y = N_0 * alpha_X * t * exp(-alpha_X * t);
    end
    N_Z = N_0 - N_X - N_Y;
end
