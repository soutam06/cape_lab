clc;
clear;
close all;

function dydt = odefun(~,T)

% Given parameters
k0 = 5e6;          % s^-1
E  = 80000;        % J/mol
dH = 5e4;          % J/mol
rho = 1000;        % kg/m^3
Cp  = 4180;        % J/kg-K
UA_V = 1500;       % W/m^3-K
Ta = 300;          % K
R  = 8.314;        % J/mol-K

dydt = (dH*k0*exp(-E/(R*T))/(rho*Cp))- (UA_V/(rho*Cp))*(T - Ta);

end


% Initial condition
T0 = 320;          % K

% Time span
tspan = [0 200];

% ODE solution
[t,T] = ode45(@odefun , tspan, T0);

% Plot
plot(t, T, 'b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Temperature (K)');
title('Batch Reactor Temperature Variation')
grid on;