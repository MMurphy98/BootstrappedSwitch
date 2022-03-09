%% Model for the Id of RC;
clc
clear
C1 = 38.72e-12;
Ron = 182;
num = [C1, 0];
den = [C1*Ron, 1];
sys = tf(num, den)

%% Calculate the frequency response;
[mag, phase, dw] = bode(sys);
figure("Name", "Frequency Response")
subplot(2,1,1)
semilogx(dw, mag2db(mag(:,:)));
grid on;
ylim([-100, -40])
subplot(2,1,2)
semilogx(dw, phase(:,:));
grid on;

%% Response of Sine Vin
t = linspace(0,4e-6,1000);
Fin = 500e3;
win = 2*pi*Fin;
vin = sin(win.*t);
id_s = lsim(sys, vin, t);
id_c = C1*win*cos(win.*(t - C1*Ron));
figure()
plot(t,id_s, t,id_c);
grid on
