
function DSC = DiceSimCoe(mat1, mat2) 
% This function calculates Dice similarity coefficient between mat1 and 
% mat2. 
% Use: DSC = DiceSimCoe(mat1, mat2) 
 


% Tabula = tabulaSegmentacije(snip.seg);
%  mat1 = Tabula;
%  mat2 = Tabula(:,:,:,2);


if size(mat1) ~= size(mat2) 
    error('Matriki morata biti enake velikosti!') 
end 

C = min(mat1,mat2)
D = max(mat1,mat2) 

DSC = sum(C(:)) / sum(D(:)); 
 
end