function plot_route_au(route,au,au_distances)

axis([110 155 -45 -10])
I = imread('au-map.png');
h = image(xlim,flip(ylim),I);
set(gca,"YDir","normal")
axis equal
axis tight
uistack(h,'bottom')
hold on
plot(au.lng,au.lat,'or','MarkerFaceColor','r')

au_lat=au.lat;
au_lng=au.lng;
hold on
plot(au_lng([route route(1)]),au_lat([route route(1)]),'r')
hold off
au_route_length = tsp_distance(route(:),au_distances);
str = sprintf('Route length: %.1f km',au_route_length);
dim = [.2 .1 .2 .2];
annotation('textbox',dim,'String',str,'FitBoxToText','on','Color','White','LineStyle','none');
end
