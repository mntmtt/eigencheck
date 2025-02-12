function A = matrix_generator(eigenvalues, geometric_mults, algebraic_mults)
% MATRIX_GENERATOR Generates a test matrix with specified eigenvalues
% and corresponding geometric and algebraic multiplicities
%
% A = MATRIX_GENERATOR(eigenvalues, geometric_mults, algebraic_mults)
%
% Input Arguments:
%   eigenvalues - Vector of distinct eigenvalues
%   geometric_mults - Vector of geometric multiplicities for each eigenvalue
%   algebraic_mults - Vector of algebraic multiplicities for each eigenvalue
%
% Output:
%   A - Generated square matrix with desired properties

validate_input_sizes(eigenvalues, geometric_mults, algebraic_mults);

J = build_jordan_block_matrix(eigenvalues, geometric_mults, algebraic_mults);
[Q, ~] = qr(randn(size(J)));
A = Q' * J * Q;

end

function validate_input_sizes(eigenvalues, geometric_mults, algebraic_mults )
if ~isvector(eigenvalues) || ~isvector(geometric_mults) || ~isvector(algebraic_mults) ...
        || length(eigenvalues) ~= length(geometric_mults) ...
        || length(geometric_mults) ~= length(algebraic_mults)
    error('Input vectors eigenvalues, geomMults, and algMults must have the same length.');
end
end

function J = build_jordan_block_matrix(eigenvalues, geometric_mults, algebraic_mults)
J = [];
for i = 1:length(eigenvalues)
    remaining_alg_mults = algebraic_mults(i);
    lambda = eigenvalues(i);
    for j = 1 : (geometric_mults(i) - 1)
        dim = floor(algebraic_mults(i) / geometric_mults(i));
        remaining_alg_mults = remaining_alg_mults - dim;
        jordan_block = create_jordan_block(lambda, dim);
        J = blkdiag(J, jordan_block);
    end
    jordan_block = create_jordan_block(lambda, remaining_alg_mults);
    J = blkdiag(J, jordan_block);
end
end

function jordan_block = create_jordan_block(lambda, dim)
jordan_block = diag(lambda * ones(1, dim)) + diag(ones(dim - 1, 1), 1);
% the first diag creates a matrix = lambda * eye,
% the second diag creates a matrix with 1s on the superdiagonal
% (diag of a column of dimension dim - 1 shifted right by 1)
end