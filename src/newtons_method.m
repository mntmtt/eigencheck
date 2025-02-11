function [steps, flag, root] = newtons_method(A, x0, step_tolerance, max_iter, root_multiplicity)
% NEWTONS_METHOD Find the root of a function using Newton's method
%
%   [steps, flag, root] = NEWTONS_METHOD(A, x0, step_tolerance, max_iter, root_multiplicity)
%
%   Input arguments:
%       A - square matrix
%       x0 - initial guess
%       step_tolerance - tolerance for stepping criterion
%       max_iter - maximum number of iterations
%       root_multiplicity - multiplicity of the root
%
%   Output:
%      steps - steps between the iterations of the method
%      flag - 0 if the method converged, 1 otherwise
%      root - the estimated root

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