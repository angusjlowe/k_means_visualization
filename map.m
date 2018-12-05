function mapped_array = map( A,m )
%maps array A using map m
mapped_array = zeros(size(A));
for i = 1:size(A)
    mapped_array(i) = m(char(A(i)));
end


end

