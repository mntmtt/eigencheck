clear;

fprintf("Test case 1\n")
eigenvalues = [10, 8];
geomults = [2, 2];
algmults = [3,2];
A = matrix_generator(eigenvalues, geomults, algmults);
for n = 1:length(eigenvalues)
    expected = geomults(n);
    actual = geometric_multiplicity(A, eigenvalues(n), 1e-3);
    fprintf("Eigenvalue: %f. Geometric multiplicity: Expected %f, Actual %f\n", eigenvalues(n), expected, actual);
    assert(isequal(expected, actual), "FAIL");
    disp("PASS");
end

fprintf("\nTest case 2\n")
eigenvalues = [20, 8 ,5 ,7];
geomults = [2, 3, 5, 6];
algmults = [3, 4, 7, 8];
A = matrix_generator(eigenvalues, geomults, algmults);
for n = 1:length(eigenvalues)
    expected = geomults(n);
    actual = geometric_multiplicity(A, eigenvalues(n), 1e-3);
    fprintf("Eigenvalue: %f. Geometric multiplicity: Expected %f, Actual %f\n", eigenvalues(n), expected, actual);
    assert(isequal(expected, actual), "FAIL");
    disp("PASS");
end

