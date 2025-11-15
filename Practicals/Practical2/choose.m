function [i,j] = choose(M)
    i = Inf;
    j = Inf;
    [m,n] = size(M);
    for s = 1:n-1
        if M(m,s) < 0
            j = s;
            break;
        end
    end
    if j ~= Inf
        for t = 1:m-1
            M(t,j) = M(t,n)./M(t,j);
            if M(t,j) <= 0 
                M(t,j) = Inf;
            end
        end
        i = find(M(1:m-1,j) == min(M(1:m-1,j)), 1);
    end
end