
function DSCizracun = DiceSimCoe(matr1, matr2)

pathName = 'C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';
% path = 'C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips'
% cd(path)



% 
% load([pathName, 'Segmoja1.mat']);
% load([pathName, 'tabula1.mat']);
% 
% matr1 = Segmoja1;
% matr2 = tabula1;



    if size(matr1) ~= size(matr2)
        error('Matriki morata biti enake velikosti!')
    end

%     
% matr1=matr1>0;
% matr2=matr2>0;   



Tabula = matr1;
Tabula(:,:,:,2) = matr2;
    C = min(matr1,matr2);
    D = max(matr1,matr2);
    
    

% C = matr1 .* matr2;
% D = matr1 + matr2;

% D(D>1) = 1;

DSCji = sum(C(:)) / sum(D(:));

DSCizracun = DSCji;

end

