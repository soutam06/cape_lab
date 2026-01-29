clc; clear;

% -------------------------------
% Physical and kinetic parameters
% -------------------------------
params.k0   = 5e6;        % 1/s
params.E    = 80000;      % J/mol
params.dH   = 5e4;        % J/mol (magnitude of -ΔH)
params.R    = 8.314;      % J/mol-K

params.rho  = 1000;       % kg/m^3
params.Cp   = 4180;       % J/kg-K
params.UA_V = 1500;       % W/m^3-K
params.Ta   = 300;        % K

% -------------------------------
% Initial condition and time span
% -------------------------------
T0 = 300;                 % Initial reactor temperature (K)
tspan = [0 5000];         % Time span (s)

% -------------------------------
% Solve ODE
% -------------------------------
[t, T] = ode45(@(t,T) reactorTempODE(t, T, params), tspan, T0);

% -------------------------------
% Plot result
% -------------------------------
figure;
plot(t, T, 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Temperature (K)');
title('Batch Reactor Temperature Profile');
grid on;
