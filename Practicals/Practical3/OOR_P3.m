our_first_problem = optimproblem;
x = optimvar('x',3,'LowerBound',0,'Type','integer');
our_first_problem.Objective = 13*x(1) + 12*x(2) + 17*x(3);
our_first_problem.ObjectiveSense = 'maximize';
our_first_problem.Constraints.labour = 2*x(1) + x(2) + 2*x(3) <= 225;
our_first_problem.Constraints.metal = x(1) + x(2) + x(3) <= 117;
our_first_problem.Constraints.wood = 3*x(1) + 3*x(2) + 4*x(3) <= 420;
[sol,fval] = solve(our_first_problem);



load('knapsack_example.mat')

knapsack_table.item{6,1} = 'map';
knapsack_table.weight(6,1) = 0.1;
knapsack_table.value(6,1) = 2;
knapsack_example = optimproblem;
x = optimvar('x',knapsack_table.item,'LowerBound',0,'UpperBound',1,'Type','integer');
knapsack_example.Objective = knapsack_table.value'*x;
knapsack_example.ObjectiveSense = 'max';
knapsack_example.Constraints.weight = knapsack_table.weight'*x <= 2.5;
show(knapsack_example)
[sol,fval] = solve(knapsack_example);


load('transportation_data.mat')
transportation_example = optimproblem;
x = optimvar('x',3,4,'LowerBound',0,'Type','integer');
transportation_example.Objective = sum(sum(transportation_table{:,:}.*x));
transportation_example.ObjectiveSense = 'min';
transportation_example.Constraints.demand = sum(x, 1) == [75, 230, 240, 70];
transportation_example.Constraints.supply = sum(x, 2) == [250; 130; 235];
[sol,fval] = solve(transportation_example);