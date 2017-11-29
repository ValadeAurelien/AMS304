function M = create_mat_rank_exact(sz, rk)

M = rand(sz, rk)*rand(rk, sz);
