clear;

% Test 1
disp("Test case 1")
eigenvalues = (600);
geomults = (1);
algmults = (3);
A = matrixgen(eigenvalues, geomults, algmults);

f = @(x) arrayfun(@(t) det(A - t * eye(size(A))), x);

x_range = linspace(-100, 1000, 50000); % Adjust the range as needed

% Compute function values
y_values = f(x_range);

% Plot the function
figure(1);
plot(x_range, y_values, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('det(A - xI)');
title('Plot of f(x) = det(A - xI)');
grid on;

for n = 1:length(eigenvalues)
    expectedAlgmult = algmults(n);
    [eig, multAlg, flag] = multalg(A, eigenvalues(n), 1e-4, 10, 50);

    fprintf("flag: %d\n",flag);
    fprintf("Starting point: %.5f\n",eigenvalues(n));
    fprintf("Expected eigenvalue: %f, actual eigenvalue: %f\n", eigenvalues(n), eig);
    fprintf("Expected algebraic multiplicity: %d, actual algebraic multiplicity: %f\n", expectedAlgmult, multAlg);
end

% Test 2
% fprintf("Test case 2")
% eigenvalues = [20, 8 ,5 ,7];
% geomults = [2, 3, 5, 6];
% algmults = [3, 4, 7, 8];
% A = matrixgen(eigenvalues, geomults, algmults);
% for n = 1:length(eigenvalues)
%     expected = geomults(n);
%     actual = geomult(A, eigenvalues(n), 1e-3);
%     fprintf("Eigenvalue: %f. Geometric multiplicity: Expected %f, Actual %f\n", eigenvalues(n), expected, actual);
%     assert(isequal(expected, actual), "FAIL");
%     disp("PASS");
% end

