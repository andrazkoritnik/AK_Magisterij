
function DSC = DiceSimCoe(mat1, mat2)
% This function calculates Dice similarity coefficient between mat1 and
% mat2.
% Use: DSC = DiceSimCoe(mat1, mat2)

if size(mat1) ~= size(mat2)
    error('Matriki morata biti enake velikosti!')
end

Tabula = mat1;
Tabula(:,:,:,2) = mat2;

C = min(mat1,mat2); % get the small overlap value
D = max(mat1,mat2); % get the big overlap value

DSC = sum(C(:)) / sum(D(:));

end
