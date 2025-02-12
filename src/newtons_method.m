function [steps, flag, root] = newtons_method(A, x0, step_tolerance, max_iter, root_multiplicity)

steps = zeros(1, max_iter);
root = x0;
flag = 0;

for k = 1 : max_iter
    x_prev = root;
    [~, g] = evaluate_characteristic(x_prev, A);
    root = x_prev + root_multiplicity * g;

    step = abs(root - x_prev);
    if step < step_tolerance
        flag = 1;
        steps = steps(1:k);
        return;
    end
    steps(k) = step;
end

end