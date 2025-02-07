clear;
clc;

z = 10;

M = [-2,0,2i;0,-8,0;2i,0,-6];
MZI = M - (10*eye(size(M,1)));

detM = @(x) (-8-x).*(x+4)^2;
detMZI = @(x) det(M - (x*eye(size(M,1))));
ddetMZI = detMZI(z) * trace(inv(MZI) .* (-1));

exptected_g = - detMZI(z)/ddetMZI;

[f,g] = evaluatecharacteristic(10,M);

fprintf('Test 1 - f: expected value: %d, actual value: %d\n',detMZI(z),f);
assert(isequal(f,detMZI(z)),'Test failed');
fprintf('Test 1 - g: expected value: %d, actual value: %d\n',exptected_g,g);
assert(isequal(g,exptected_g),'Test failed');

