function [M, U, s, V] = create_mat_rank_num(sz, type, arg)

if type==0
    M = rand(sz, sz);
    [U, s V] = svd(M);
    s = diag(exp(-linspace(0, sz, sz)/arg));
    M = U*s*V';
elseif type==1
    M = rand(sz, sz);
    [U, s V] = svd(M);
    s = diag(linspace(arg(1), 0, sz)/arg(2));
    M = U*s*V';
end