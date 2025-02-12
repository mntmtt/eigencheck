function geometric_mult = geometric_multiplicity(A, eigenvalue, zero_tolerance)
% GEOMETRIC_MULTIPLICITY Compute the geometric multiplicity of an eigenvalue
%
% geometric_mult = GEOMETRIC_MULTIPLICITY(A, eigenvalue, zero_tolerance)
%
% The function computes the LU decomposition of (A - eigenvalue * I) and counts
% the number of diagonal elements in U with an absolute value below the tolerance.
%
% Input Arguments:
%   A - Square matrix
%   eigenvalue - Scalar eigenvalue of A
%   zero_tolerance - Positive scalar tolerance to consider near-zero diagonal elements
%
% Output arguments:
%   geometric_mult - Geometric multiplicity of the eigenvalue
%

validate_input_sizes(A, eigenvalue, zero_tolerance);

[~, U, ~] = lu(A - eigenvalue * eye(size(A)));

% geometric_mult is correct because LU does not exchange the rows of U
% therefore it always finds the dominant columns since they always have
% the value on the diagonal != 0
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