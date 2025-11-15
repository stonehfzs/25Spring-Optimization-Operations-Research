function plot_route_cn(route,cn,cn_distances)

axis([100 130 15 50])
I = imread('cn-map.png');
h = image(xlim,flip(ylim),I);
set(gca,"YDir","normal")
axis equal
axis tight
uistack(h,'bottom')
hold on
plot(cn.lng,cn.lat,'or','MarkerFaceColor','r','MarkerSize',3)

cn_lat=cn.lat;
cn_lng=cn.lng;
hold on
plot(cn_lng([route route(1)]),cn_lat([route route(1)]),'r')
hold off
cn_route_length = tsp_distance(route(:),cn_distances);
str = sprintf('Route length: %.1f km',cn_route_length);
dim = [.27 0 .2 .2];
annotation('textbox',dim,'String',str,'FitBoxToText','on','Color','White','LineStyle','none');
end
