
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





% load([pathName, 'Segmoja1.mat']);
% load([pathName, 'Tabula1.mat']);
% path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\Segmoj';
% path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\SegmojIM2';
% path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\Segposl';


% cd(path)

% load('Segmoj.mat');
% load('snip.mat');


%   ________moja 2D DSC_________

% Snip.seg_T1_11_1 = snip.seg_T1_11_1 ./3;   %Normalizacija segmentacije
% 
% 
% Sy = size(Segmoj_T1_11_1,1);  % št vrstic
% Sx = size(Segmoj_T1_11_1,2);   % št stolpev
% 
% SkDel = zeros(Sy,Sx);
% 
% 
% for j = 1:Sx
%         
% A(j) = sum(Segmoj_T1_11_1(:,j,13));
% B(j) = sum(Snip.seg_T1_11_1(:,j,13));
% 
%     for i = 1:Sy
%     
%     if Segmoj_T1_11_1(i,j,13) < Snip.seg_T1_11_1(i,j,13)
%         SkDel(i,j) = Segmoj_T1_11_1(i,j,13);
%     else Segmoj_T1_11_1(i,j,13) >= Snip.seg_T1_11_1(i,j,13)
%         SkDel(i,j) = Snip.seg_T1_11_1(i,j,13);
%     end
%     
% %     QS(j) = 2*(sum(SkDel(i,j))) ./ (A(j)+B(j));
% 
% 
%     end
% % QS = 2*(sum(SkDel)) ./ (A+B)
% %     SumSkDel = sum(SkDel,j);
% 
% SumSkDel = sum(SkDel,1);
% QS(j) = 2*(SumSkDel(j)) ./ (A(j) + B(j))
% 
% end

% path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips';
% cd(path)
% 
% nameListStruct= dir('*.mat');
% for i = 1:2
%    FileNames{i}=nameListStruct(i).name;
%    load(FileNames{i})
% end

% end

% %  Vse vrednosti segmentacije, ki so veè od 3, spravit na 0!! - 3x for loop
% 
% for i = 1:a
%     for j = 1:b
%         for k = 1:c
%         
%         if SegPosl(i,j,k) >= 1
%             SegPosl(i,j,k) = 1;
%         end
%         end
%     end
% end
% 
% % load('IM2.mat');
% 
% %  A = IM2;
% 
% variablesInCurrentWorkspace = who
% numVariables = length(variablesInCurrentWorkspace)




%   A = Segmoj(j);
%   B = SegPosl(j);
%  
%  C = A.*B;
% Pres = sum(C(:));
% 
% D = A + B;
% D(D>1)=1;
% Unij = sum(D(:));
% 
% DSC_Peter = Pres / Unij
% 
% end

% 
% 
% % % C = intersect(A(:,:,10),B(:,:,10),'rows') 
% % Ninters = 0;
% % for l = 1:a
% %     for m = 1:b
% %         for n = 1:c
% %          
% %            if ((A(l,m,n) - B(l,m,n)) == 0.0000)
% %                Ninters = Ninters + 1;
% %            end
% %         end
% %     end
% % end
% % 
% % Unija = 2*a*b*c;
% % DSC1 = Ninters / Unija
% 
% % SumNinters = 0;
% % for l = 1:a
% %     for m = 1:b
% %         for n = 1:c
% %          
% %            if ((A(l,m,n) - B(l,m,n)) == 0.0000)
% %                SumNinters = SumNinters + A(l,m,n);
% %            end
% %         end
% %     end
% % end
% % SumUnija = sum(A(:)) + sum(B(:));
% % SumUnija(SumUnija>1)=1;
% % DSC2_Moja_Def_DSC = SumNinters / SumUnija
% 
% 
% 
% C = A.*B;
% Pres = sum(C(:));
% 
% D = A + B;
% D(D>1)=1;
% Unij = sum(D(:));
% 
% DSC_Peter = Pres / Unij
% 
% end
% 
% % 
% % figure(80)
% % imshow3D(Segmoj1)
% % 
% % figure(81)
% % imshow3D(IM2);
% % 
% % figure(82)
% % imshow3D(snip1.seg)



