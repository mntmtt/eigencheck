function [steps,flag,x] = newtonmethod(A,x0,toll,maxiter,m)
%Newton's method
steps = zeros(1, maxiter);
x = x0;
for k = 1:maxiter
    xk = x;
    [~,g] = evaluatecharacteristic(xk,A);
    x = xk - m*g; %Newton's method        % -g or +g?????
    %step test
    step = abs(x-xk);
    if step < toll
        flag = 1; %converged
        return;
    end
    steps(k) = step;
end
flag = 0;
end