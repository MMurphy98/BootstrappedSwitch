%% Model for the Id of RC;
clc
clear
C1 = 38.72e-12;
Ron = 182;
tau = C1*Ron
num = [C1, 0];
den = [tau, 1];
sys_id = tf(num, den)
figure()            % Show the basic frequency response
bode(sys_id);
grid on;
%% Calculate the frequency response with Taylor Series;
[mag, phase, dw] = bode(sys_id);

mag_taylor_low = mag2db(dw.*C1);
mag_taylor_high = mag2db(ones(size(dw))./Ron);
% mag_calculated = mag2db(1./sqrt((1./(dw.*C1).^2 + Ron^2)));

phase_calculated = 90 - rad2deg(atan(dw.*tau));
phase_taylor_low = 90 - rad2deg(dw.*tau);

figure
semilogx(dw, [mag2db(mag(:,:))', mag_taylor_low, mag_taylor_high,]);
grid on;
legend({'Real'; 'Taylor\_low'; 'Taylor\_high'}, Location="best")
ylim([-100, -40])

figure
semilogx(dw, [phase(:,:)', phase_taylor_low]);
grid on;
legend({'Real'; 'Taylor\_low';},Location="best")
ylim([-200, 100])
%% Response of Sine Vin
t = linspace(0,4e-6,1000);
Fin = 500e3;
win = 2*pi*Fin;
vin = sin(win.*t);
id_s = lsim(sys_id, vin, t);
id_c = C1*win*cos(win.*(t - C1*Ron));
figure()
plot(t,id_s, t,id_c);
grid on
