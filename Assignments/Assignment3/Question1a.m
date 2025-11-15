% OOR Assignment 3, Question 1(a)
% 16 April 2025
%
f = [19; 22; 30; 37; 11; 42];
A = [7, 6, 11, 13, 4, 13];
b = 35;
Aeq = [];
beq = [];
lb = zeros(1,6);
ub = [];
[x1,fval1] = linprog(-f,A,b,Aeq,beq,lb,ub)