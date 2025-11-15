function fval = simplex(A, b, c, z0)
    M = construct(A, b, c, z0);
    [i,j] = choose(M);
    while (i ~= Inf || j ~= Inf)
        [i,j] = choose(M)
        if (i == Inf || j == Inf)
            break;
        end
        M = pivot(M, i, j)
    end
    fval = M(end, end)
end