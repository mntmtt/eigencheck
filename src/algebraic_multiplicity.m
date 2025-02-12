function [est_eigenvalue, est_multiplicity, success] = algebraic_multiplicity(A, x0, step_tolerance, non_mod_maxit, modified_maxit)
% ALGEBRAIC_MULTIPLICITY Look for an eigenvalue and guess its algebraic multiplicity
%
%   [est_eigenvalue, est_multiplicity, flag] = ALGEBRAIC_MULTIPLICITY(A, x0, toll, it, maxit)
%
%   Input arguments:
%       A - square matrix
%       x0 - starting point for Newton's method
%       step_tolerance - tolerance for stepping criterion
%       non_mod_maxit - number of steps for non-modified Newton's method (int >= 2)
%       modified_maxit - number of steps for non-modified Newton's method (int > it)
%
%   Output:
%       est_eigenvalue - the estimated eigenvalue
%       est_multiplicity - the estimated algebraic multiplicity of x
%       success - 0 if the method converged, 1 otherwise - it's not guaranteed that the method converges to the right values

validate_input_sizes(A, x0, step_tolerance, non_mod_maxit, modified_maxit);

est_multiplicity = 1;
[steps, success, est_eigenvalue] = newtons_method(A, x0, step_tolerance, non_mod_maxit, est_multiplicity);
if success == 1
    return;
end

last_step = steps(length(steps));
penultimate_step = steps(length(steps) - 1);
est_multiplicity = 1 ./ (1 - last_step ./ penultimate_step);

for i = 1:9
    [~,success,est_eigenvalue] = newtons_method(A, x0, step_tolerance, modified_maxit, est_multiplicity);
    if success == 1
        est_multiplicity = round(est_multiplicity);
        return;
    end
    est_multiplicity = est_multiplicity + 1;
end
[~,success,est_eigenvalue] = newtons_method(A, x0, step_tolerance, modified_maxit - non_mod_maxit, est_multiplicity);
if success == 1
    est_multiplicity = round(est_multiplicity);
    return;
end

est_multiplicity = nan;
est_eigenvalue = nan;
success = 0;
end

function validate_input_sizes(A, x0, step_tolerance, non_mod_maxit, modified_maxit)
if nargin < 5 || nargin > 5
    error('Wrong number of input arguments.');
end
[rows, cols] = size(A);
if ~ismatrix(A) || rows ~= cols
    error('Input matrix A must be a square matrix.');
end
if ~isscalar(x0)
    error('Input x0 must be a scalar.');
end
if ~isscalar(step_tolerance) || ~isreal(step_tolerance) || step_tolerance <= 1e-16
    error('Input step_tolerance must be a positive real scalar greater than 1e-16.');
end
if ~isscalar(non_mod_maxit) || ~isreal(non_mod_maxit) || non_mod_maxit < 2 || mod(non_mod_maxit, 1) ~= 0
    error('Input non_mod_maxit must be an integer greater than 1.');
end
if ~isscalar(modified_maxit) || ~isreal(modified_maxit) || modified_maxit <= non_mod_maxit || mod(modified_maxit, 1) ~= 0
    error('Input modified_maxit must be an integer greater than non_mod_maxit.');
end
end