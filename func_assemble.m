function [A] = func_assemble(h, k, K, N)
%func_assemble: assembles the transition matrix for the given BVP
%   h: the x-spacing 1/(N+1)
%   k: the t-spacing T/(M+1)

% Calculating constants
delta_t = k;
c1 = -K/h^2;
c2 = 1/delta_t + 2*K/h^2;
c3 = -K/h^2;

% Assembling the matrix A
c1_diag = diag(ones(N-1, 1) * c1, -1);
c2_diag = diag(ones(N, 1) * c2, 0);
c3_diag = diag(ones(N-1, 1) * c3, 1);

A = c1_diag + c2_diag + c3_diag;

end

