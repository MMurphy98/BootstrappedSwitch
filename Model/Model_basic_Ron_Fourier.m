clc
clear
Fs = 1E6;
t = 0:1/Fs:(200-1)/Fs;
Ron = zeros(size(t));
Fin = Fs / 200;
win = Fin * 2*pi;
Ron(1:50) = -0.2*cos(win.*t(1:50))
Ron(151:200) = -0.2*cos(win.*t(151:200));

Ron = Ron + 182;
figure
plot(t, Ron)

a = repmat(Ron,1, 20);
figure
thd(a,Fs)

