function val = G_devel(X, Y, k, x0, y0, GLs, QuadPts, QuadWgts)

[Nx, Nx_] = size(X);
[Ny, Ny_] = size(Y);

GLW = repmat( (GLs.*QuadWgts)', [Nx, 1]);

rX = X - repmat(x0, [Nx, 1]);
rXxdotSx = rX(:,1)*QuadPts(:, 1)';
rXydotSy = rX(:,2)*QuadPts(:, 2)';
rXzdotSz = rX(:,3)*QuadPts(:, 3)';
rXdotS = rXxdotSx + rXydotSy + rXzdotSz;
expfactX = exp(1i*k*rXdotS);

rY = Y - repmat(y0, [Ny, 1]);
rYxdotSx = rY(:,1)*QuadPts(:, 1)';
rYydotSy = rY(:,2)*QuadPts(:, 2)';
rYzdotSz = rY(:,3)*QuadPts(:, 3)';
rYdotS = rYxdotSx + rYydotSy + rYzdotSz;
expfactY = exp(1i*k*rYdotS);    

val = expfactX.*GLW*expfactY';
val = -1 * val;