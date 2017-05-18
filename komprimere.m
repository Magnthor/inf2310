function [steg5_bilde, steg4_bilde, steg3_bilde] = komprimere(bilde_path, q)
%% Steg 1
bilde = double(imread(bilde_path));
info = imfinfo(bilde_path);
steg3_bilde = zeros(info.Height, info.Width);
steg4_bilde = zeros(info.Height, info.Width);
steg5_bilde = zeros(info.Height, info.Width);
mellomregning_steg5 = zeros(info.Height, info.Width);

%% Steg 2

bilde = bilde - 128;

%% Steg 3
for a = 1 : 8 : info.Height
    for b = 1 : 8 : info.Width

        steg3_bilde(a:a+7, b:b+7) = dct_8_block(bilde(a:a+7, b:b+7));
        
    end
end
%% Steg 4
for a = 1 : 8 : info.Height
    for b = 1 : 8 : info.Width

        steg4_bilde(a:a+7, b:b+7) = idct_8_block(steg3_bilde(a:a+7, b:b+7));
        
    end
end

steg4_bilde = steg4_bilde + 128;


%% Steg 5

Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

for a = 1 : 8 : info.Height
    for b = 1 : 8 : info.Width

        steg5_bilde(a:a+7, b:b+7) = steg3_bilde(a:a+7, b:b+7) ./ (q*Q);
        mellomregning_steg5(a:a+7, b:b+7) = round(steg5_bilde(a:a+7, b:b+7));
        steg5_bilde(a:a+7, b:b+7) = mellomregning_steg5(a:a+7, b:b+7) .* (q*Q);
        steg5_bilde(a:a+7, b:b+7) = idct_8_block(steg5_bilde(a:a+7, b:b+7)) + 128;
        
    end
end

figure('Name', 'steg5_bilde');
image(uint8(steg5_bilde));
axis image;
colormap(gray(255));
print('2-5-komprimert', '-dpng');

%% Steg 6

entropien = 0;

for a = 1 : 8 : info.Height
    for b = 1 : 8 : info.Width

        blocken_nullet = mellomregning_steg5(a:a+7, b:b+7) - min(min(mellomregning_steg5(a:a+7, b:b+7))) + 1;
        histogram = zeros(1, max(max(blocken_nullet)));
        p = zeros(1, max(max(blocken_nullet)));
     
        for i = 1 : 8
            for j = 1 : 8
               histogram(blocken_nullet(i,j)) = histogram(blocken_nullet(i,j)) + 1;
                
            end            
        end
        
        for i = 1 : length(histogram)
           p(i) = histogram(i) / length(histogram);
            
        end
        
        for i = 1 : length(p)
            if p(i) == 0
                
            else
                entropien = entropien - (p(i) * log2(p(i)));
            end
            
        end
        
        
               
    end
end
entropien

end
