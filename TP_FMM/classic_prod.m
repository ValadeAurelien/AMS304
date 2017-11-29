function V = classic_prod(coorpts, P,  k)

ss = size(P); s=ss(1);

V = G(coorpts, coorpts, k)*P;