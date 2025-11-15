function M = construct(A, b, c, z0)
    [m, ~] = size(A);
    M = [A, eye(m), zeros(m, 1), b;
        -c', zeros(1, m), 1, z0];
end

