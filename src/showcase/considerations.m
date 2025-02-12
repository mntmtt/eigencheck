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
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm works well with diagonalizable matrices, spaced eigenvalues and low multiplicities.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "2. Spaced eigenvalues, high multiplicities, diagonalizable matrix";
eigenvalues = [-100, 150, 300];
geometric_mults = [4, 7, 5];
algebraic_mults = [4, 7, 5];
non_mod_max_iter = 10;
zero_tol = 1e-5;
step_tol = 1e-5;
input_rel_err = 0.05;
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm works quite well also with diagonalizable matrices, spaced eigenvalues and high multiplicities.\n");
fprintf("- We needed to adjust a bit the tolerance. This means that inputs with really low numbers won't work as expected.\n");
fprintf("- We also needed to adjust the max number of iterations of the first Newton loop. Thanks to this, the estimate of m for the next Newton iterations will be slightly better, leading to more accurate algebraic multiplicities.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

zero_tol = 1e-8;
step_tol = 1e-8;
input_rel_err = 0.1;

% -------------------------------------------------------------------------

title = "3. Spaced eigenvalues, high multiplicities, diagonalizable matrix, close-to-zero input error";
eigenvalues = [0, 200, -1000];
geometric_mults = [4, 7, 5];
algebraic_mults = [4, 7, 5];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- The relative error gives more accuracy to low eigenvalues and less to high ones. Hence, 2 phenomena occur.\n");
fprintf("   1. The high eigenvalue (-1000) is more likely not to converge (i.e. to converge to a wrong root) due to the high input error which may cause the starting point to be too far from the root.\n");
fprintf("   2a. The close-to-zero input error leads the determinant function to be really close to zero since the value of z is close to the eigenvalue.\n");
fprintf("   2b. A small determinant leads to instability when solving linear systems, in our case the inverse of B, which will have really large entries making the inverse of the trace a really small number.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "4. Spaced eigenvalues, low multiplicities, non-diagonalizable matrix";
eigenvalues = [-100, 150, 300];
geometric_mults = [1, 2, 1];
algebraic_mults = [2, 2, 3];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- It looks like the algorithm is not stable with non-diagonalizable matrices. That is, when geometric multiplicity is less than the algebraic one for a eigenvalue. This is because the function has more ill-conditioned roots.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "4b. Spaced eigenvalues, low multiplicities, non-diagonalizable matrix, more iterations";
eigenvalues = [-100, 150, 300];
geometric_mults = [1, 2, 1];
algebraic_mults = [2, 2, 3];
non_mod_max_iter = 50;
mod_max_iter = 70;
zero_tol = 1e-8;
step_tol = 1e-8;
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- Trying to solve the software limitations by adding iterations is not always a good idea. Not only doesn't it converge to the last eigenvalue yet, but also finds the wrong algebraic multiplicity for the first one. Hence, we need to find a good balance between a high number of iterations (which should estimate a better m), and too many iterations which could lead to a false convergence. \n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

non_mod_max_iter = 7;
mod_max_iter = 15;
zero_tol = 1e-8;
step_tol = 1e-8;
input_rel_err = 0.1;

% -------------------------------------------------------------------------

title = "4c. diagonalizable vs non-diagonalizable matrix";
eigenvalues = [-100, 150, 300];
geometric_mults = [1, 2, 1];
algebraic_mults = [2, 2, 3];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, true);

eigenvalues = [-100, 150, 300];
geometric_mults = [4, 7, 5];
algebraic_mults = [4, 7, 5];
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);


fprintf("\nCONSIDERATIONS:\n");
fprintf("- Look at the plot.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

% -------------------------------------------------------------------------

title = "5. Clusterized eigenvalues, mixed multiplicities, diagonalizable matrix";
eigenvalues = [-100, -99, -101, 200, 201, 199.5];
geometric_mults = [1, 2, 1, 1, 2, 1];
algebraic_mults = [1, 2, 1, 1, 2, 1];
non_mod_max_iter = 7;
mod_max_iter = 15;
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

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
compute_and_show(title, eigenvalues, algebraic_mults, geometric_mults, input_rel_err, step_tol, non_mod_max_iter, mod_max_iter, zero_tol, false);

fprintf("\nCONSIDERATIONS:\n");
fprintf("- Tweaking the step tolerance for Newton's method should increase the convergence rate. However, it is not enough to make the method converge to the correct root.\n");

fprintf("\n\nPress any key to continue...\n");
input("", "s");

non_mod_max_iter = 7;
mod_max_iter = 15;
zero_tol = 1e-8;
step_tol = 1e-8;
input_rel_err = 0.1;

% -------------------------------------------------------------------------
