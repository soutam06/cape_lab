clear all;
clc;

% syms x;

% f = x^2-5*x+6;
% syms x;
% eqnLeft = sin(x);
% eqnRight = -exp(x);

% fplot([eqnLeft eqnRight],[-5 5])
% title(texlabel(eqnLeft) + " = " + texlabel(eqnRight))

% sol = solve(f == 0, x);       % for analytical solution
% sol = vpasolve(eqnLeft == eqnRight, x, );      % for numerical solution

% S1 = vpasolve(eqnLeft == eqnRight, x, -3);
% disp(S1);

% S2 = vpasolve(eqnLeft == eqnRight, x, -0.5);
% disp(S2);


%% BI-SECTION METHOD

% y = @(x) exp(x)+sin(x);
% y = @(x) x^2-cos(x);

% a = 1;
% b = 0;
% tol = 10^(-6);
 
% for i = 1:30
%     c = (a+b)/2;
% 
%     if y(a)*y(c) < 0
%         b = c;
%     else 
%         a = c;
%     end
% end
 
% fprintf("root = %0.6d \n", c);
% fprintf("iteration: %d \n", i);

syms x;
f = x^3 - 500*x + 1.5e5;
fplot(f, [-100 100]);
