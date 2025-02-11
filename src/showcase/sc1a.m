clc; clear; close all;

fprintf(" ----- Example 1a: everything works! -----\n\n");
eigenvalues = [1, 10, 20];
geo_mults = [1, 2, 1];
algebraic_mults = [1, 2, 1];

M = matrix_generator(eigenvalues, geo_mults, algebraic_mults);
disp(M);

eig_results = zeros(1,3);
geo_results = zeros(1,3);
alg_results = zeros(1,3);
flags = zeros(1,3);

[eig_results(1), alg_results(1), flags(1)]  = algebraic_multiplicity(M, random_error(1, 0.15), 1e-8, 5, 8);
geo_results(1) = geometric_multiplicity(M, eig_results(1), 1e-8);
[eig_results(2), alg_results(2), flags(2)] = algebraic_multiplicity(M, random_error(10, 0.15), 1e-8, 5, 8);
geo_results(2) = geometric_multiplicity(M, eig_results(2), 1e-8);
[eig_results(3), alg_results(3), flags(3)] = algebraic_multiplicity(M, random_error(20, 0.15), 1e-8, 5, 8);
geo_results(3) = geometric_multiplicity(M, eig_results(3), 1e-8);

fprintf("Expected flag results: [1, 1, 1]\n");
disp(flags);
fprintf("Expected eigenvalues results: [1, 10, 20]\n");
disp(eig_results);
fprintf("Expected geometric multiplicity results: [1, 2, 1]\n");
disp(geo_results);
fprintf("Expected algebraic multiplicity results: [1, 2, 1]\n");
disp(alg_results);

f = @(x) arrayfun(@(t) det(M - t * eye(size(M))), x);
x_range = linspace(-10, 30, 50000);
y_values = f(x_range);

figure(1);
plot(x_range, y_values, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('det(M - xI)');
title('Plot of f(x) = det(M - xI)');
grid on;
