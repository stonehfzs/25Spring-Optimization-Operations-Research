% OOR Assignment 3, Question 1(b)
% 16 April 2025
%
f = -[19, 22, 30, 37, 11, 42];
A = [7, 6, 11, 13, 4, 13];
b = 35;
Aeq = [];
beq = [];
lb = zeros(1,6);
ub = ones(1,6);
[x2,fval2] = linprog(f,A,b,Aeq,beq,lb,ub)