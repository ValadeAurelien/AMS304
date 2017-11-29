function [A, B, R, count, time] = aca_partiel(M, eps)

tic;
normfroM = norm(M, 'fro');
Pl=[];
Pc=[];
i=1;
count = 1;
A=[M(:,j)]
B=[]
while norm(M-B, 'fro')>eps*normfroM
    Pl = [Pl i];
    
    b=M(i,:);
    for n=1:count-1
        b = A(i, n)*
    B = [B 
end
time = toc;