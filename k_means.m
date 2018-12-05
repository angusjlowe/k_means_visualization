function [centroids, Y] = k_means( data, n, maxiter, thresh )
% performs k_means with random initialization 
% on data with n centroids
N = size(data,1);
dim = size(data,2);
centroids = rand(dim,n)*max(max(data));
for k = 1:maxiter
     % zeros will be ignored
    points_belonging_to_centroids = zeros(N,n);
    for i = 1:N
        ds = distances(data(i,:),centroids);
        [~, ind] = min(ds);
        points_belonging_to_centroids(i,ind) = 1;
    end
    prevCentroids = centroids;
    centroids = reassign_centroids(points_belonging_to_centroids, data);
    if sum(centroids - prevCentroids) <= thresh
        break
    end
end
% classification outputs
Y = zeros(N,1);
for i = 1:size(Y)
    [~, Y(i)] = max(points_belonging_to_centroids(i,:)); 
end
centroids=centroids.';
end