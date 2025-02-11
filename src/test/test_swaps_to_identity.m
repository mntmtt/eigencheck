clear;

% Test Case 1: No swaps needed (Already identity)
disp("Test case 1 ");
P1 = eye(4);
assert(swapstoidentity(P1) == 0, 'FAIL');
disp('PASS');

% Test Case 2: One swap needed
disp("Test case 2 ");
P2 = [0 1 0 0;
    1 0 0 0;
    0 0 0 1;
    0 0 1 0];
assert(swapstoidentity(P2) == 2, 'FAIL');
disp('PASS');

% Test Case 3: Two swaps needed
disp("Test case 3 ");
P3 = [0 1 0 0;
    0 0 0 1;
    1 0 0 0;
    0 0 1 0];
assert(swapstoidentity(P3) == 3, 'FAIL');
disp('PASS');

% Test Case 4: Three swaps needed
disp("test case 4 ");
P4 = [0 0 1 0;
    1 0 0 0;
    0 0 0 1;
    0 1 0 0];
assert(swapstoidentity(P4) == 3, 'FAIL');
disp('PASS');