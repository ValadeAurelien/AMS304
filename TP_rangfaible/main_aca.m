clear all;
close all;

do_svd = 0;
expe = 2; % mv_size(0), mv_rank(1), mv_eps(2)


times = [];
times_svd = [];


if expe == 0
    eps = 1e-10;
    rk=10;
    smin = 100;
    smax = 3000;
    sstep = 20;
    for sz=smin:sstep:smax
        M = create_mat_rank_exact(sz, rk); 
        [U, B, V, R, count, time] = aca(M, eps);
        if do_svd 
            tic; [u, s, V] = svd(M); time_svd = toc;
            times_svd = [times_svd time_svd];
        end
        times = [times time];
        disp(sprintf('%i\t %f\t %f\n', sz, time,  max(abs(R(:)))));
    end
    figure(1);
    plot((smin:sstep:smax), times);
    if do_svd
        figure(2);
        plot((smin:sstep:smax), times_svd);
    end
elseif expe == 1
    eps = 1e-10;
    sz = 400;
    rmin = 10;
    rmax = sz;
    rstep = 10;
    for rk=rmin:rstep:rmax
        M = create_mat_rank_exact(sz, rk); 
        [U, B, V, R, count, time] = aca(M, eps);
        if do_svd 
            tic; [u, s, V] = svd(M); time_svd = toc;
            times_svd = [times_svd time_svd];
        end
        times = [times time];
        disp(sprintf('%i\t %f\t %f\n', rk, time,  max(abs(R(:)))));
    end
    figure(1);
    plot((rmin:rstep:rmax), times);
    if do_svd
        figure(2);
        plot((rmin:rstep:rmax), times_svd);
    end
elseif expe == 2
    sz = 400;
    type = 0;
    arg = 10;
    emin = 1e-10;
    emax = 1e-3;
    estep = 1e-5;
    Rnorms = [];
    for eps=emin:estep:emax
        [M, U, s V] = create_mat_rank_num(sz, type, arg); 
        [U, B, V, R, count, time] = aca(M, eps);
        times = [times time];
        Rnorms = [Rnorms norm(R, 'fro')]; 
        disp(sprintf('%i\t %f\t %f\n', eps, time,  Rnorms(end)));
    end
    figure(1);
    plot((emin:estep:emax), times);
    figure(2);
    plot((emin:estep:emax), Rnorms);
end