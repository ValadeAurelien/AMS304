function val = G(x, y, k, N)

a = 2/N;
val = exp(i*k*abs(y-x))/(abs(y-x)+a);