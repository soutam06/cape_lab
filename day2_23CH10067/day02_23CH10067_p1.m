%% Problem 1 : N-R METHOD

clc; clear;

syms x

f = log(x) + x - 1;        % Define function
y = matlabFunction(f);    % Convert to function handle

Df = diff(f);             % Derivative
Dy = matlabFunction(Df);

maxIter = 30;
x = 0.5;                  % Initial guess (must be > 0)

for i = 1:maxIter
    x_new = x - y(x) / Dy(x);
    
    if abs(x_new - x) < 1e-6
        break;
    end
    
    x = x_new;
end

fprintf("Root = %.6f \n", x);
fprintf("No of iterations = %d \n", i);
