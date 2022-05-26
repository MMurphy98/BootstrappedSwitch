function HD3 = getHD3_Simplified(Ron, V0, C1, Fin, alpha)
%getHD3_Simplified: calculated HD3 based on the analysis of S/D Exchange;
%Input Variable:
%   Ron: resistor in On State;
%   V0: input voltage;
%   C1: load caps;
%   Fin: input frequency;
%   alpha: the coefficient representing length of MOSFET;
%Output:
%   HD3: 3-rd harmonic component [dB];

    VDD = 1.8;          % supply voltage
    VTH = 0.457;        % threshold voltage

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Original Calculation method
%     win = 2*pi .* Fin;

%     K1 = V0*C1/(VDD-VTH)*(alpha - 0.5) .*Ron .*win;
%     K2 = V0*C1/(VDD-VTH)*(0.5) .*Ron .*win;
%     P = K1 - K2;
%     Q = K1 + K2;
    
%     R2_num = 30*pi*(-16.*P.^2 + 48*pi.*P + 9*pi^2.*Q.^2) .* Ron;
%     R2_den = -512.*P.^3 + 2688*pi.*P.^2 + 2160*pi^3 + ...
%         9*pi^2.*P.*(-464+5.*Q.^2);
%     R2 = R2_num ./ R2_den;
    
%     HD3 = C1 .*win .* R2 / 2;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Simplifed method    
%     R2 = 10.*P ./ (-29.*P+15*pi)*Ron
% More
%     R2 = 2.*P ./ (3*pi)*Ron

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Final Method    
    HD3 = (4*pi/3) * V0 .* Ron.^2 / (VDD-VTH) * (alpha-1) ...
        .*(Fin.^2) .*(C1.^2);
    HD3 = mag2db(abs(HD3));

end