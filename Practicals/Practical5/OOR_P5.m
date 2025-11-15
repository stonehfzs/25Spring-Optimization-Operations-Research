A = [6 4 4; 4 7 3; 0 1 4];
b = [12; 18; 17];
c = [2, 10, 1];
[x,fval,exitflag] = linprog(-c,A,b,[],[],zeros(1,3),[]);
z = -fval;



A1 = [A; 0, 1, 0];
b1 = [b; floor(x(2))];
[x1,fval1,exitflag1] = linprog(-c,A1,b1,[],[],zeros(1,3),[]);
z1 = -fval1;

A2 = [A; 0, -1, 0];
b2 = [b; -ceil(x(2))];
[x2,fval2,exitflag2] = linprog(-c,A2,b2,[],[],zeros(1,3),[]);
z2 = -fval2;


A3 = [A1; 1, 0, 0];
b3 = [b1; 0];
[x3,fval3,exitflag3] = linprog(-c,A3,b3,[],[],zeros(1,3),[]);
z3 = -fval3;

A4 = [A1; -1, 0, 0];
b4 = [b1; -1];
[x4,fval4,exitflag4] = linprog(-c,A4,b4,[],[],zeros(1,3),[]);
z4 = -fval4;


[x, fval] = intlinprog(-c, [1, 2, 3],A,b,[],[],[0,0,0],[])