function Mout = pivot(Min,i,j)
    Mout = nan(size(Min));
    [m,~] = size(Min);
    Mout([1:i-1,i+1:m],:) = Min([1:i-1,i+1:m],:) - Min([1:i-1,i+1:m],j)./Min(i, j) * Min(i,:);
    Mout(i,:) = Min(i,:)/Min(i,j);
end