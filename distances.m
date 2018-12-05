function ds = distances( input_vector, centroids )
% distance of 1 by dim input vector from each of the 
% n centroids represented as a dim by n matrix
n = size(centroids,2);
ds = zeros(1,n);
for i = 1:n
    ds(i) = norm(input_vector.' - centroids(:,i));
end
end

