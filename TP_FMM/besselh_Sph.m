function val = besselh_Sph(n, z)

% $$$ val=1;
% $$$ last=1;
% $$$ 
% $$$ f=@(x) max(x, 1);
% $$$ 
% $$$ for m=1:n
% $$$     new = last * i/(2*z) * (n+m)/(m*f(n-m));
% $$$     val = val + new;
% $$$     last = new;
% $$$ end
% $$$ 
% $$$ val = val * (-i)^(n+1)*exp(i*z)/z; 


val = sqrt(pi/(2*z)).*besselh(n+1./2, 1, z);