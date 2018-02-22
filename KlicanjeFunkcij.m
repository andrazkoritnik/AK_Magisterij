
path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\AK_Magisterij\';
cd(path)

nameListStruct= dir('*.mat');
for i=1:length(nameListStruct)
    FileNames{i}=nameListStruct(i).name;
end

% DSCvseLezije = zeros(1,126);    %% if thr1 & thr2 fixed

% for p = 1:length(nameListStruct)
for p = 1:126
    RefName = FileNames{p}
    load(RefName)
    
    imIn = snip.pet;
    segIn = snip.seg;
    
    [a,b,c] = size(imIn);
    [Max_PET, Max_idx] = max(imIn(:));
    
%     thr1 = 3;                    %% if thr1 fixed
%     thr2 = 0.42 * Max_PET;       %% if thr2 fixed
    
    for u = 1:4
        for o = 1:36
         
            thr2 = (0.33 + u*0.01) .* Max_PET;
            thr1 = 1.0 + o*0.1;

            slikaSeg = andraz_segm_1(imIn,thr1,thr2);  
            Tabula = tabulaSegmentacije(segIn);
         
%            h = fspecial('average',2);     %  filters
%            h = fspecial('disk',0.4);
%            B = imgaussfilt(slikaSeg, 0.4); 
%            B = imfilter(slikaSeg,h);
%            NHOOD2 = strel('disk',1);
%            B = imopen(SlikaSeg,NHOOD2);

           
            matr1 = Tabula;       
            matr2 = slikaSeg;       
%           matr2 = B;  % if filter
         
            DSCi = DiceSimCoe(matr1,matr2);
%           DSCvseLezije(p) = DSCi;   % if thr1 & thr2 fixed
            DSCs(u,o) = DSCi;
%           DSCs(o) = DSCi;           % if only thr1 is adapted
         
        end
     end
    
%         Y = find(DSCs == max(DSCs));   %% if only thr1 is adapted 

         [Max_DSC, Max_idx] = max(DSCs(:));    %% if both thr1 & thr2 adapted
         [X Y] = ind2sub(size(DSCs),Max_idx);
         thr_pravi2 = (0.33 + X*0.01) * Max_PET
         thr_pravi1 = 1.0 + Y*0.1
         
         DSCq(p) = max(DSCs(:));     %% if one of thri adapted
%          
         
         %%  segmentacije slike z optimalnim thresholdom
         
%          slikaSeg1 = andraz_segm_1(imIn,thr1,thr2);  %% if no thr1 & thr2 adapted
%          slikaSeg1 = andraz_segm_1(imIn,thr_pravi1,thr2);  %% if only thr1 is adapted
         slikaSeg1 = andraz_segm_1(imIn,thr_pravi1,thr_pravi2);
%            h1 = fspecial('average',2);
%            h1 = fspecial('disk',0.6);
%            B1 = imgaussfilt(slikaSeg1, 0.6); 
%            B1 = imfilter(slikaSeg1,h1);
%            NHOOD21 = strel('disk',1);
%            B1 = imopen(SlikaSeg1,NHOOD21);
           
%            figure(69)
%            imshow3D(slikaSeg1)
%            imshow3D(B1)       % if filter

%            figure(70)
%            imshow3D(Tabula)
          
        
%%%%   saving stuff only

%     eval(['Segmoja' num2str(p) '=slikaSeg1']);
%     pathName4='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani 1)  v mapo ShrambaSegmentacij
%     fileName4= ['Segmoja', num2str(p)];
%     imeSpremenljivkevWorksspaceu4=(['Segmoja' num2str(p)]);
%     save([pathName4 fileName4], imeSpremenljivkevWorksspaceu4);
%     
%     eval(['SegmojaIM' num2str(p) '=B']);
%     pathName4='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani 2)  v mapo ShrambaSegmentacij
%     fileName4= ['SegmojaIM', num2str(p)];
%     imeSpremenljivkevWorksspaceu4=(['SegmojaIM' num2str(p)]);
%     save([pathName4 fileName4], imeSpremenljivkevWorksspaceu4)
%     
%      eval(['tabula' num2str(p) '=Tabula']);
%      pathName2='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani 3)  v mapo ShrambaSegmentacij
%      fileName2= ['tabula', num2str(p)];
%      imeSpremenljivkevWorksspaceu2=(['tabula' num2str(p)]);
%      save([pathName2 fileName2], imeSpremenljivkevWorksspaceu2)
   
end

DSC_avg = mean(DSCq);
% DSCvseLezije = sum(DSCi);   %% if thr1 & thr2 fixed
% DSC_avg = mean(DSCvseLezije);   %% if thr1 & thr2 fixed   

     x = 1:1:p
     figure(80)
     plot(x,DSCq); hold on
     scatter(x,DSCq,'red'); hold off
%      plot(x,DSCvseLezije); hold on
%      scatter(x,DSCvseLezije,'red'); hold off
     title('DiceSC; poslana vs. moja segmentacija; BKG=3 & THR=0.42*MaxSUV; diskFilter,0.6');
     ylabel('DiceSC');
     xlabel('Zaporedna st. lezije');
