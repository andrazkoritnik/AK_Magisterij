
function Segmentacija1 = andraz_segm_1(imIn, thr1, thr2)

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
% %     imageN = 21;
% 
%     RefName = FileNames{p};
%     load(RefName)
% %     
%     tabula=zeros(size(snip.seg));
%         % str2double(RefName(end-4)) <- to prebere ime (številko) lezije iz imena datoteke
%         % tabula(snip.seg == str2double(RefName(end-4)) ) = 1;
%     tabula(snip.seg >= 1) = 1;
% 
%     eval(['Tabula' num2str(p) '=tabula']);
%     pathName3='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani mojo segmentacijo v mapo ShrambaSegmentacij
%     fileName3= ['Tabula', num2str(p)];
%     imeSpremenljivkevWorksspaceu3=(['Tabula' num2str(p)]);
%     save([pathName3 fileName3], imeSpremenljivkevWorksspaceu3) % tale zadeva ti shrani
%     
%     imIn = (snip.pet);

%     [Max_PET, Max_idx] = max(imIn(:));
%     [X Y] = ind2sub(size(imIn),Max_idx);

%     thr1 = 3;
%     thr2 = 0.42 * Max_PET;

% for p = 1:128
    [a,b,c] = size(imIn);
    Segmoj = zeros(a,b,c);

    for r = 1 : a
        for j = 1 : b
            for k = 1 : c
            
                if  imIn(r,j,k) < thr1
                Segmoj(r,j,k) = 0;
                else if imIn(r,j,k) > thr2
                Segmoj(r,j,k) = 1;
                else if imIn(r,j,k) < thr2 && imIn(r,j,k) > thr1
                Segmoj(r,j,k) = 1./(thr2-thr1).*imIn(r,j,k) - 1./(thr2-thr1).*thr1;
%                 Segmoj(r,j,k) = (1.1).^(imIn(r,j,k))
                    end
                  end
                end
                
            end
        end
    end
    
%     Segmoj(Segmoj < 0.15) = 0;
%      Segmoj = Segmoj / max(Segmoj(:));
%     
%         eval(['Segmoja' num2str(p) '=Segmoj']);
% 
%   % shranjevanje. 
%     pathName4='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani mojo segmentacijo v mapo ShrambaSegmentacij
%     fileName4= ['Segmoja', num2str(p)];
%     imeSpremenljivkevWorksspaceu4=(['Segmoja' num2str(p)]);
%     save([pathName4 fileName4], imeSpremenljivkevWorksspaceu4) % tale zadeva ti shrani

%     Segmentacija1 = (['Segmoja' num2str(p)]);
    Segmentacija1 = Segmoj;

    
%         end
end
