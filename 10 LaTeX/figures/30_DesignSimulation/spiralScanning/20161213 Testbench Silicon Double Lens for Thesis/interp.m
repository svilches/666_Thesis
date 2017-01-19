xy = -2.5 + 5*gallery('uniformdata',[200 2],0);
x = xy(:,1);
y = xy(:,2);
v = x.*exp(-x.^2-y.^2);
[xq,yq] = meshgrid(-2:.2:2, -2:.2:2);
vq = griddata(x,y,v,xq,yq);
figure
mesh(xq,yq,vq);
hold on
plot3(x,y,v,'.','MarkerSize', 20);

h = gca;
h.XLim = [-2.7 2.7];
h.YLim = [-2.7 2.7];