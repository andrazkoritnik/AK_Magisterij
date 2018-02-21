
path='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\';
cd(path)

nameListStruct= dir('*.mat');
for i=1:length(nameListStruct)
%     for i = 1:5
    FileNames{i}=nameListStruct(i).name;
end
 
% %%%%% change to desired snip number

DSCvseLezije = zeros(1,126);

%asèofjsdklgbjsdkln

% for p = 1:length(nameListStruct)
for p = 1:126
    RefName = FileNames{p}
    load(RefName)
    
    imIn = snip.pet;
    segIn = snip.seg;
    
    [a,b,c] = size(imIn);
    
    thr1 = 4;
    [Max_PET, Max_idx] = max(imIn(:));
    thr2 = 0.42 * Max_PET;

%      for o = 1:36
%          thr1 = 1.4 + o*0.1;
        
         slikaSeg = andraz_segm_1(imIn,thr1,thr2);  
         Tabula = tabulaSegmentacije(segIn);
         
%            h = fspecial('average',2);
%            h = fspecial('disk',0.4);
%            B = imgaussfilt(slikaSeg, 0.4); 
%            B = imfilter(slikaSeg,h);

           

         
         matr1 = Tabula;       
         matr2 = slikaSeg;         
         
%          DSCi = DiceSimCoe(matr1,matr2);
         DSCi = DiceSimCoe(matr1,matr2);  %% èe thr1=1  (fiksen)
        DSCvseLezije(p) = DSCi;
%          DSCs(o) = DSCi;
         
%         end
    
%          indeks = find(DSCs == max(DSCs));
%          thr_pravi = 1.4 + indeks*0.1;
%          DSCq(p) = max(DSCs);
%          
         
         %%  segmentacije slike z optimalnim thresholdom
         
%          slikaSeg1 = andraz_segm_1(imIn,thr_pravi,thr2);
%            h1 = fspecial('average',2);
%            h1 = fspecial('disk',0.6);
%            B1 = imgaussfilt(slikaSeg1, 0.6); 
%            B1 = imfilter(slikaSeg1,h1);
           
%            figure(69)
%            imshow3D(slikaSeg)
%            
%            figure(70)
%            imshow3D(Tabula)
          
        
    
    
    
% % %           slikaSeg1 = andraz_segm_1(imIn,thr1,thr2);     %% -->   1)  Tole je funkcija moje segmentacije, katere output je slikeSeg
%              slikaSegIM = andraz_segm_1IM(imIn,thr1,thr2)    %%  -->   2)  Funkcija moje segmentacije z dodanim "imopen"
% % %           Tabula1 = tabulaSegmentacije(segIn)    %%  -->   3)   Funkcija, ki poslano segmentacijo spravi na 1  ( (snip.seg>1)=1  )
          
                    
%           B = imgaussfilt(slikaSeg, 0.4) 
%           h = fspecial('average',2)
%           h = fspecial('disk',0.6)
%           B = imfilter(slikaSeg,h)
%           B = medfilt2(slikaSeg)
          
%     eval(['Segmoja' num2str(p) '=slikaSeg']);
%     pathName4='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani 1)  v mapo ShrambaSegmentacij
%     fileName4= ['Segmoja', num2str(p)];
%     imeSpremenljivkevWorksspaceu4=(['Segmoja' num2str(p)]);
%     save([pathName4 fileName4], imeSpremenljivkevWorksspaceu4);
%     
%     eval(['SegmojaIM' num2str(p) '=slikaSegIM']);
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
%     
%                
% % %      matr3 = Tabula1;        %%  Definicija 1. matrike za DCS      
% % %      matr4 = slikaSeg1;      %%  Definicija 2. matrike za DCS
%      matr2 = slikaSegIM; 
% 
% % %                DSCz = DiceSimCoe(matr3,matr4);    %% Funkcija ki izraèuna DSC       
                
% % %                     DSCvseLezije(p) = DSCz;
              
% % %                     if DSCz > 0
% % %                         NnoZeros = NnoZeros + 1;
% % %                     end
     
     %%%%  Watershed 2D Function
     
%      petIMG = snip.pet;
%      WS = watershed_2D(petIMG);
%      
%     eval(['SegWS' num2str(p) '=WS']);
%     pathName8='C:\Users\Andraz\Desktop\Faks\Mag.naloga\lesion_snips\ShrambaSegmentacij\';     %%%... shrani 1)  v mapo ShrambaSegmentacij
%     fileName8= ['SegWS', num2str(p)];
%     imeSpremenljivkevWorksspaceu8=(['SegWS' num2str(p)]);
%     save([pathName8 fileName8], imeSpremenljivkevWorksspaceu8)
     
    
end
DSC_avg = mean(DSCvseLezije);
% DSCvseLezije = sum(DSCi);   %% èe thr1 = 3 (fiksen)

% DSC_avg = DSCvseLezije / p;


     x = 1:1:p
     plot(x,DSCvseLezije); hold on
     scatter(x,DSCvseLezije,'red'); hold off
     title('DiceSC; poslana vs. moja segmentacija; BKG=3 & THR=0.42*MaxSUV; diskFilter,0.6');
     ylabel('DiceSC');
     xlabel('Zaporedna st. lezije');

% colorwash(slikaSeg, Tabula);
% figure(1)
% imshow3D(slikaSeg);
% figure(2)
% imshow3D(Tabula)
% figure(3)
% imshow3D(B)