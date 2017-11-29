function GLs = G_devel_G_L(L, k, S, r0)
% G_DEVEL_G_L - 
%   

nb_s_ = size(S); nb_s=nb_s_(1);

indlist = 0:L;
GLs_line = (2*indlist+1).*power(1i, indlist);
H = besselh_Sph(indlist, k*norm(r0));
GLs_line = GLs_line.*H;

R0 = repmat(r0, [nb_s, 1]);
coslist = dot(S, R0, 2)/norm(r0);
GLs = zeros(nb_s, L+1);
for s=1:nb_s
    GLs(s,:) = legendreP(indlist, coslist(s));
end
GLs = GLs*(GLs_line)';
GLs = GLs*1i*k/(16*pi^2);