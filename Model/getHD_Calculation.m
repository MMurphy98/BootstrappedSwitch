function HD3 = getHD_Calculation(Ron, V0, C1, Fin, alpha)
%getHD_Calculation: calculated HD3 based on the analysis of S/D Exchange;
%Input Variable:
%   Ron: resistor in On State;
%   V0: input voltage;
%   C1: load caps;
%   Fin: input frequency;
%   alpha: the coefficient representing length of MOSFET;
%Output:
%   HD3: 3-rd harmonic component [dB];
    VDD = 1.8;
    VTH = 0.457;

    win = 2*pi .* Fin;
%     P = V0*C1/(VDD-VTH)*(alpha-1) .* Ron .*win
%     Q = V0*C1/(VDD-VTH)*(alpha) .* Ron .*win
    K1 = V0*C1/(VDD-VTH)*(alpha) .*Ron .*win;
    K2 = V0*C1/(VDD-VTH)*(1) .*Ron .*win;
    P = K1 - K2;
    Q = K1 + K2;
    
    R2_num = 30*pi*(-16.*P.^2 + 48*pi.*P + 9*pi^2.*Q.^2) .* Ron;
    R2_den = -512.*P.^3 + 2688*pi.*P.^2 + 2160*pi^3 + ...
        9*pi^2.*P.*(-464+5.*Q.^2);
    R2 = R2_num ./ R2_den;
    
    HD3 = C1 .*win .* R2 / 2;
    HD3 = mag2db(abs(HD3));
end