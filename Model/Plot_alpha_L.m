%% Get date 
L = [0.2, 0.4, 0.6,0.8, 1, 2, 3];
alpha = [-1.15, -0.15, 0.15, 0.3, 0.4, 0.6, 0.68];

%% Plot the relationship between L and alpha
figure

% L vs alpha
subplot(2,2,1)
semilogx(L, alpha);
grid on;
box on;
xlabel("log(L)");
ylabel("alpha");
title("log(L) vs. alpha");

% L vs log(alpha) 
subplot(2,2,2)
semilogy(L, alpha);
xlabel("L [um]");
ylabel("log(alpha)");
grid on;
box on;
title("L vs. log(alpha)");

% log(L) vs alpha
subplot(2,2,3)
plot(L, alpha);
xlabel("L [um]");
ylabel("alpha");
grid on;
box on;
title("L vs. alpha");

% log(L) vs log(alpha)
subplot(2,2,4)
loglog(L, alpha);
xlabel("L [um]");
ylabel("alpha");
grid on;
box on;
title("log(L) vs. log(alpha)");
