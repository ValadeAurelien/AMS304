function J = jac_transfo(y1, y2, y3)

a1 = y1 - y3;
a2 = y2 - y3;

J = norm(cross(a1, a2));
