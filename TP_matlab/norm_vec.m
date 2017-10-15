function n = norm_vec(y1, y2, y3)

a1 = y1 - y3;
a2 = y2 - y3;

n = cross(a1, a2)/norm(cross(a1, a2));
