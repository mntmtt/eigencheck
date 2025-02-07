function [f, g] = evaluatecharacteristic(z, A)
% EVALUATECHARACTERISTIC Compute f_A(z) and g_A(z) for matrix A and complex input z
%
%   [f, g] = EVALUATECHARACTERISTIC(z, A)
%
%   This function calculates the characteristic function f_A(z) and its ratio
%   g_A(z) = -f_A(z) / f'_A(z) using the LU factorization of B(z) = A - z * I.
%   '
%   Input Arguments:
%       z - Complex scalar where the functions are evaluated
%       A - Square real or complex matrix
%
%   Output Arguments:
%       f - f_A(z), the determinant of (A - z * I)
%       g - g_A(z) = -f_A(z) / f'_A(z), derived using Jacobi's formula

% Step 1: Compute LU factorization with pivoting for (A - z * I)
B = A - z * eye(size(A));
[L, U, P] = lu(B);

% Step 2: Compute the determinant using U and the permutation matrix
detU = prod(diag(U));

%Compute detP and f
detP = (-1)^swapstoidentity(P);
detB = detU/detP;
f = detB;

% Step 3: Compute the inverse of B and the trace-based g_A(z)
% PB = LU
% B = P^-1 * LU
% we search X s.t. XB=I (X is the inverse of B)
% (P^-1)LUX = I        => %(B)X = I
% LUX = P * I
% LY = P * I
% UX = Y

I = eye(size(B));
Y = L \ (P * I);
invB = U \ Y;

g = 1 / trace(invB);

end
