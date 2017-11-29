function Gmat = nuage_pts(k, N)

x = linspace(-1,1,N+1);
[X, Y] = meshgrid(x, x);
Gmat = G(X, Y, k, N);
