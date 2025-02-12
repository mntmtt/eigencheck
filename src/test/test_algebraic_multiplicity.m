clear;

disp("\nTest case 1\n")
eigenvalues = (600);
geomults = (1);
algmults = (3);
A = matrix_generator(eigenvalues, geomults, algmults);

f = @(x) arrayfun(@(t) det(A - t * eye(size(A))), x);
x_range = linspace(-100, 1000, 50000);
y_values = f(x_range);
figure(1);
plot(x_range, y_values, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('det(A - xI)');
title('Plot of f(x) = det(A - xI)');
grid on;

for n = 1:length(eigenvalues)
    expectedAlgmult = algmults(n);
    [eig, multAlg, flag] = algebraic_multiplicity(A, eigenvalues(n), 1e-4, 10, 50);

    fprintf("flag: %d\n",flag);
    fprintf("Starting point: %.5f\n",eigenvalues(n));
    fprintf("Expected eigenvalue: %f, actual eigenvalue: %f\n", eigenvalues(n), eig);
    fprintf("Expected algebraic multiplicity: %d, actual algebraic multiplicity: %f\n", expectedAlgmult, multAlg);
    assert(abs(expectedAlgmult - multAlg) < 1e-8, 'FAIL');
    fprintf("PASS\n");
end


