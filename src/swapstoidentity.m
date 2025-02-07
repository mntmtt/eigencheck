function c = swapstoidentity(P)
counter = 0;
for i= 1:size(P,1) % iterate all the columns
    if(P(i,i) == 0) % if the diagonal value is 0 the row is swapped
        for j = i: size(P,1) % find the 1 among the column
            if(P(j,i) == 1)
                P([i, j], :) = P([j, i], :); %swap row i and j (all the columns)
                counter = counter + 1;
            end
        end
    end
end

c = counter;
end
