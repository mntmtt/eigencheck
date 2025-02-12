clear;

disp("Test case 1 ");
P1 = eye(4);
assert(swaps_to_identity(P1) == 0, 'FAIL');
disp('PASS');

disp("Test case 2 ");
P2 = [0 1 0 0;
    1 0 0 0;
    0 0 0 1;
    0 0 1 0];
assert(swaps_to_identity(P2) == 2, 'FAIL');
disp('PASS');

disp("Test case 3 ");
P3 = [0 1 0 0;
    0 0 0 1;
    1 0 0 0;
    0 0 1 0];
assert(swaps_to_identity(P3) == 3, 'FAIL');
disp('PASS');

disp("test case 4 ");
P4 = [0 0 1 0;
    1 0 0 0;
    0 0 0 1;
    0 1 0 0];
assert(swaps_to_identity(P4) == 3, 'FAIL');
disp('PASS');