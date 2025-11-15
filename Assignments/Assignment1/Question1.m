f = [20/60 10/60 5/60];
A = [734/3 1304/6 3586/12;
    -1 1 0;
    0 -1 2];
b = [250; 0; 0];
Aeq = [1 1 1];
beq = 1;
lb = zeros(1,3);
ub = [];
[x,fval] = linprog(f,A,b,Aeq,beq,lb,ub)