% read in the datafile
filename = 'portfolio.csv'
data = readtable(filename);
data = table2array(data(:,3:5))';

Q = 1.5; % required quality average
M = 4.0; % required maturity average
C = 1000000; % $ to invest

% create the relevant matrices
A = [data(1,:) - Q; data(2,:) - M];
b = [0; 0];
c = -data(3,:);
Aeq = ones(1,50);
beq = 1000000;
lb = zeros(50,1);
ub = Inf(50,1);

% call linprog to solve the LP
options = optimoptions(@linprog,'Display' ,'off', 'Diagnostics', 'off');
[x,fval]  = linprog(c,A,b,Aeq,beq,lb,ub,options);

% interpret the results of the LP solver
portfolio = x'
yield = -fval
average_yield = yield / C