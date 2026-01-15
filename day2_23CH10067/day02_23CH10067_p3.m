%% Problem 3: Bisection and Newton–Raphson Method
clc; clear;

%% Given data
Re = (1.23*40*0.005)/(1.79e-5);
D  = 40;
e  = 0.0015e-3;

fprintf('Reynolds Number = %.2f\n', Re);

%% Define function
f = @(x) (1./sqrt(x)) + 2*log10( (e/(3.7*D)) + (2.51./(Re*sqrt(x))) );

%% Interval (GIVEN)
a = 0.005;
b = 0.05;

%% Check validity of interval
if f(a)*f(b) > 0
    error('Bisection method not applicable: No sign change');
end

%% ---------------- BISECTION METHOD ----------------
tol = 1e-6;
maxIter = 50;

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

fprintf('\nBisection Method:\n');
fprintf('Friction factor f = %.6f\n', c);
fprintf('Iterations = %d\n', i);

%% ---------------- NEWTON–RAPHSON METHOD ----------------
syms fs

F  = (1/sqrt(fs)) + 2*log10((e/(3.7*D)) + (2.51/(Re*sqrt(fs))));
dF = diff(F);

F_fun  = matlabFunction(F);
dF_fun = matlabFunction(dF);

x = 0.02;   % Initial guess INSIDE interval

for i = 1:maxIter
    x_new = x - F_fun(x)/dF_fun(x);

    if abs(x_new - x) < tol
        break;
    end

    x = x_new;
end

fprintf('\nNewton–Raphson Method:\n');
fprintf('Friction factor f = %.6f\n', x);
fprintf('Iterations = %d\n', i);
