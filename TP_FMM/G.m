function Gmat = G(X, Y, k)

[s, s_] = size(X);

Gmat = exp(1i*k*dist(X, Y))./dist(X, Y);
if (size(X)==size(Y))
    if (isequal(X, Y))
        Gmat = Gmat + eye(s) * exp(-1i*k);
    end
end
Gmat = transpose(Gmat / (4*pi));