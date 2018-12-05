% read data
T = readtable('iris.dat');
iris_X = table2array(T(:,1:4));
iris_Y = table2array(T(:,5));

% map iris classes to numbers
M = containers.Map(unique(iris_Y),[1,2,3]);
iris_Y = map(iris_Y, M);

% perform PCA on iris feature vectors
projected_data = PCA(iris_X,3);

[centroids, Y] = k_means(iris_X,3,100,0.01);

number_correct = 0;
for i = 1:size(Y)
    if(Y(i) == iris_Y(i))
        number_correct = number_correct + 1;
    end
end

fprintf('success rate is %5.2f %%\n', number_correct/size(Y,1) * 100)