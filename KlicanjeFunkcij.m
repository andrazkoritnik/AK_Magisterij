
path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\AK_Magisterij\';
cd(path)

nameListStruct= dir('*.mat');
for i=1:length(nameListStruct)
    FileNames{i}=nameListStruct(i).name;
end

% DSCvseLezije = zeros(1,126);        %% if thr1 & thr2 fixed

% for p = 1:length(nameListStruct)
for p = 2:2
    RefName = FileNames{p}
    load(RefName)
    
    imIn = snip.pet;
    segIn = snip.seg;
    
    [a,b,c] = size(imIn);
    
         [Max_PET, Max_idx] = max(imIn(:));
    
%     thr1 = 3;                                         %% if thr1 & thr2 fixed
%     thr2 = 0.42 * Max_PET;                            %% if thr1 & thr2 fixed
%     slikaSeg = andraz_segm_1(imIn,thr1,thr2);         %% if thr1 & thr2 fixed
%     Tabula = tabulaSegmentacije(segIn);               %% if thr1 & thr2 fixed
%     matr1 = Tabula;                                   %% if thr1 & thr2 fixed
%     matr2 = slikaSeg;                                 %% if thr1 & thr2 fixed
%     matr2 = B;                                             % if filter           
%     DSCvseLezije(p) = DSCi;                           %% if thr1 & thr2 fixed

    [DSCs, thr_pravi1, thr_pravi2] = optimal_thresholds(imIn,segIn,Max_PET);       %% function that find optimal thr1 & thr2 or one of them
    
     DSCq(p) = max(DSCs(:));     %% if one of thr_i or both adapted
%          
         
         %%  segmentacije slike z optimalnim thresholdom
         
%          slikaSeg1 = andraz_segm_1(imIn,thr_pravi1,thr2);  %% if only thr1 is adapted
         slikaSeg1 = andraz_segm_1(imIn,thr_pravi1,thr_pravi2);
         Tabula = tabulaSegmentacije(segIn);
        
         
%            h1 = fspecial('average',2);
%            h1 = fspecial('disk',0.6);
%            B1 = imgaussfilt(slikaSeg1, 0.6); 
%            B1 = imfilter(slikaSeg1,h1);
%            NHOOD21 = strel('disk',1);
%            B1 = imopen(SlikaSeg1,NHOOD21);

           DSCC(p) = DiceSimCoe(slikaSeg1,Tabula);   % Check if DSCC same as DSCq
%            DSCC(p) = DiceSimCoe(B1,Tabula);   % Check if DSCC same as DSCq
           
           figure(69)
%            imshow3D(slikaSeg1)
           imshow3D(B1)       % if filter

           figure(70)
           imshow3D(Tabula)
          
        
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

DSC_avg = mean(DSCq);                   %% if one of thr_i or both adapted
% DSC_avg = mean(DSCvseLezije);         %% if thr1 & thr2 fixed   

     x = 1:1:p
     figure(80)
     plot(x,DSCq); hold on
     scatter(x,DSCq,'red'); hold off
%      plot(x,DSCvseLezije); hold on              %% if thr1 & thr2 fixed
%      scatter(x,DSCvseLezije,'red'); hold off    %% if thr1 & thr2 fixed

     title('DiceSC; poslana vs. moja segmentacija; BKG=3 & THR=0.42*MaxSUV; diskFilter,0.6');
     ylabel('DiceSC');
     xlabel('Zaporedna st. lezije');
