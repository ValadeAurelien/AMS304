function Gmat = G(X, Y, k)

ss = size(X); s = ss(1);

Gmat = exp(1i*k*dist(X, Y))./dist(X, Y) + isequal(X, Y)*eye(s)* ...
       exp(-1i*k);
Gmat = Gmat / (4*pi);