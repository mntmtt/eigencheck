function [f, g] = evaluate_characteristic(z, A)

B = A - z * eye(size(A));
[L, U, P] = lu(B);

detU = prod(diag(U));

detP = (-1) ^ swaps_to_identity(P);
detB = detU / detP;
f = detB;

I = eye(size(B));
Y = L \ (P * I);
invB = U \ Y;

g = 1 / trace(invB);

end
