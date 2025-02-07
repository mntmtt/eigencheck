function geometricMult = geomult(A, eigenvalue, tolerance)
% GEOMULT Compute the geometric multiplicity of an eigenvalue
%
%   geometricMult = GEOMULT (A, eigenvalue, tolerance)
%
%   Input Arguments:
%       A - Square matrix (real or complex)
%       eigenvalue - Scalar (real or complex) eigenvalue of A
%       tolerance - Positive scalar tolerance to consider near-zero diagonal elements
%
%   Output arguments:
%       geometricMult - Geometric multiplicity of the eigenvalue
%
% The function computes the LU decomposition of (A - eigenvalue * I) and counts
% the number of diagonal elements in U with an absolute value below the tolerance.

if nargin < 3
    error('Not enough arguments.');
end
if tolerance <= 0
    error('Tolerance must be a positive scalar.');
end

[~, U, ~] = lu(A - eigenvalue * eye(size(A)));  % Fattorizzazione LU con pivoting (di A - autovalore * identità(delle dimesioni di A))

geometricMult = sum(abs(diag(U)) < tolerance);  % Conteggio degli zeri sulla diagonale di U (faccio abs(colonna di elementi diagonali)) < toll
% geometricMult è corretta poichè LU non scambia le righe di U quindi trova sempre le colonne dominanti hanno sempre il valore sulla diagonale != 0

end
