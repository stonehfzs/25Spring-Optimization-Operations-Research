function route_out = mutation(route,data)
% Choose two random mutation locations
n = length(route);
ind_swap = randperm(n,2);
% Generate the mutated route by swapping the cities at the random
% positions.
mutated_route = route;
mutated_route(ind_swap) = mutated_route(flip(ind_swap));
% Accept the mutated route if it is shorter that the original (hint: need 
% to call tsp_distance here).
if tsp_distance(route,data) > tsp_distance(mutated_route,data)
    route_out = mutated_route;
else
    route_out = route;
end
end
