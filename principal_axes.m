function axes = principal_axes( M,d )
% returns first d principle axes in order as columns of matrix 

S = cov(M);
axes = eigens(S);
axes = axes(:,1:d);


end

