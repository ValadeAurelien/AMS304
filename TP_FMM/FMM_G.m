function vals = FMM_G(L, k, rho, coor, d_bin, plot_)

[nbcoor, nb_coor_] = size(coor);

OT = OcTree(coor, 'minSize', d_bin);
OT.shrink();
firstHighestDepth=find(OT.BinDepths==max(OT.BinDepths), 1);

if (plot_)
    boxH = OT.plot;
    cols = lines(OT.BinCount);
    doplot3 = @(p,varargin)plot3(p(:,1),p(:,2),p(:,3),varargin{:});
    for i = firstHighestDepth:OT.BinCount
        set(boxH(i),'Color',cols(i,:),'LineWidth', 1+OT.BinDepths(i))
        doplot3(coor(OT.PointBins==i,:),'.','Color',cols(i,:))
    end
end

neighboors=eye(OT.BinCount);
for a=firstHighestDepth:OT.BinCount
    abound = OT.BinBoundaries(a, :);
    for b=a:OT.BinCount
        if (a==b)
            continue;
        end
        bbound = OT.BinBoundaries(b, :);
        if (abound(1)==bbound(2) || abound(2)==bbound(1) || ...
            abound(3)==bbound(4) || abound(4)==bbound(3) || ...
            abound(5)==bbound(6) || abound(6)==bbound(4) )
            neighboors(a, b) = 1;
            neighboors(b, a) = 1;
        end
    end
end

[QuadPts, QuadWgts] = calc_quad(L);
valGdevel = zeros(nbcoor);
for a=firstHighestDepth:OT.BinCount
    indX = find(OT.PointBins==a); [nbX, nbX_] = size(indX);
    X = coor(indX,:);
    if (nbX==0)
        continue
    end
    abound = OT.BinBoundaries(a, :);
    x0 = [ abound(1)+abound(2), ...
           abound(3)+abound(4), ...
           abound(5)+abound(6) ] / 2.;  

    for b=firstHighestDepth:OT.BinCount
        disp([a, b]);
        indY = find(OT.PointBins==b); [nbY, nbY_] = size(indY);
        Y = coor(indY,:);
        if (nbY==0)
            continue;
        end
        if (neighboors(a, b))
            locvalGdevel = G(X, Y, k);
        else
            bbound = OT.BinBoundaries(b, :);
            y0 = [ bbound(1)+bbound(2), ...
                   bbound(3)+bbound(4), ...
                   bbound(5)+bbound(6) ] / 2.;
            r0 = x0 - y0;
            GLs = G_devel_G_L(L, k, QuadPts, r0);
            locvalGdevel = G_devel(X, Y, k, x0, y0, GLs, QuadPts, QuadWgts);
        end
        for locX=1:nbX
            for locY=1:nbY
                valGdevel(indX(locX), indY(locY)) = ...
                    valGdevel(indX(locX), indY(locY)) + ...
                    locvalGdevel(locX, locY);
            end
        end
    end
end