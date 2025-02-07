function [x, m, flag] = multalg(A, x0, toll, it, maxit)
% A - square matrix
% 0 - starting point for Newton's method
% toll - tolerance for stopping criterion
% it - number of steps for Newton's method (int >= 2)
% maxit - (int > it)

% Step 1: Newton's method for 'it' steps
m = 1;
[steps,flag,x] = newtonmethod(A,x0,toll,it,m); % myobjective it times
if flag == 1
    % m = abs(floor(m));
    return;
end
% Step 2: Estimate multiplicity m using the last steps
%|sk|/|sk+1| ≈ (m − 1)/m.
% m = estimatem(steps);
%sk/sk1 = (m-1)/m;
%m(sk/sk1) = m - 1;
%(sk/sk1)m - m =- 1;
%m(sk/sk1 - 1) = -1;
%m = -1 / (sk/sk1 - 1);
m = 1 ./ (1 - steps(length(steps)) ./ steps(length(steps) - 1));
fprintf("Estimated m: %f\n", m);

% Step 3: Modified Newton's method for 'maxit' steps
% If not converged, increment m and repeat
for i = 1:9    %10*maxIt calls so 10*maxit - 2 (the previous 2)
    [~,flag,x] = newtonmethod(A,x0,toll,maxit,m); % myobjective maxit times * 9
    if flag == 1
        % m = abs(floor(m));
        return;
    end
    m = m + 1;
end
[~,flag,x] = newtonmethod(A,x0,toll,maxit-it,m);
if flag == 1
    % m = abs(floor(m));
    return;
end
flag = 0;  % if we reach this point, the method did not converge
end