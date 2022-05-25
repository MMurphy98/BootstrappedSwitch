function HD3 = SD_Exchange(Ron, V0, C1, Fin, alpha)
%SD_Exchange: calculated HD3 based on the analysis of S/D Exchange;
% 
    VDD = 1.8;
    VTH = 0.457;

    P = 2*pi*V0*C1/(VDD-VTH)*(alpha-1) .* Ron .*Fin;
    Q = 2*pi*V0*C1/(VDD-VTH)*(alpha) .* Ron .*Fin;
end