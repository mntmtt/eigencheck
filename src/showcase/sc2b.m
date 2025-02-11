fprintf(" ----- Example 2b: high multiplicites' hell -----\n\n");

eigenvalues = [-50, -30, -10, 10, 30, 50];
eigenvalues = eigenvalues .* 100;
geo_mults = [4, 1, 3, 2, 1, 5];
algebraic_mults = [6, 1, 4, 2, 1, 7];

M = matrix_generator(eigenvalues, geo_mults, algebraic_mults);

eig_results = zeros(1,6);
alg_results = zeros(1,6);
flags = zeros(1,6);
geo_results = zeros(1,6);

[eig_results(1), alg_results(1), flags(1)]  = algebraic_multiplicity(M, random_error(-50, 0.10), 1e-8, 7, 10);
geo_results(1) = geometric_multiplicity(M, eig_results(1), 1e-8);
[eig_results(2), alg_results(2), flags(2)] = algebraic_multiplicity(M, random_error(-30, 0.10), 1e-8, 7, 10);
geo_results(2) = geometric_multiplicity(M, eig_results(2), 1e-8);
[eig_results(3), alg_results(3), flags(3)] = algebraic_multiplicity(M, random_error(-10, 0.10), 1e-8, 7, 10);
geo_results(3) = geometric_multiplicity(M, eig_results(3), 1e-8);
[eig_results(4), alg_results(4), flags(4)]  = algebraic_multiplicity(M, random_error(10, 0.10), 1e-8, 7, 10);
geo_results(4) = geometric_multiplicity(M, eig_results(4), 1e-8);
[eig_results(5), alg_results(5), flags(5)] = algebraic_multiplicity(M, random_error(30, 0.10), 1e-8, 7, 10);
geo_results(5) = geometric_multiplicity(M, eig_results(5), 1e-8);
[eig_results(6), alg_results(6), flags(6)] = algebraic_multiplicity(M, random_error(50, 0.10), 1e-8, 7, 10);
geo_results(6) = geometric_multiplicity(M, eig_results(6), 1e-8);

fprintf("Expected flag results: [1, 1, 1, 1, 1, 1]\n");
disp(flags);
fprintf("Expected eigenvalues results: [-5000, -3000, -1000, 1000, 3000, 5000]\n");
disp(eig_results);
fprintf("Expected geometric multiplicity results: [4, 1, 3, 2, 1, 5]\n");
disp(geo_results);
fprintf("Expected algebraic multiplicity results: [6, 1, 4, 2, 1, 7]\n");
disp(alg_results);

f = @(x) arrayfun(@(t) det(M - t * eye(size(M))), x);
x_range = linspace(-6000, 6000, 500000);
y_values = f(x_range);

figure(1);
plot(x_range, y_values, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('det(M - xI)');
title('Plot of f(x) = det(M - xI)');
grid on;

