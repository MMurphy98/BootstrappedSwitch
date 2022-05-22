%% Date 
L = [0.2, 0.4, 0.6,0.8, 1, 2, 3];
alpha = [-0.85, -0.1, 0.19, 0.3, 0.4, 0.6, 0.7];

%% Plot
figure

subplot(2,2,1)
semilogx(L, alpha);
grid on;
box on;
xlabel("log(L)");
ylabel("alpha");
title("log(L) vs. alpha")

subplot(2,2,2)
semilogy(L, alpha);
xlabel("L [um]");
ylabel("log(alpha)");
grid on;
box on;
title("L vs. log(alpha)")


subplot(2,2,3)
plot(L, alpha);
xlabel("L [um]");
ylabel("alpha");
grid on;
box on;
title("L vs. alpha")

subplot(2,2,4)
loglog(L, alpha);
xlabel("L [um]");
ylabel("alpha");
grid on;
box on;
title("log(L) vs. log(alpha)")
