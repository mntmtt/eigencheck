clc; clear;

non_mod_max_iter = 7;
mod_max_iter = 15;
zero_tol = 1e-8;
step_tol = 1e-8;
input_rel_err = 0.1;

% -------------------------------------------------------------------------

title = "1. Spaced eigenvalues, low multiplicities, diagonalizable matrix";
eigenvalues = [10, 40, 100];
geometric_mults = [1, 2, 2];
algebraic_mults = [1, 2, 2];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm works well with diagonalizable matrices, spaced eigenvalues and low multiplicities.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "2. Spaced eigenvalues, high multiplicities, diagonalizable matrix";
eigenvalues = [-100, 150, 300];
geometric_mults = [4, 7, 5];
algebraic_mults = [4, 7, 5];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm works well with diagonalizable matrices, spaced eigenvalues and high multiplicities.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "3. Spaced eigenvalues, high multiplicities, diagonalizable matrix, close-to-zero input error";
eigenvalues = [0, 200, 1000];
geometric_mults = [4, 7, 5];
algebraic_mults = [4, 7, 5];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- The relative error gives more accuracy to low eigenvalues and less to high ones. Hence, 2 phenomena occur.\n");
fprintf("   1. The high eigenvalue (1000) is more likely not to converge due to the high input error which may cause the starting point to be too far from the root.\n");
fprintf("   2. The low eigenvalue (0) is likely to converge really fast as the error tends to 0. This gives a wrong (low) algebraic multiplicity.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "4. Spaced eigenvalues, low multiplicities, non-diagonalizable matrix";
eigenvalues = [-100, 150, 300];
geometric_mults = [1, 2, 1];
algebraic_mults = [2, 2, 3];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm is not stable with non-diagonalizable matrices. That is, when geometric multiplicity is less than the algebraic one for a eigenvalue.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "5. Clusterized eigenvalues, mixed multiplicities, diagonalizable matrix";
eigenvalues = [-100, -99, -101, 200, 201, 199.5];
geometric_mults = [1, 2, 1, 1, 2, 1];
algebraic_mults = [1, 2, 1, 1, 2, 1];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- Clusterized eigenvalues don't work well because of the nature of Newton's method. Since there is some input error and the roots of the polynomial are close, it is likely that the method will converge to the wrong root. In addition to this, close eigenvalues means close roots, and close roots means close-to-zero derivatives for a broader interval near each root. Hence, the method is also more likely to not converge at all.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "5.1 Clusterized eigenvalues, mixed multiplicities, diagonalizable matrix, tweaked parameters";
eigenvalues = [-100, -99, -101, 200, 201, 199.5];
geometric_mults = [1, 2, 1, 1, 2, 1];
algebraic_mults = [1, 2, 1, 1, 2, 1];
non_mod_max_iter = 7;
mod_max_iter = 15;
zero_tol = 1e-4;
step_tol = 1e-4;
input_rel_err = 0.05;
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- Tweaking the step tolerance for Newton's method should increase the convergence rate. However, it is not enough to make the method converge to the correct root.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------
