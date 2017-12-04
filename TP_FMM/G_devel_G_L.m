function GLs = G_devel_G_L(L, k, QuadPts, r0)


[nbpts, nbpts_] = size(QuadPts);

indlist = 0:L;
GLs_line = (2*indlist+1).*power(1i, indlist);
H = besselh_Sph(indlist, k*norm(r0));
GLs_line = GLs_line.*H;

R0 = repmat(r0, [nbpts, 1]);
coslist = dot(QuadPts, R0, 2)/norm(r0);
GLs = zeros(nbpts, L+1);

for l=1:L
    GLs(:,l) = legendreP(indlist(l), coslist);
end

GLs = GLs*(GLs_line)';
GLs = GLs*1i*k/(16*pi^2);