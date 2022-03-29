%% /////////////////////// Model for the Id of RC ///////////////////////
clc
clear
C1 = 38.72e-12;
Ron = 204;
tau = C1*Ron
num = [C1, 0];
den = [tau, 1];
sys_id = tf(num, den)
figure()            % Show the basic frequency response
bode(sys_id);
grid on;

%% //////// Calculate the frequency response with Taylor Series /////////
[mag, phase, dw] = bode(sys_id);

mag_taylor_low = mag2db(dw.*C1);
mag_taylor_high = mag2db(ones(size(dw))./Ron);

phase_taylor_low = 90 - rad2deg(dw.*tau);

figure
semilogx(dw, [mag2db(mag(:,:))', mag_taylor_low, mag_taylor_high]);
% semilogx(dw, [mag_calculated, mag_taylor_low, mag_taylor_high,]);

grid on;
legend({'Real'; 'Taylor\_low'; 'Taylor\_high'; }, Location="best")
ylim([-100, -40])
xlabel("Frequency [rad/s]"); ylabel("Magtitude [dB]");

figure
semilogx(dw, [phase(:,:)', phase_taylor_low,]);
grid on;
legend({'Real'; 'Taylor\_low'; }, Location="best")
ylim([-200, 100])
xlabel("Frequency [rad/s]"); ylabel("Phase [deg]");

%% //////////////////////// Response of Sine Vin ////////////////////////
Fs = 5E6;
Fin = 51/512*Fs;
win = Fin*2*pi;
[mag_Vin, phase_Vin] = Id_getFR(win, Ron, C1);

% mag_vin = db2mag(mag_Vin)
% delay_vin = 

%% /////////////////////// Build delta Id ///////////////////////////////
HD2_db = -155.84;
HD3_db = -149.20;
distortion_base = -128.78;

t = linspace(0,4*51/Fin,4*512);
delta_id = db2mag(distortion_base).*sin(win.*t) + ...
        db2mag(HD2_db).*sin(2*win.*t) + ...
        db2mag(HD3_db).*sin(3*win.*t);

figure()
plot(t, delta_id);
xlim([0, 3/Fin])
grid on;

figure()
sinad(delta_id, Fs)
xlim([0, 2.5])


