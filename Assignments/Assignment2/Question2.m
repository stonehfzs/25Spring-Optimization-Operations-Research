figure;
hold on;
grid on;

x1 = [0, 5, 5, 5, 5, 0];
y1 = [0, 0, 5, 5, 0, 0];
z1 = [0, 0, 0, 65, 85, 125];

x2 = [0, 5, 5, 0, 0, 5, 5, 0];
y2 = [0, 0, 5, 25, 25, 5, 0, 0];
z2 = [0, 0, 0, 0, 25, 65, 85, 125];

plot3(x1, y1, z1, 'b-', 'LineWidth', 2, 'DisplayName', "Bland's Rule");
plot3(x2, y2, z2, 'r-', 'LineWidth', 1, 'DisplayName', 'Another Rule');

xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
title('Trajectories Comparison');
legend('Location', 'best');
view(3);
