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

vertices = [
    5, 5, 65;
    5, 0, 85;
    0, 25, 25;
    0, 0, 125;
    5, 5, 0;
    5, 0, 0;
    0, 25, 0;
    0, 0, 0
];

faces = {
    [5, 6, 8, 7],
    [1, 2, 4, 3],
    [5, 6, 2, 1],
    [6, 8, 4, 2],
    [8, 7, 3, 4],
    [7, 5, 1, 3]
};


for i = 1:length(faces)
    patch('Vertices', vertices, 'Faces', faces{i}, ...
          'FaceColor', [0, 0.5, 0], 'EdgeColor', 'k', ...
          'FaceAlpha', 0.6, 'HandleVisibility', 'off');
end
view(3);
grid on;

xlabel('x_1');
ylabel('x_2');
zlabel('x_3');
title('Trajectories Comparison With Feasible Regions');
legend('Location', 'best');
view(3);
