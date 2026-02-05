clc; clear; close all

L = 0.02;
alpha = 1.2e-5;
q = 5e5;
rhoCp = 4e6;

Nx = 41;
dx = L/(Nx-1);
x = linspace(0, L, Nx);

dt = 0.05;
tmax = 200;
Nt = round(tmax/dt);
time = (0:Nt-1)*dt;

T = 300*ones(Nx,1);
T(1) = 350;
T(end) = 300;

Fo = alpha*dt/dx^2;
S = q*dt/rhoCp;

times = [10 50 100 200];
Tstore = zeros(Nx, numel(times));

Tcenter = zeros(Nt,1);
idx = 1;

for n = 1:Nt
    Tprev = T;

    for i = 2:Nx-1
        T(i) = Tprev(i) + Fo*(Tprev(i+1) - 2*Tprev(i) + Tprev(i-1)) + S;
    end

    T(1) = 350;
    T(end) = 300;

    Tcenter(n) = T(round(Nx/2));

    if idx <= numel(times) && abs(time(n) - times(idx)) < dt
        Tstore(:, idx) = T;
        idx = idx + 1;
    end
end

figure
plot(x, Tstore(:,1), 'LineWidth', 2); hold on
plot(x, Tstore(:,2), 'LineWidth', 2)
plot(x, Tstore(:,3), 'LineWidth', 2)
plot(x, Tstore(:,4), 'LineWidth', 2)
xlabel('x (m)')
ylabel('Temperature (K)')
grid on
legend('t=10','t=50','t=100','t=200')

figure
plot(time, Tcenter, 'LineWidth', 2)
xlabel('Time (s)')
ylabel('Center Temperature (K)')
grid on
