function HD3 = SD_Exchange(Ron, V0, C1, Fin, alpha)
%SD_Exchange: calculated HD3 based on the analysis of S/D Exchange;
% 
    VDD = 1.8;
    VTH = 0.457;

%     P = 2*pi*V0*C1/(VDD-VTH)*(alpha-1) .* Ron .*Fin;
%     Q = 2*pi*V0*C1/(VDD-VTH)*(alpha) .* Ron .*Fin;

    P = 2*pi*V0*C1/(VDD-VTH)*(1-alpha) .* Ron .*Fin;
    Q = -2*pi*V0*C1/(VDD-VTH)*(alpha) .* Ron .*Fin;
    
    R2_num = 30*pi*(-16.*P.^2 + 48*pi.*P + 9*pi^2.*Q.^2) .* Ron;
    R2_den = -512.*P.^3 + 2688*pi.*P.^2 + 2160*pi^3 + ...
        9*pi^2.*P.*(-464+5.*Q.^2);
    R2 = R2_num ./ R2_den;
    
    HD3 = pi*Fin * C1 .* R2;
    HD3 = mag2db(HD3);
end