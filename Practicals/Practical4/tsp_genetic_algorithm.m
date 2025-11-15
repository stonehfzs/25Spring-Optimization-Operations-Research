function [GA_route,GA_route_length]=tsp_genetic_algorithm(data,n_population,n_generations,n_elite,initial_routes)
%
no_cities = length(data);
% n_population = 50;
% n_generations = 20000;
% n_elite = 20;

% Initialise output
%GA_route = nan(n_generations,no_cities);
%GA_route_length = []; %nan(n_generations,1);

% Generate initial population
current_population = nan(n_population,no_cities);
current_lengths = nan(n_population,1);
[no_init_routes,~] = size(initial_routes);
if no_init_routes ~= 0
    current_population(1:no_init_routes,:) = initial_routes;
    for j=1:no_init_routes
        current_lengths(j) = tsp_distance(current_population(j,:),data);
    end
end
for j=no_init_routes+1:n_population
    current_population(j,:) = randperm(no_cities);
    current_lengths(j) = tsp_distance(current_population(j,:),data);
end

[shortest_route_length,i_best] = min(current_lengths);
GA_route = current_population(i_best,:);
GA_route_length = [1 shortest_route_length];

% Steps in this genetic algorithm:
% - generate selection probabilities (rank)
% - generate new population
%   - crossover with probability p
%   - mutate with proability q
%   - elitism, keep n_elite from previous generation

for j=2:n_generations

    % Generate selection probabilities
    [~,sort_ind] = sort(current_lengths,'ascend');
    current_selection_prob = nan(n_population,1);
    current_selection_prob(sort_ind) = 2*(1:n_population)/(n_population*(n_population+1));

    next_population = nan(n_population,no_cities);
    next_lengths = nan(n_population,1);

    % Elitism:
    next_population(1:n_elite,:) = current_population(sort_ind(1:n_elite),:);
    next_lengths(1:n_elite) = current_lengths(sort_ind(1:n_elite));

    % Generate offspring (crossover and mutation, or random if stuck)

    for k=n_elite+1:n_population
        parents = datasample(current_population,2,1,'Replace',false,'Weights',current_selection_prob);
        offspring = crossover(parents(1,:),parents(2,:));
        offspring = mutation(offspring,data);
        next_population(k,:) = offspring;
        next_lengths(k) = tsp_distance(offspring,data);
    end

    current_population = next_population;
    current_lengths = next_lengths;

    [shortest_route_length,i_best] = min(current_lengths);
    GA_route = current_population(i_best,:);
    if shortest_route_length < GA_route_length(end,2)
        fprintf('j = %d, current shortest route length = %e\n',j,shortest_route_length);
        GA_route_length = [GA_route_length;j shortest_route_length];
    end
end

end