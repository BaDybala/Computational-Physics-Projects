function decay_simulation(N_0, alpha_x, alpha_y, delta_t, num_steps)
    % Initialize populations
    population_X = N_0 * ones(2, 2);
    population_Y = zeros(2, 2);
    population_Z = zeros(2, 2);

    % Initialize the big image to store all small squares
    big_image = zeros(2, 2, 3);

    % Create a figure for the animation
    figure;

    % Initialize the position in the big image
    pos_x = 1;
    pos_y = 1;

    for step = 1:num_steps
        % Calculate the decay based on current populations
        decay_X = alpha_x * population_X * delta_t;
        decay_Y = alpha_y * population_Y * delta_t;

        % Update populations element-wise
        population_X = population_X - decay_X;
        population_Y = population_Y + decay_X - decay_Y;
        population_Z = population_Z + decay_Y;

        % Create an image for the current year
        current_image = zeros(2, 2, 3);
        current_image(:, :, 1) = population_X / N_0;
        current_image(:, :, 2) = population_Y / N_0;
        current_image(:, :, 3) = population_Z / N_0;

        % Add the current small square to the big image
        big_image(pos_x:pos_x+1, pos_y:pos_y+1, :) = current_image;

        % Update the position for the next small square
        pos_y = pos_y + 2;

        % Check if we need to move to the next row
        if pos_y > (2*num_steps)
            pos_x = pos_x + 2;
            pos_y = 1;
        end

        % Display the big image
        imshow(big_image);
        title(['Year: ' num2str(step - 1)]);
        drawnow;

        % Introduce a delay
        pause(0.1);
    end
end