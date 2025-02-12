function geometric_mult = geometric_multiplicity(A, eigenvalue, zero_tolerance)

validate_input_sizes(A, eigenvalue, zero_tolerance);

[~, U, ~] = lu(A - eigenvalue * eye(size(A)));
geometric_mult = sum(abs(diag(U)) < zero_tolerance);

end

function validate_input_sizes(A, eigenvalue, tolerance)
if nargin < 3 || nargin > 3
    error('Wrong number of input arguments.');
end
if ~ismatrix(A)
    error('Input matrix A must be a matrix.');
end
if ~isscalar(eigenvalue)
    error('Input eigenvalue must be a scalar.');
end
if ~isscalar(tolerance) || ~isreal(tolerance) || tolerance <= 1e-16
    error('Input tolerance must be a positive real scalar greater greater than 1e-16.');
end
end