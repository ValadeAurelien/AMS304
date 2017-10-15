function dG = dG(x, y, y1, y2, y3)

n = norm_vec(y1, y2, y3);
dG = (x-y)*n/(4*pi*(x-y)^2);


