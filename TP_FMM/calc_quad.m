function [QuadPts, QuadWgts] = calc_quad(L)

I = 2*L+1;
Wphi = 2*pi/I*ones(1, I);
Ptsphi = 2*pi/I*(0:I-1);

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

QuadWgts = AllWphi.*AllWtheta;
[Sx, Sy, Sz] = sph2cart(AllPtsphi, ...
                        AllPtstheta-pi/2, ...
                        1); %CHANGEMENT DE COORDONNÉES POUR AVOIR
                            %LA BONNE ELEVATION
QuadPts = [Sx Sy Sz];