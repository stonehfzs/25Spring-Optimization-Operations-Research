% OOR Assignment 3, Question 1(c)
% 16 April 2025
%
f = -[19, 22, 30, 37, 11, 42];
A = [7, 6, 11, 13, 4, 13];
b = 35;
Aeq = [];
beq = [];
lb = zeros(1,6);
ub = ones(1,6);
intcon = [1, 2, 3, 4, 5, 6];
[x3,fval3] = intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)