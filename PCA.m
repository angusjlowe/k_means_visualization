function projected_data = PCA( data,d )
% takes data presented as rows of matrix and returns 
% their projection onto the space of the principal axes

axes = principal_axes(data,d);
projected_data = data*axes;
end

