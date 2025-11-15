function offspring = crossover(parent1,parent2)
    % Choose a random crossover point, 1 <= n_crossover <= (n_cities-2)
    n_crossover = randi(length(parent1)-2);
    % Create a place to store the offspring:
    offspring = nan(size(parent1));
    % Keep the first n_crossover entries from Parent 1, then scan Parent 2
    % to find the rest of the route.
    offspring(1:n_crossover) = parent1(1:n_crossover);
    offspring(n_crossover+1:end) = parent2(not(ismember(parent2,offspring)));
end


% parent1 = randperm(10)
% parent2 = randperm(10)