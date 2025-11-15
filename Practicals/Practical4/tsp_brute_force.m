function [route_bf,route_length_bf]=tsp_brute_force(data)

no_cities = length(data);
no_routes = factorial(no_cities-1); % always start in city 1

% Get all possible routes
all_routes = [ones(no_routes,1) perms(no_cities:-1:2)];

% Get all route lengths
all_routes_lengths = nan(no_routes,1);
for j=1:no_routes
    all_routes_lengths(j) = tsp_distance(all_routes(j,:),data);
end
[route_length_bf,shortest_ind]=min(all_routes_lengths);
route_bf = all_routes(shortest_ind,:);

end