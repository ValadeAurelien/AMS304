function val = G_devel(L, k, x, y, x0, y0)

r0 = x0-y0;
r = x-y-r0;

I = 2*L+1;
Wphi = 2*pi/I*ones(1, I);
Ptsphi = 2*pi/I*(1:I);

J = L+1;
[Ptsthetax, Wtheta] = nodes_weights_GL(J);
Ptstheta = acos(Ptsthetax);

AllPtsphi = repmat(Ptsphi', [J, 1]);
AllWphi = repmat(Wphi', [J, 1]);

AllPtstheta = []; 
AllWtheta = [];
for j=1:J
    AllPtstheta = [ AllPtstheta ; Ptstheta(j)*ones(I, 1) ];
    AllWtheta   = [ AllWtheta   ; Wtheta(j)  *ones(I, 1) ];
end
AllW = AllWphi.*AllWtheta;
[Sx, Sy, Sz] = sph2cart(AllPtsphi, ...
                        AllPtstheta-pi/2, ...
                        1); %CHANGEMENT DE COORDONNÉES POUR AVOIR
                            %LA BONNE ELEVATION
S = [Sx Sy Sz];
figure(1);
xlabel('x');
ylabel('y');
zlabel('z');
plot3(Sx, Sy, Sz);
hold on;
plot3(Sx, Sy, Sz, 's', 'Color', 'r');
hold off;
GLs = G_devel_G_L(L, k, S, r0);

R = repmat(r, [I*J, 1]);
GLs = exp(i*k*dot(S, R, 2)).*GLs;

val = GLs'*AllW;