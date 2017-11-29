function n = norm_frobenius(M)

n = sum(sum(svd(M)));