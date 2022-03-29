clc
clear
Fs = 5E6;
Fin = 51/512*Fs;
win = Fin * 2 * pi;
V0 = 0.895;
t = linspace(0,51/Fin,512);
V_mag = [-0.966, -83.52, -80.417];
Sine = [sin(win.*t); sin(2*win.*t); sin(3*win.*t)];
Vout = db2mag(V_mag) * Sine;
Vin = V0*Sine(1,:);

Vds = Vout - Vin;

figure()
plot(t, [Vout; Vin]);
grid on;
xlim([0, 5e-6])

figure()
plot(t, Vds);
grid on;
xlim([0, 5e-6])


figure()
thd(Vout, Fs)

%% 
figure
thd(Vds, Fs)

V1 = (1.8 - 0.56).*Vds;
figure
thd(V1, Fs)

V2 = 0.5.*Vds.^2 +  (1.8 - 0.56).*Vds;
figure()
thd(V2, Fs)