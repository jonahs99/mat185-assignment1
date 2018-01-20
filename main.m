% Wherein the kids do their linalg assignment #1
close all
clear
clc

% Case 1
K = 1;
U_l = 0;
U_r = 0;

T = 0.5;
N = 200;
M = 100;

f = zeros(N, 1);
w = sin(pi * linspace(0, 1, N));

h = 1/(N+1);
k = T/(M+1);

A = func_assemble(h, k, K, N);
A = sparse(A);
h = resol_heat(A, h, k, K, U_l, U_r, f, w, N, T);

u_exact = sin(pi * linspace(0, 1, N))' * exp(-pi^2 * linspace(0, T, M));

figure()

plot(h(:, [1, M/4, M/2, M]), '-b')
hold on
plot(u_exact(:, [1, M/4, M/2, M]), '--r')
title("case 1")

% Case 2
K = 2;
U_l = 0;
U_r = 0;

T = 0.2;
N = 200;
M = 500;

f = zeros(N, 1);
w = ones(N, 1) * 50;

h = 1/(N+1);
k = T/(M+1);

A = func_assemble(h, k, K, N);
A = sparse(A);
h = resol_heat(A, h, k, K, U_l, U_r, f, w, N, T);

figure()
plot(h(:, [1, M/4, M/2, M]))
title("case 2")

% Case 3
K = 0.1;
U_l = 100;
U_r = 0;

T = 0.5;
N = 200;
M = 500;

f = zeros(N, 1);
w = ones(N, 1) * 50;

h = 1/(N+1);
k = T/(M+1);

A = func_assemble(h, k, K, N);
A = sparse(A);
h = resol_heat(A, h, k, K, U_l, U_r, f, w, N, T);

figure()
plot(h(:, [1, M/4, M/2, M]))
title("case 3")