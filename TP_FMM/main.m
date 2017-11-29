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

vals = [];
x0=[0, 0, 0];
x=x0-0.05*ones(1, 3);
y0=[1, 0, 0];
y=y0+0.01*ones(1, 3);
k=50;
disp(sprintf('rap d/lambda : %g', max(norm(x0-x), norm(y0-y))*k/(2*pi)));

valG = G(x, y, k);
Lm = 10;
LM = 10;
for L=Lm:LM
    val = G_devel(L, k,  ...
                  x, y, ...
                  x0, y0) - valG;
    disp(sprintf('%2.d : %.10f %.10fi\n', L, real(val), imag(val)));
    vals = [ vals  val ];
end
vals'
plot(Lm:LM, abs(vals));








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
