function new_centroids = reassign_centroids( M, data )
% takes an d by n matrix M of points belonging to centroids 
% and an N by d matrix of data points and 
% returns a d by n matrix of new centroids
% based on the mean of the points

d = size(data,2);
N = size(M,1);
n = size(M,2);
new_centroids = zeros(d,n);
for i = 1:n
    if sum(M(:,i))==0
        new_centroids(:,i) = rand(d,1)*max(max(data));
    else
        points = data(M(:,i)==1,:);
        new_centroids(:,i) = mean(points,1).';
    end
    
end

end