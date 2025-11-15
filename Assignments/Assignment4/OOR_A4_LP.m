% Initial matrices and values
A = [2 5 4;
    2 8 5;
    3 3 10];
b = [20; 13; 14];
c = [3; 7; 5];

% LP1: No Additional Constraints
A1 = A;
b1 = b;
[x1, fval] = linprog(-c, A1, b1, [], [], zeros(size(c)));
z1 = -fval
x1

% LP2: Add x2 <= 0 from LP1
A2 = [A1; [0 1 0]];
b2 = [b1; 0];
[x2,fval]   = linprog(-c, A2, b2, [], [], zeros(size(c)));
z2 = - fval
x2

% LP3: Add x2 >= 1 from LP1
A3 = [A1; [0 -1 0]];
b3 = [b1; -1];
[x3,fval] = linprog(-c, A3, b3, [], [], zeros(size(c)));
z3 = - fval
x3

% LP4: Add x1 <= 4 from LP2
A4 = [A2;[1 0 0]];
b4 = [b2; 4];
[x4,fval] = linprog(-c, A4, b4, [], [], zeros(size(c)));
z4 = - fval
x4

% LP5: Add x1 >= 5 from LP2
A5 = [A2;[-1 0 0]];
b5 = [b2; -5];
[x5,fval] = linprog(-c, A5, b5, [], [], zeros(size(c)));
z5 = - fval
x5

% LP6: Add x1 <= 2 from LP3
A6 = [A3;[1 0 0]];
b6 = [b3; 2];
[x6,fval] = linprog(-c, A6, b6, [], [], zeros(size(c)));
z6 = - fval
x6

% LP7: Add x1 >= 3 from LP3
A7 = [A3;[-1 0 0]];
b7 = [b3; -3];
[x7,fval] = linprog(-c, A7, b7, [], [], zeros(size(c)));
z7 = - fval
x7

% LP8: Add x3 <= 0 to LP4
A8 = [A4;[0 0 1]];
b8 = [b4; 0];
[x8,fval] = linprog(-c, A8, b8, [], [], zeros(size(c)));
z8 = - fval
x8

% LP9: Add x3 >= 1 to LP4
A9 = [A4;[0 0 -1]];
b9 = [b4; -1];
[x9,fval] = linprog(-c, A9, b9, [], [], zeros(size(c)));
z9 = - fval
x9

% LP10: Add x3 <= 0 from LP6
A10 = [A6;[0 0 1]];
b10 = [b6; 0];
[x10,fval] = linprog(-c, A10, b10, [], [], zeros(size(c)));
z10 = - fval
x10

% LP11: Add x3 >= 1 from LP6
A11 = [A6;[0 0 -1]];
b11 = [b6; -1];
[x11,fval] = linprog(-c, A11, b11, [], [], zeros(size(c)));
z11 = - fval
x11

% LP12: Add x2 <= 1 to LP10
A12 = [A10;[0 1 0]];
b12 = [b10; 1];
[x12,fval] = linprog(-c, A12, b12, [], [], zeros(size(c)));
z12 = - fval
x12

% LP13: Add x2 >= 2 to LP10
A13 = [A10;[0 -1 0]];
b13 = [b10; -2];
[x13,fval] = linprog(-c, A13, b13, [], [], zeros(size(c)));
z13 = - fval
x13