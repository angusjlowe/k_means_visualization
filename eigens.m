function [eigenvecs, eigenvals] = eigens( M )
% Returns eigenvectors of matrix M 
% each column is an eigenvector in eigenvecs, 
% and eigenvals is an array of corresponding eigenvalues.
% they are organized in an order such that eigenvals 
% is decreasing. 
[V, D] = eig(M);
[d, ind] = sort(diag(D),'descend');
V = V(:,ind);
eigenvecs = V;
eigenvals = d;
end

