clc;
clear;
close all;

tspan = [0 20];

% Initial conditions
CA_init = 1.5; % kmol/m^3
T_init  = 330; % K
y0 = [CA_init; T_init];

% ODE solution
[t, y] = ode45(@cstr, tspan, y0);

CA = y(:,1);
T  = y(:,2);

figure;

subplot(2,1,1)
plot(t, CA, 'b', 'LineWidth', 2)
xlabel('Time (min)')
ylabel('C_A (kmol/m^3)')
title('Concentration Variation in CSTR')
grid on

subplot(2,1,2)
plot(t, T, 'r', 'LineWidth', 2)
xlabel('Time (min)')
ylabel('Temperature (K)')
title('Temperature Variation in CSTR')
grid on

function dydt = cstr(~, y)

    % Parameters
    CAf = 2;   % kmol/m^3 (feed concentration)
    T0  = 350;   % K (feed temperature)
    tau = 5;     % min
    k0  = 8e3;   % min^-1
    E   = 60000; % J/mol
    dH  = -4e4;  % J/mol (exothermic)
    rho = 1000;  % kg/m^3
    Cp  = 4200;  % J/kg-K
    R   = 8.314; % J/mol-K

    CA = y(1);
    T  = y(2);

    k = k0 * exp(-E/(R*T));

    dCA_dt = (CAf - CA)/tau - k*CA;
    dT_dt  = (T0 - T)/tau + (-dH/(rho*Cp)) * k * CA;

    dydt = [dCA_dt; dT_dt];
end
