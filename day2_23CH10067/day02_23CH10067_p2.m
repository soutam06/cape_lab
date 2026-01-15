%% Root existence check + Bisection Method

clc; clear;

% Define function
f = @(x) x.^3 - 500*x + 1.5e5;

% Search domain
x_min = -100;
x_max = 100;
N = 2000;

x = linspace(x_min, x_max, N);
fx = f(x);

% Check for sign change
idx = find(fx(1:end-1).*fx(2:end) < 0, 1);  % if it chnages the sign is change idx=1

if isempty(idx)
    fprintf('NO REAL ROOT EXISTS in [%d, %d]\n', x_min, x_max);
    fprintf('JUSTIFICATION:\n');
    fprintf('f(x) does not change sign in the interval.\n');
    fprintf('By Intermediate Value Theorem, no root exists.\n');
    return
end

% Interval found
a = x(idx);
b = x(idx+1);

fprintf('Root exists in interval [%.4f, %.4f]\n', a, b);

%% Bisection Method
tol = 1e-6;
maxIter = 30;

for i = 1:maxIter
    c = (a + b)/2;

    if abs(f(c)) < tol || (b - a)/2 < tol
        break;
    end

    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end

fprintf('Root = %.6f\n', c);
fprintf('Iterations = %d\n', i);
