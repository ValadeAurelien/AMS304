function dmat = dist(X, Y)
%distances entre deux sets de points

ss = size(X); s = ss(1);

% distance sur X
XXx = meshgrid(X(:,1));
YYx = meshgrid(Y(:,1));
Dx  = XXx-YYx';

% distance sur Y
XXy = meshgrid(X(:,2));
YYy = meshgrid(Y(:,2));
Dy  = XXy-YYy';

% distance sur Z
XXz = meshgrid(X(:,3));
YYz = meshgrid(Y(:,3));
Dz  = XXz-YYz';

dmat = sqrt(Dx.^2 + Dy.^2 + Dz.^2);
if(size(X)==size(Y))
    if (isequal(X, Y))
        dmat = dmat - eye(s);
    end
end