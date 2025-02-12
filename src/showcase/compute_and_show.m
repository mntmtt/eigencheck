function compute_and_show(title, exp_eigenvalues, exp_alg_mults, exp_geom_mults, ...
    input_rel_err, step_tol, max_iter, mod_max_iter, zero_tol, do_hold_on)

M = matrix_generator(exp_eigenvalues, exp_geom_mults, exp_alg_mults);

n = length(exp_eigenvalues);
actual_eigenvalues = zeros(1, n);
actual_alg_mults = zeros(1, n);
actual_flags = zeros(1, n);
actual_geom_mults = zeros(1, n);

for i = 1:n
    input = random_error(exp_eigenvalues(i), input_rel_err);
    [actual_eigenvalues(i), actual_alg_mults(i), actual_flags(i)] = ...
        algebraic_multiplicity(M, input, step_tol, max_iter, mod_max_iter);
    actual_geom_mults(i) = geometric_multiplicity(M, actual_eigenvalues(i), zero_tol);
end

fprintf("\n----- %s -----\n", title);

fprintf("\nFLAGS\nexpected [1, ..., 1]\n");
disp(actual_flags);

fprintf("\nEIGENVALUES\nexpected\n");
disp(exp_eigenvalues);
fprintf("\nactual\n")
disp(actual_eigenvalues);

fprintf("\nGEOMETRIC MULTIPLICITIES\nexpected\n");
disp(exp_geom_mults);
fprintf("\nactual\n");
disp(actual_geom_mults);

fprintf("\nALGEBRAIC MULTIPLICITIES\nexpected\n");
disp(exp_alg_mults);
fprintf("\nactual\n");
disp(actual_alg_mults);

f = @(x) arrayfun(@(t) det(M - t * eye(size(M))), x);
distance = max(exp_eigenvalues) - min(exp_eigenvalues);
x_range = linspace(min(exp_eigenvalues) - distance * 0.1, max(exp_eigenvalues) + distance * 0.1, distance * 1000);
y_values = f(x_range);

figure(1);
color = 'r-';
if do_hold_on
    color = 'b-';
end
plot(x_range, y_values, color, 'LineWidth', 2);
xlabel('x');
ylabel('det(M - xI)');
grid on;
if do_hold_on
    hold on;
else
    hold off;
end

end