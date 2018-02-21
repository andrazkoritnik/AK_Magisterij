
function imOut = andraz_segm_1IM(imIn, thr1, thr2)

    % imIn je input paratmeter v fukcijo. Verjetno slika, ja. :)
    % imOut je to kar pošlješ ven.
    
    
% path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips';
% cd(path)
% 
% nameListStruct= dir('*.mat');
% for i=1:length(nameListStruct)
%    FileNames{i}=nameListStruct(i).name;
% end
% 
% %%%%% change to desired snip number
% for p = 1:length(nameListStruct)
%     
% %     imageN = 21;
% 
%     RefName = FileNames{p};
%     load(RefName)
%     
%     imIn = (snip.pet);     %input == PET slika lezije
%     
%      tabula=zeros(size(snip.seg));
%     % str2double(RefName(end-4)) <- to prebere ime (številko) lezije iz imena datoteke
%     % tabula(snip.seg == str2double(RefName(end-4)) ) = 1;
%       tabula(snip.seg >= 1) =1;
% 
%     eval(['Tabula' num2str(p) '=tabula']);
%     pathName1='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani mojo segmentacijo v mapo ShrambaSegmentacij
%     fileName1= ['Tabula', num2str(p)];
%     imeSpremenljivkevWorksspaceu=(['Tabula' num2str(p)]);
%     save([pathName1 fileName1], imeSpremenljivkevWorksspaceu) % tale zadeva ti shrani
%     
%   
% %     eval(['PetSlikaLezija' num2str(p) '=snip.pet']);  %  npr. name(PetSlikalezija1) = PET slika prve lezije  
%   
% %     imIn = (snip.pet);     %input == PET slika lezije
% 
%     [Max_PET, Max_idx] = max(imIn(:));
%     [X Y] = ind2sub(size(imIn),Max_idx);
% 
%     Thr = 0.42 * Max_PET;

    [a,b,c] = size(imIn);
    Segmoj = zeros(a,b,c);

    for r = 1 : a
        for j = 1 : b
            for k = 1 : c
            
                if  imIn(r,j,k) < thr1
                Segmoj(r,j,k) = 0;
                else if imIn(r,j,k) > thr2
                Segmoj(r,j,k) = 1;
                else if imIn(r,j,k) < thr2
                Segmoj(r,j,k) = (1./(thr2-3)) .* imIn(r,j,k) - (1./(thr2-3)).*3;
                    end
                  end
                end
            end
        end
    end


    NHOOD2 = strel('disk',1);
    IM2 = imopen(Segmoj,NHOOD2);

    imOut = IM2;
    
end
    