function [U, B, V, R, count, time] = aca(M, eps)

tic;
normfroM = norm(M, 'fro');
R = M;
B = zeros(size(M));
U = [];
V = [];
count = 0;
while norm(M-B, 'fro')>eps*normfroM
    count = count + 1;
    [x, y, max] = argmax(abs(R));
    u = R(:,y)/R(x, y);
    v = R(x,:);
    uv = u*v;
    B = B + uv;
    R = R - uv;
    U = horzcat(U, u);
    V = horzcat(V, v');
end
time = toc;