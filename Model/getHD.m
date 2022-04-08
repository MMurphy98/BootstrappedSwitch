function [HD] = getHD(Ron, V0, C1, Fin)
    VDD = 1.8;
    VTH = 0.457;

    itr_Ron = length(Ron);
    itr_Fin = length(Fin);
    HD = zeros(itr_Ron,2,itr_Fin);
    for j = 1:itr_Fin
        win = 2*pi*Fin(j);
        for i = 1:itr_Ron
            K = V0*win*C1*Ron(i) / (VDD-VTH);
            a = [1, -K/(4*pi), K/(18*pi); 
                -K/2, 1-K/(6*pi), 0;
                -2*K/(3*pi), -K/8, 1-K/(5*pi)];
%              a = [1+K/(pi), 0, -K/(6*pi); 
%                 -K, 1-K/(3*pi), 0;
%                 2*K/(3*pi), -K/4, 1+3*K/(5*pi)];
            b = [Ron(i); 0; 0];  
            x = a\b;
            mag2db(abs(x))
            k1 = x(2) / 4;
            k2 = x(3) / 6;
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