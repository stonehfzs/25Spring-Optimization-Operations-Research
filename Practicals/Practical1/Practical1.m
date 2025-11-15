f = [-13 -12 -17];
A = [2 1 2; 1 1 1; 3 3 4];
b = [225; 117; 420];
lb = zeros(1,3);
[x,fval] = linprog(f,A,b,[],[],lb);



portfolio = readtable("portfolio.csv");
data = table2array(portfolio(:,3:5))';
f = -data(3,:);
A = [data(1,:) - 1.5; data(2,:) - 4];
b = [0; 0];
Aeq = ones(1,50);
beq = 1000000;
lb = zeros(1,50);
ub = [];
[x,fval] = linprog(f,A,b,Aeq,beq,lb,ub);