
function [DSCs, optimalThr1, optimalThr2] = optimal_thresholds(imIn, segIn, Max_PET)
  

      for u = 1:4
        for o = 1:36
         
            thr2 = (0.38 + u*0.01) .* Max_PET;
            thr1 = 2.0 + o*0.1;

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
%             matr2 = B;  % if filter
         
            DSCi = DiceSimCoe(matr1,matr2);
            DSCs(u,o) = DSCi;
%           DSCs(o) = DSCi;           % if only thr1 is adapted
         
        end
      end
          
%          Y = find(DSCs == max(DSCs));              %% if only thr1 adapted 
         [Max_DSC, Max_idx] = max(DSCs(:))           %% if both thr1 & thr2 adapted
         [X Y] = ind2sub(size(DSCs),Max_idx)         %% if both thr1 & thr2 adapted

         thr_pravi2 = (0.38 + X*0.01) * Max_PET
         thr_pravi1 = 2.0 + Y*0.1
         
         optimalThr1 = thr_pravi1;
         optimalThr2 = thr_pravi2;

end


