
% segmentacija tumorja iz cd-ja (OI)

%%%   need dcm2mat first!!!


[a,b,c] = size(ans.data);
figure(1)
imshow3D(ans.data);

% Max = max(ans.data(:))       %maksimalna vrednost 
% [X Y] = ind2sub(size(ans.data),Max);    %lokacija max. vrednosti

insl = 274;
fisl = 283;

ansd = zeros(200,200,10);


for j = 1:10
   ansd(:,:,j) =  ans.data(: , : , 273 + j);
end


figure(3)
imshow3D(ansd);

Max_Value = max(ansd(:));


rezina274 = ans.data(:,:,274);
figure(4)
imshow3D(rezina274);

[Max_r274, Max_idx] = max(rezina274(:))
[X Y] = ind2sub(size(rezina274),Max_idx)


%%  eliminacija podroèja v rezini 274, kjer mislim, da je tumor

dimx = 30;
dimy = 45;
segtum = zeros(dimx,dimy);

thr = 0.42 * Max_r274

for k = 1:dimx
    for l = 1:dimy
    rez274tum(k,l) = rezina274(k+73,l+70);
    end
end


for m = 1:dimx
    for n = 1:dimy
     if rez274tum(m,n) < 3
         segtum(m,n) = 0;
     else if rez274tum(m,n) > thr
            segtum(m,n) = 1;
         else if rez274tum(m,n) < thr
                 segtum(m,n) = (1./(thr-3)) .* rez274tum(m,n) - (1./(thr-3)).*3;
                
     end
     end
    end
    end
end

for q = 1:17
    for w = 1:dimy
segtum(q,w) = 0;
    end
end

figure(5)
imshow3D(rez274tum);

[Max_rez274tum, Max_idxx] = max(rez274tum(:))
[X Y] = ind2sub(size(rez274tum),Max_idxx)

figure(6)
imshow3D(segtum)

















