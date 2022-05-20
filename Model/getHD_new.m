function [HD] = getHD_new(Ron, V0, C1, Fin, alpha)
    VDD = 1.8;
    VTH = 0.457;

    itr_Ron = length(Ron);
    itr_Fin = length(Fin);
    HD = zeros(itr_Ron,2,itr_Fin);
    for j = 1:itr_Fin
        win = 2*pi*Fin(j);
        for i = 1:itr_Ron
            K1 = V0*win*C1*Ron(i) / (VDD-VTH) * (1/2);
            K2 = V0*win*C1*Ron(i) / (VDD-VTH) * (alpha - 0.5);
            P = K1 - K2;
            Q = K1 + K2;
%             K = V0*win*C1*Ron(i) / (VDD-VTH) / 2;
%             a = [1, -K/(4*pi), K/(18*pi); 
%                 -K/2, 1-K/(6*pi), 0;
%                 -2*K/(3*pi), -K/8, 1-K/(5*pi)];
             a = [1-P/(pi), 0, P/(6*pi); 
                -Q/2, 1-P/(3*pi), 0;
                -2*P/(3*pi), -Q/4, 1-3*P/(5*pi)];
            b = [Ron(i); 0; 0];  
            x = a\b;
            mag2db(abs(x));
            k1 = x(2) / 2;
            k2 = x(3) / 2;
            V_dis = win*C1.*[k1, k2];
            HD(i,:,j) = mag2db(abs(V_dis));
        end
    end

%     K = V0*win*C1.*Ron / (VDD-VTH);


%     k1 = x(2) ./ 4;
%     k2 = x(3) ./ 6;
%     V_dis = win*C1.*[k1, k2];
%     HD2 = mag2db(abs(V_dis(1)));
%     HD3 = mag2db(abs(V_dis(2)));

end