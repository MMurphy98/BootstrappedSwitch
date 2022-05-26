%% Parameter Pre-Setting
clear 
clc

V0 = 0.895;                     % input swing
C1 = 38.72E-12;                 % load cap
Fs = 100E6;                     % sample rate
wt = [101, 249, 499] / 1024;     
Fin = wt .* Fs;                 % input frequency (Hz)
Ron0 = 6.5;                     % On-Resistance (ohm)
L = [0.2, 0.4, 0.6,0.8, 1, 2, 3];
alpha = [-1.15, -0.15, 0.15, 0.3, 0.4, 0.6, 0.68];


%% Calculation Compresion
for i = 1:length(alpha)
    temp = getHD_new(Ron0, V0, C1, Fin, alpha(i));      % for all length
    TXT = ['L = ', num2str(L(i)), 'um, alpha = ', ...
        num2str(alpha(i)), ';'];
    disp(TXT)
    HD3 = reshape(temp(1,2,:),1,3)
    HD3S = getHD3_Simplified(Ron0, V0, C1, Fin, alpha(i))

end

%% Fin vs. HD3
fin = linspace(0,0.5,100) * Fs;
% for Ron = 6.5 hms, L = 200n;
temp = getHD_new(Ron0, V0, C1, fin, alpha(1));
HD3_fin = reshape(temp(1,2,:), 1, length(fin));
HD3S_fin = getHD3_Simplified(Ron0, V0, C1, fin, alpha(1));

figure
semilogx(fin, [HD3_fin; HD3S_fin]);
box on;
grid on;
xlabel("Frequency [Hz]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Frequency vs. HD3")

%% Ron vs. HD3
ron = linspace(1,100);
FIN = Fin(3);       
% for Fin = 499/1024 Fs, L = 200n;
temp = getHD_new(ron, V0, C1, FIN, alpha(1));
HD3_ron = reshape(temp(:,2), 1, length(ron));
HD3S_ron = getHD3_Simplified(ron, V0, C1, FIN, alpha(1));

figure
semilogx(ron, [HD3_ron; HD3S_ron]);
box on;
grid on;
xlabel("Ron0 [\Omega]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Ron0 vs. HD3")

%% CL vs. HD3
cl = linspace(1,100).*1E-12;
FIN = Fin(3);           
% for Fin = 499/1024 Fs, L = 200n;
HD3_cl = zeros(1,length(cl));
for i = 1:length(cl)
    temp = getHD_new(Ron0, V0, cl(i), FIN, alpha(1));
    HD3_cl(i) = temp(2);
end

HD3S_cl = getHD3_Simplified(Ron0, V0, cl, FIN, alpha(1));

figure
semilogx(cl, [HD3_cl; HD3S_cl]);
box on;
grid on;
xlabel("CL [pF]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("CL vs. HD3")

%% V0 vs. HD3
v0 = linspace(0,1.8);
FIN = Fin(3);
% for Ron = 6.5Ohm, CL = 38.72pF, Fin = 499/1024 * Fs;
HD3_v0 = zeros(1,length(v0));
HD3S_v0 = zeros(1,length(v0));

for i = 1:length(v0)
    temp = getHD_new(Ron0, v0(i), C1, FIN, alpha(1));
    HD3_v0(i) = temp(2);
    HD3S_v0(i) = getHD3_Simplified(Ron0, v0(i), C1, FIN, alpha(1));
end

figure
semilogx(v0, [HD3_v0; HD3S_v0]);
box on;
grid on;
xlabel("Input Voltage [V]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Vin vs. HD3")

%% Conclusion
figure
subplot(2,2,1)
semilogx(fin, [HD3_fin; HD3S_fin]);
box on;
grid on;
xlabel("Frequency [Hz]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Frequency vs. HD3 (40dB/dec)")

subplot(2,2,2)
semilogx(ron, [HD3_ron; HD3S_ron]);
box on;
grid on;
xlabel("Ron0 [\Omega]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Ron0 vs. HD3 (40dB/dec)")

subplot(2,2,3)
semilogx(cl, [HD3_cl; HD3S_cl]);
box on;
grid on;
xlabel("CL [pF]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("CL vs. HD3 (40dB/dec)")

subplot(2,2,4)
semilogx(v0, [HD3_v0; HD3S_v0]);
box on;
grid on;
xlabel("Input Voltage [V]");
ylabel("HD3 [dB]");
legend(["Original", "Simplified"], 'Location','southeast')
title("Vin vs. HD3 (20dB/dec)")
