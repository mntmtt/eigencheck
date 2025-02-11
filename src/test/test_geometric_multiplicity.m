clear;

% Test 1
disp("Test case 1")
eigenvalues = [10, 8];
geomults = [2, 2];
algmults = [3,2];
A = matrixgen(eigenvalues, geomults, algmults);
for n = 1:length(eigenvalues)
    expected = geomults(n);
    actual = geomult(A, eigenvalues(n), 1e-3);
    fprintf("Eigenvalue: %f. Geometric multiplicity: Expected %f, Actual %f\n", eigenvalues(n), expected, actual);
    assert(isequal(expected, actual), "FAIL");
    disp("PASS");
end

% Test 2
fprintf("Test case 2")
eigenvalues = [20, 8 ,5 ,7];
geomults = [2, 3, 5, 6];
algmults = [3, 4, 7, 8];
A = matrixgen(eigenvalues, geomults, algmults);
for n = 1:length(eigenvalues)
    expected = geomults(n);
    actual = geomult(A, eigenvalues(n), 1e-3);
    fprintf("Eigenvalue: %f. Geometric multiplicity: Expected %f, Actual %f\n", eigenvalues(n), expected, actual);
    assert(isequal(expected, actual), "FAIL");
    disp("PASS");
end

