function val = G(x, y)

if (x==y)
    val = 0;
else
    val = 1/(4*pi*norm(x-y));
end