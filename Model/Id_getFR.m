function [mag, phase] = Id_getFR(win, Ron, C1)
    % calculate the frequency response of Id
    % win: input frequency [rad/s];
    % Ron: on-state resistor;
    % C1: sample capacitor;
    mag = mag2db(1./sqrt((1./(win.*C1).^2 + Ron^2)));
    phase = 90 - rad2deg(atan(C1*Ron.*win));
end