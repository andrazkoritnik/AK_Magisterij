
function Segmentacija1 = andraz_segm_1(imIn, thr1, thr2)
    
   
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
%               Segmoj(r,j,k) = (1.1).^(imIn(r,j,k))     %% if poten. func.
                    end
                  end
                end
                
            end
        end
    end

    Segmentacija1 = Segmoj;

end
