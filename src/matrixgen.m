function A = matrixgen(eigenvalues, geomMults, algMults)
% MATRIXGEN Generates a test matrix with specified eigenvalues
% and corresponding geometric and algebraic multiplicities
%
% A = MATRIXGEN(eigenvalues, geomMults, algMults)
%
% Input Arguments:
%   eigenvalues - Vector of distinct eigenvalues
%   geomMults   - Vector of geometric multiplicities for each eigenvalue
%   algMults    - Vector of algebraic multiplicities for each eigenvalue
%
% Output:
%   A - Generated square matrix with desired properties

% Validate input sizes
validateInputSizes(eigenvalues, geomMults, algMults);

% Build the Jordan block matrix J
J = buildJordanBlockMatrix(eigenvalues, geomMults, algMults);

% Generate a random orthogonal matrix Q using QR decomposition
[Q, ~] = qr(randn(size(J)));

% Compute A = Q' * J * Q
A = Q' * J * Q;

end

function validateInputSizes(eigenvalues, geomMults, algMults)
% Validate that input vectors have the same length
if length(eigenvalues) ~= length(geomMults) || length(geomMults) ~= length(algMults)
    error('Input vectors eigenvalues, geomMults, and algMults must have the same length.');
end
end

function J = buildJordanBlockMatrix(eigenvalues, geomMults, algMults)
% Build the Jordan block matrix J based on eigenvalues, geometric and algebraic multiplicities
J = [];
for n = 1:length(eigenvalues)
    remainingAlg = algMults(n);
    lambda = eigenvalues(n);
    for i = 1:(geomMults(n) - 1)
        dim = floor(algMults(n) / geomMults(n));
        remainingAlg = remainingAlg - dim;
        Jk = createJordanBlock(lambda, dim);
        J = blkdiag(J, Jk);
    end
    Jk = createJordanBlock(lambda, remainingAlg);
    J = blkdiag(J, Jk);
end
end

function Jk = createJordanBlock(lambda, dim)
% Create a Jordan block of size dim with eigenvalue lambda
Jk = diag(lambda * ones(1, dim)) + diag(ones(dim - 1, 1), 1);
end
