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

% Check for consistent input sizes
if length(eigenvalues) ~= length(geomMults) || length(geomMults) ~= length(algMults)
    error('Input vectors eigenvalues, geomMults, and algMults must have the same length.');
end

% Build the Jordan block matrix J
J = [];
% tanti blocchi quanto geometrica
for n = 1:length(eigenvalues)
    remainingAlg = algMults(n);
    lambda = eigenvalues(n);
    for i = 1:(geomMults(n)-1)
        dim = floor(algMults(n)/geomMults(n)); %calcolo una dimensione "media" del blocco su cui disporre equamente le molteplicità algebriche di lambda
        remainingAlg = remainingAlg - dim; %distribuisco le molteplicità algebriche sui blocchi geometrici
        Jk = diag(lambda * ones(1, dim)) + diag(ones(dim-1, 1),1); %aggiungo in fondo alla diagonale il nuovo blocco ingrandento J
        J = blkdiag(J, Jk);%allungo la diagonale aggiungendo il nuovo blocco e mettendo zeri dalle altre parti
    end
    Jk = diag(lambda * ones(1, remainingAlg)) + diag(ones(remainingAlg - 1, 1),1);
    J = blkdiag(J, Jk);
end

% Generate a random orthogonal matrix Q using QR decomposition
[Q, ~] = qr(randn(size(J)));

% Compute A = Q' * J * Q
A = Q' * J * Q;

end


