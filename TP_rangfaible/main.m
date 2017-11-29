roN = 1000;
k = 0.1;
verif_norm_fro = 0;

Gmat = nuage_pts(k, N);
[U, s, V] = svd(Gmat);
sv = diag(s);
sv = power(sv, 2);
%loglog(linspace(1,N+1, N+1), diag(s));

% verification de la formule ||M-Mk||^2 = Sum(sig^2)
if (verif_norm_fro)
    Z = zeros(N+1);
    diff = zeros(1, N);
    for i=1:N
        disp(i);
        sred = horzcat(s(:,1:i), Z(:,i+1:N+1));
        Gmatred = U*sred*V';
        diff(i) = norm(Gmat-Gmatred, 'fro') - sqrt(sum(sv(i+1:N+1)));
    end
    disp(max(diff));
end
