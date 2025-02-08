function [steps, flag, x] = newtonmethod(A, x0, toll, maxiter, m)
    % Newton's method
    steps = zeros(1, maxiter);
    x = x0;
    flag = 0;

    for k = 1:maxiter
        x_prev = x;
        [~, g] = evaluatecharacteristic(x_prev, A);
        x = x_prev + m * g; % Newton's method

        % Step test
        step = abs(x - x_prev);


        if step < toll
            flag = 1; % Converged
            steps = steps(1:k); % Trim the steps array to the actual number of iterations
            return;
        end

        steps(k) = step;
    end

    steps = steps(1:maxiter); % Trim the steps array to the actual number of iterations
end