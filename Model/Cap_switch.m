Fs = 10E6;
ts = 1/Fs;
Fin = 499/1024*Fs;
win = 2*pi *Fin;
C1 = 38.72E-12;
Vin = 0.895;
Vcm = 0.9;
Cb = 5E-12;
Cp = 1E-12;
Ctot = Cb + 3*Cp;
k1 = cos(win*ts)
k2 = sin(win*ts)
Ck = Cp*sqrt((2+k1)^2 +k2^2);
VTH = 0.457;
V1 = Ck/(Ctot)*Vin
V0 = Cb/Ctot*1.8 - 3*Cp/Ctot*Vcm

Ron = 1/(280E-6 * 32 * 3 / 0.2) / (V0 - VTH)

HD2 = mag2db(1/4*C1*win*Ron*(V1/V0))

HD3 = mag2db(1/4*C1*win*Ron*(V1/V0)^2)
