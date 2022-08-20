function [HD] = getHD_Cap_Track(V0, C1, Fin, Carray)
% Carray = [Cb, Cp1, Cp2, Cp3]
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Parameter Settings
    VDD = 1.8;
    VTH = 0.457;
    mun = 280E-6;
    mWL = 32*12/0.2;
    
    Cp1 = 0;
    Cp2 = 0.34;
    Cp3 = 0.34;

    Ctot = sum(Carray) + sum([Cp1, Cp2, Cp3]);
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% calculate Vgs
    Vgs1 = V0 * (Carray(2)+Cp1) / Ctot;
    Vgs0 = (Carray(1)*VDD - (sum(Carray(2:3)) + Cp1 + 1/3*Cp2)*VDD/2 - ...
        (Carray(end)+1/3*Cp3) * 0.183) / Ctot;
    KV = Vgs1 / (Vgs0 - VTH);

    Ron = 1/((Vgs0-VTH)*(mun * mWL));
    R2 = (KV^2 + KV^4) * Ron / 2;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% calculate results 
    HD = mag2db(R2*C1*Fin*pi*V0);

end