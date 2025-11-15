function dist = tsp_distance(order,data)
order = order(:);
route = sparse(order,[order(2:end);order(1)],true);
dist = sum(data(route));
end