clear all;
close all;
% $$$ k=4;
% $$$ 
% $$$ fidlog = fopen('log', 'w');
% $$$ [coor,tri,ref_tri]=read_meshfile('mshs/sphere_mesh_0', fidlog);
% $$$ 
% $$$ ss = size(coor); s = ss(1);
% $$$ P = rand(s, 1);
% $$$ G = G(coor, coor, k)
% $$$ V = classic_prod(coor, P, k);
% $$$ 

% $$$ Nx = 50;
% $$$ Ny = 50;
% $$$ 
% $$$ x0 = [10, 0, 0];
% $$$ y0 = [1, 0, 0];
% $$$ dx = 1;
% $$$ dy = 1;
% $$$ xs = repmat(x0, [Nx, 1]) + dx*rands(Nx, 3);
% $$$ ys = repmat(y0, [Ny, 1]) + dy*rands(Ny, 3);
% $$$ 
% $$$ k=1;
% $$$ 
% $$$ disp(sprintf('rap d/lambda : %g', norm(x0-y0)*k/(2*pi)));

% $$$ Lm = 2;
% $$$ LM = 15;
% $$$ vals = [];
% $$$ valG = G(xs, ys, k);
% $$$ for L=Lm:LM
% $$$     disp(sprintf('--- %i ---', L));
% $$$     [AllP, AllW] = calc_quad(L);
% $$$     GLs = G_devel_G_L(L, k, AllP, x0-y0);
% $$$     val = G_devel(xs, ys, k, x0, y0, GLs, AllP, AllW);
% $$$     vals = [ vals norm(val-valG)];
% $$$ end
% $$$ figure(1)
% $$$ semilogy(Lm:LM, vals);
% $$$ figure(1);
% $$$ plot(ys, abs(vals));
% $$$ % $$$ plot(Lm:LM, abs(vals));
% $$$ figure(2);
% $$$ plot(Lm:LM, abs(vals-valG));

% $$$ L=12;
% $$$ vals = [];
% $$$ valsG = [];
% $$$ minN=1;
% $$$ maxN=3.9;
% $$$ nbN=10;
% $$$ tic;
% $$$ [AllP, AllW] = calc_quad(L);     
% $$$ GLs = G_devel_G_L(L, k, AllP, x0-y0);             
% $$$ cste = toc
% $$$ for n=floor(logspace(minN, maxN, nbN))
% $$$     disp(sprintf('--- %i ---', n));
% $$$     Nx = n; Ny = n;
% $$$     xs = repmat(x0, [Nx, 1]) + dx*rands(Nx, 3);
% $$$     ys = repmat(y0, [Ny, 1]) + dy*rands(Ny, 3);
% $$$     tic;
% $$$     G(xs, ys, k);
% $$$     valsG = [ valsG toc ];
% $$$     tic;
% $$$     G_devel(xs, ys, k, x0, y0, GLs, AllP, AllW);
% $$$     vals = [ vals cste+toc ];
% $$$ end
% $$$ figure(1)             
% $$$ semilogx(logspace(minN, maxN, nbN), valsG);
% $$$ hold on;
% $$$ semilogx(logspace(minN, maxN, nbN), vals);
% $$$ hold off;
% $$$ L=12;
% $$$ vals = [];
% $$$ valsG = [];
% $$$ minx=5;
% $$$ maxx=30;
% $$$ stepx=maxx-minx+1;
% $$$ [AllP, AllW] = calc_quad(L);                      
% $$$ for xt0=linspace(minx, maxx, stepx)
% $$$     disp(sprintf('--- %i ---', xt0));
% $$$     x0 = [ xt0 0 0 ];
% $$$     xs = repmat(x0, [Nx, 1]) + dx*rands(Nx, 3);
% $$$     valG = G(xs, ys, k);
% $$$     GLs = G_devel_G_L(L, k, AllP, x0-y0);             
% $$$     val = G_devel(xs, ys, k, x0, y0, GLs, AllP, AllW);
% $$$     vals = [ vals norm(val-valG)];               
% $$$ end
% $$$ figure(1)             
% $$$ semilogy(linspace(minx, maxx, stepx), vals);
% $$$ plot(linspace(minx, maxx, stepx), abs(vals));
% $$$ hold on;
% $$$ plot(linspace(minx, maxx, stepx), abs(valsG));
% $$$ figure(2);
% $$$ plot(linspace(minx, maxx, stepx), real(vals));
% $$$ hold on;
% $$$ plot(linspace(minx, maxx, stepx), real(valsG));
% $$$ figure(3);
% $$$ plot(linspace(minx, maxx, stepx), imag(vals));
% $$$ hold on;
% $$$ plot(linspace(minx, maxx, stepx), imag(valsG));
% $$$ 


% $$$ 
% $$$ LM=20;
% $$$ ls=5;
% $$$ ln=4;
% $$$ maxL=zeros(1, LM);
% $$$ fall=[];
% $$$ 
% $$$ figure(1);
% $$$ 
% $$$ for l=1:ls:(ls*ln+1)
% $$$     for L=1:LM
% $$$         vals = [];
% $$$         for m=0:l-1
% $$$             val = abs(integ_SphHarmo(L, l, m));
% $$$             vals = [ vals val ];
% $$$         end
% $$$         if (size(vals))
% $$$             maxL(L)  = log10(max(vals));
% $$$         end
% $$$     end    
% $$$     for m=1:LM
% $$$         if (maxL(m)<-6)
% $$$             fall = [fall m];
% $$$             break;
% $$$         end
% $$$     end
% $$$     plot(1:LM, maxL);  
% $$$     hold on;
% $$$     % plot(1:LM, minL); 
% $$$     % plot(1:LM, meanL);     
% $$$ end
% $$$ hold off;
% $$$ 
% $$$ figure(2);
% $$$ plot(1:ls:(ls*ln+1), fall);
% $$$ 
% $$$ LM=10;
% $$$ maxL=zeros(1, LM);
% $$$ minL=zeros(1, LM);
% $$$ meanL=zeros(1, LM);
% $$$ 
% $$$ figure(3);
% $$$ 
% $$$ for L=6:2:20
% $$$     for l=1:LM
% $$$         vals = [];
% $$$         for m=1:l-2
% $$$             val = abs(integ_SphHarmo(L, l, m));
% $$$             vals = [ vals val ];
% $$$         end
% $$$         if (size(vals))
% $$$             minL(l)  = log10(-max(-vals));
% $$$             meanL(l) = log10(mean(vals));
% $$$             maxL(l)  = log10(max(vals));
% $$$         end
% $$$     end 
% $$$     plot(1:LM, maxL); 
% $$$     hold on
% $$$     % plot(1:LM, meanL);
% $$$     % plot(1:LM, minL); 

% $$$ end


k = 10;
L = 12;
plot_=1;
d_bin = 0.5 * 2*pi/k;
disp(sprintf('d boxes : %f\n', d_bin));

fidlog = fopen('log', 'w');
[coor,tri,ref_tri]=read_meshfile('mshs/sphere_mesh_0', fidlog);
[nbcoor, nb_coor_] = size(coor);

rho = rand(nbcoor, 3);
tic;
valG = G(coor, coor, k);
res = valG*rho;
toc;
tic;
valFMM = FMM_G(L, k, rho, coor, d_bin, plot_);
toc;
norm(valG-valFMM)


% $$$ red = @(x, y) x/y;
% $$$ green = @(x, y) 1-abs(x/y-1./2);q
% $$$ blue = @(x, y)  1-x/y;
% $$$ col = @(x, y) [ red(x, y), green(x, y), blue(x, y) ];
% $$$ 
% $$$ figure
% $$$ for i=1:nbcoor
% $$$     plot3(OT.Points(i, 1), OT.Points(i, 2), OT.Points(i, 3), '.', ...
% $$$           'LineWidth', 8, ...
% $$$           'Color', col(OT.PointBins(i), OT.BinCount));
% $$$     hold on;
% $$$ end