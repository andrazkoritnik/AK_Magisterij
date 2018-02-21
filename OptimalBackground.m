
function optimalBKG = optimal_background(imIn, segIn, thr1)



 for o = 1:36
     thr1 = 1.4 + o*0.1;
     thr2 = 0.42 * max(imIn(:))
     
          slikaSeg = andraz_segm_1(imIn,thr1,thr2);  
          Tabula = tabulaSegmentacije(segIn)  
          
%           B = imgaussfilt(slikaSeg, 0.4) 
%           h = fspecial('average',2)
%           h = fspecial('disk',0.6)
%           B = imfilter(slikaSeg,h)
%           B = medfilt2(slikaSeg)


     matr1 = Tabula;       
     matr2 = slikaSeg; 
     
               DSCi = DiceSimCoe(matr1,matr2);    %% Funkcija ki izraèuna DSC       
               DSCs(o) = DSCi;
               
 end
 
 indeks = find(DSCs == max(DSCs));

 thr1r = 1.9 + indeks*0.1;

 optimalBKG = thr1r;

end



