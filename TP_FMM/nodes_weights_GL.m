function [X, W] = nodes_weights_GL(L)

f=@(x) x/sqrt(4*x*x-1);
Elems = arrayfun(f, 1:L-1);
M = diag(Elems, 1) + diag(Elems, -1);
[P, D] = eig(M);
X = diag(D)';
W = 2*P(1,:).*P(1,:);