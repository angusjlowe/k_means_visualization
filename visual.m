% colors to be used in scatter plot
c1 = 1/255*[240 100 100];
c2 = 1/255*[100 240 100];
c3 = 1/255*[100 100 240];

% read data
T = readtable('iris.dat');
iris_X = table2array(T(:,1:4));
iris_Y = table2array(T(:,5));

% map iris classes to numbers
M = containers.Map(unique(iris_Y),[1,2,3]);
iris_Y = map(iris_Y, M);

% perform PCA on iris feature vectors
projected_data = PCA(iris_X,2);

% get centroids and perform PCA projection
% onto same space
p_axes = principal_axes(iris_X,2);
centroids = k_means(iris_X,3,1000,0.001)*p_axes;

% plot results
X = projected_data(:,1);
Y = projected_data(:,2);
%Z = projected_data(:,3);
scatter(X(iris_Y==1),Y(iris_Y==1),15,c1,'filled')
hold on
scatter(X(iris_Y==2),Y(iris_Y==2),15,c2,'filled')
scatter(X(iris_Y==3),Y(iris_Y==3),15,c3,'filled')
scatter(centroids(:,1),centroids(:,2),40,'yellow','h','filled')
[vx,vy] = voronoi(centroids(:,1),centroids(:,2));
plot(vx,vy,'b-')
xlim([min(X)-1 max(X)+1])
ylim([min(Y)-1 max(Y)+1])
legend({'Iris-Setosa','Iris-versicolor','Iris-virginica','Centroids'},'Interpreter','latex')
xlabel('Feature PC 1','Interpreter','latex')
ylabel('Feature PC 2','Interpreter','latex')
title('K-Means Classification and PCA for Iris Data Set')