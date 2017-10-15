function y = y_from_triref(y1, y2, y3, ksi1, ksi2)

ksi_vec = [ 1-ksi1-ks2 ; ksi1 ; ksi2 ];
ymat = [ y1, y2, y3 ];

y = ymat*ksi_vec;
