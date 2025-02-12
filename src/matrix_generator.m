function A = matrix_generator(eigenvalues, geometric_mults, algebraic_mults)
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

end