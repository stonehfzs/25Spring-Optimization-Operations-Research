function [greedy_route,greedy_route_length] = tsp_greedy(data,start)
% tsp_greedy applies a greedy heuristic to find a solution to the
% travelling salesperson problem.
%
% Inputs:
% data  ... a matrix of city to city distances
% start ... the index of the starting city
%
% Outputs:
% greedy_route        ... a vector encoding the route as integers
% greedy_route_length ... the length of this routes

% Initialise the route vector
no_cities = length(data);
greedy_route = nan(1,no_cities);
greedy_route(1) = start;

% Create a vector to track which cities have been visited. Here a 0
% indicates not visited and an Inf indicates that it has been visited.
visited = zeros(1,no_cities);
visited(start) = Inf;

% Finding the nearest city to the current (most recently visited) city
% until the route is complete.
for j = 2:no_cities
    [~, greedy_route(j)] = min(data(greedy_route(j-1),:) + visited);
    visited(greedy_route(j)) = Inf;
end

% Calculate the length of the resulting route
greedy_route_length = tsp_distance(greedy_route,data);

end