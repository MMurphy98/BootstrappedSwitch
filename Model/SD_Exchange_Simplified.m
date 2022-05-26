function HD3 = SD_Exchange_Simplified(Ron, V0, C1, Fin, alpha)
%SD_Exchange: calculated HD3 based on the analysis of S/D Exchange;
% 
    VDD = 1.8;
    VTH = 0.457;

    win = 2*pi .* Fin;
%     P = V0*C1/(VDD-VTH)*(alpha-1) .* Ron .*win
%     Q = V0*C1/(VDD-VTH)*(alpha) .* Ron .*win
    K1 = V0*C1/(VDD-VTH)*(alpha - 0.5) .*Ron .*win;
    K2 = V0*C1/(VDD-VTH)*(0.5) .*Ron .*win;
    P = K1 - K2;
%     Q = K1 + K2;
    
%     R2_num = 30*pi*(-16.*P.^2 + 48*pi.*P + 9*pi^2.*Q.^2) .* Ron;
%     R2_den = -512.*P.^3 + 2688*pi.*P.^2 + 2160*pi^3 + ...
%         9*pi^2.*P.*(-464+5.*Q.^2);
%     R2 = 10.*P ./ (-29.*P+15*pi)*Ron
%     R2 = 2.*P ./ (3*pi)*Ron
    
%     HD3 = C1 .* win .* (P./(3*pi)) * Ron;
%     HD3 = win.*C1*2.*P
%     HD3 = C1 .*win .* R2 / 2;
    
    HD3 = (4*pi/3) * V0 * Ron^2 / (VDD-VTH) * (alpha-1) .*(Fin.^2) ...
        .*(C1.^2);
    HD3 = mag2db(abs(HD3));
end