fprintf(" ----- Example 1b: everything works, again! -----\n\n");

eigenvalues = [-50, -30, -10, 10, 30, 50];
geo_mults = [2, 1, 1, 2, 1, 2];
algebraic_mults = [2, 1, 1, 2, 1, 2];

M = matrix_generator(eigenvalues, geo_mults, algebraic_mults);
disp(M);

eig_results = zeros(1,6);
alg_results = zeros(1,6);
flags = zeros(1,6);
geo_results = zeros(1,6);

[eig_results(1), alg_results(1), flags(1)]  = algebraic_multiplicity(M, random_error(-50, 0.10), 1e-5, 5, 8);
geo_results(1) = geometric_multiplicity(M, eig_results(1), 1e-5);
[eig_results(2), alg_results(2), flags(2)] = algebraic_multiplicity(M, random_error(-30, 0.10), 1e-5, 5, 8);
geo_results(2) = geometric_multiplicity(M, eig_results(2), 1e-5);
[eig_results(3), alg_results(3), flags(3)] = algebraic_multiplicity(M, random_error(-10, 0.10), 1e-5, 5, 8);
geo_results(3) = geometric_multiplicity(M, eig_results(3), 1e-5);
[eig_results(4), alg_results(4), flags(4)]  = algebraic_multiplicity(M, random_error(10, 0.10), 1e-5, 5, 8);
geo_results(4) = geometric_multiplicity(M, eig_results(4), 1e-5);
[eig_results(5), alg_results(5), flags(5)] = algebraic_multiplicity(M, random_error(30, 0.10), 1e-5, 5, 8);
geo_results(5) = geometric_multiplicity(M, eig_results(5), 1e-5);
[eig_results(6), alg_results(6), flags(6)] = algebraic_multiplicity(M, random_error(50, 0.10), 1e-5, 5, 8);
geo_results(6) = geometric_multiplicity(M, eig_results(6), 1e-5);

fprintf("Expected flag results: [1, 1, 1, 1, 1, 1]\n");
disp(flags);
fprintf("Expected eigenvalues results: [-50, -30, -10, 10, 30, 50]\n");
disp(eig_results);
fprintf("Expected geometric multiplicity results: [2, 1, 1, 2, 1, 2]\n");
disp(geo_results);
fprintf("Expected algebraic multiplicity results: [2, 1, 1, 2, 1, 2]\n");
disp(alg_results);

f = @(x) arrayfun(@(t) det(M - t * eye(size(M))), x);
x_range = linspace(-60, 60, 50000);
y_values = f(x_range);

figure(1);
plot(x_range, y_values, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('det(M - xI)');
title('Plot of f(x) = det(M - xI)');
grid on;


