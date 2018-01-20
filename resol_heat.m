function [hist_sol] = resol_heat(A, h, k, K, U_l, U_r, f, w, N, T)
%resol_heat: performs the FD scheme to approximate the x-t mesh
%   hist_sol: N x M

M = round(T/k - 1);

% preallocate
u = zeros(N, M);
b = zeros(N, M);

% Calculating constants
delta_t = k;
c0 = 1/delta_t;
c1 = -K/h^2;
c2 = 1/delta_t + 2*K/h^2;
c3 = -K/h^2;

u(:, 1) = w;

for m = 1:M   
    b(:, m) = f + c0 * u(:, m);
    b(1, m) = b(1, m) - c1 * U_l;
    b(N, m) = b(N, m) - c3 * U_r;
    
    u(:, m+1) = A \ b(:, m);
end

hist_sol = u;

end

