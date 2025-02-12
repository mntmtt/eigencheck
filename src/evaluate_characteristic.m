function [f, g] = evaluate_characteristic(z, A)
% EVALUATECHARACTERISTIC Compute f_A(z) and g_A(z) for matrix A and complex input z
%
%   [f, g] = EVALUATECHARACTERISTIC(z, A)
%
%   This function calculates the characteristic function f_A(z) and its ratio
%   g_A(z) = -f_A(z) / f'_A(z) using the LU factorization of B(z) = A - z * I.
%
%   Input Arguments:
%       z - Complex scalar where the functions are evaluated
%       A - Square real or complex matrix
%
%   Output:
%       f - f_A(z), the determinant of (A - z * I)
%       g - g_A(z) = -f_A(z) / f'_A(z), derived using Jacobi's formula

B = A - z * eye(size(A));
[L, U, P] = lu(B);

detU = prod(diag(U));

detP = (-1) ^ swaps_to_identity(P);
detB = detU / detP;
f = detB;

% PB = LU
% B = P^-1 * LU
% we search for X s.t. XB=I (X is the inverse of B)
% (P^-1)LUX = I        => %(B)X = I
% LUX = P * I
% LY = P * I
% UX = Y
I = eye(size(B));
Y = L \ (P * I);
invB = U \ Y;

g = 1 / trace(invB);

end
