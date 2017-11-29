function [x, y, val] = argmax(M)
[val, arg] = max(M(:));
[x, y] = ind2sub(size(M), arg);