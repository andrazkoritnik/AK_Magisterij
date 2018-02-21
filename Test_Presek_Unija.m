A = zeros(16,16,16);
B = zeros(16,16,16);

A(4:7, 4:7, 4:7) = 1; 
B(4:7, 4:7, 4:7) = 1; 

A
B

C = A.*B;
Pres = sum(C(:));

D = A + B;
D(D>1)=1;
Unij = sum(D(:));

DSC = Pres / Unij


