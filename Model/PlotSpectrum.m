function [f, P] = PlotSpectrum(s, Fs)
    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
    N = length(s);
    f = Fs * (0:(N/2)) / N;
    Y = fft(s, N);
    P2 = abs(Y / N);
    P1 = P2(1:(N/2)+1, : );                 % support multi-input
    P1(2:end-1, : ) = 2*P1(2:end-1, : );    % double-side to one-side
    P = mag2db(P1);

    %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    figure()

    for i = 1:width(s) 
        subplot(width(s), 1, i)             % subplot: w rows, 1 column
        plot(f,P(:, i));
        grid on;
        box on;
        xlabel("frequency [Hz]");
        ylabel("Power [dB]");
        title("Spectrum of signal");  
%         xlim([0, 50000]);
    end

%     figure()
%     plot(f, P);
%     grid on;
%     box on;
%     xlabel("frequency [Hz]");
%     ylabel("Power [dB]");
%     title("Spectrum of signal");
end