function swaps_no = swaps_to_identity(P)
% SWAPS_TO_IDENTITY calculates the number of swaps needed to transform a
% permutation matrix to the identity matrix
%
%   swaps_no = SWAPS_TO_IDENTITY(P)
%
%   Input arguments:
%       P - permutation matrix
%
%   Output:
%      swaps_no - number of swaps needed to transform P to the identity matrix

swaps_no = 0;
for i = 1 : size(P,1)
    if (P(i,i) == 0)
        for j = i : size(P,1)
            if (P(j,i) == 1)
                P([i, j], :) = P([j, i], :);
                swaps_no = swaps_no + 1;
                break;
            end
        end
    end
end

end
