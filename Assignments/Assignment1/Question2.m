f = [-2;-2];
A = [-3,-1;-2,1;0,1;3,1;2,-1];
b = [-3;3;5;14;6];
Aeq = [];
beq = [];
lb = zeros(1,2);
ub = [];
[x,fval] = linprog(f,A,b,Aeq,beq,lb,ub)