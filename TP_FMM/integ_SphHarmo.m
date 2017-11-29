function integ = integ_SphHarmo(L, l, m)

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
prefact = sqrt((2*l+1)/(4*pi)* ...        
               factorial(l-abs(m))/factorial(l+abs(m)));

all_m_asso_LgP = legendre(l, cos(AllPtstheta'));             
Y_theta = all_m_asso_LgP(abs(m)+1,:)';

Y_phi = exp(1i*m*AllPtsphi);
integ = prefact* AllW' * (Y_theta.*Y_phi);

% $$$ I = 2*L+1;
% $$$ Wphi = 2*pi/I;
% $$$ if (m==0)
% $$$     integ_phi = I*Wphi;
% $$$ else
% $$$     Xphi = 2*pi/I*(1:I);
% $$$     integ_phi = Wphi * sum(exp(i*m*Xphi));
% $$$ end
% $$$ 
% $$$ 
% $$$ prefact = sqrt((2*l+1)/(4*pi)* ...
% $$$                factorial(l+abs(m))/factorial(l-abs(m)));
% $$$ if (m<0)
% $$$     prefact = prefact * (-1)^m;
% $$$ end
% $$$ 
% $$$ J = L+1;
% $$$ [Xtheta, Wtheta] = nodes_weights_GL(J);
% $$$ all_m_asso_LgP = legendre(l, Xtheta); %sort tous les m en même
% $$$                                       %temps 
% $$$ integ_theta = Wtheta*(all_m_asso_LgP(abs(m)+1,:))';
% $$$ 
% $$$ integ = prefact * integ_theta * integ_phi;
 