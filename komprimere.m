function [steg4_bilde] = komprimere(bilde_path, q)
%% Steg 1
bilde = double(imread(bilde_path));
info = imfinfo(bilde_path);
steg3_bilde = zeros(info.Height, info.Width);
steg4_bilde = zeros(info.Height, info.Width);

%% Steg 2

bilde = bilde - 128;

%% Steg 3
for a = 1 : info.Height
    for b = 1 : info.Width
        kvadrant_x = floor((a-1) / 8) + 1;
        kvadrant_y = floor((b-1) / 8) + 1;
        
        for x = 1 : 8
            for y = 1 : 8
                del_1 = cos((((2 * x) + 1) * a * pi) / 16);
                del_2 = cos((((2 * y) + 1) * b * pi) / 16);
                steg3_bilde(a,b) = steg3_bilde(a,b) + (bilde((kvadrant_x + x),(kvadrant_y + y)) * del_1 * del_2);

            end
        end
        
        steg3_bilde(a,b) = steg3_bilde(a,b) * (1 / 4) * c(a) * c(b);
        
    end
end
%% Steg 4
for a = 1 : info.Height
    for b = 1 : info.Width
        kvadrant_x = floor((a-1) / 8) + 1;
        kvadrant_y = floor((b-1) / 8) + 1;
        
        for x = 1 : 8
            for y = 1 : 8
                del_1 = cos((((2 * a) + 1) * x * pi) / 16);
                del_2 = cos((((2 * b) + 1) * y * pi) / 16);
                steg4_bilde(a,b) = steg4_bilde(a,b) + (c(x) * c(y) * steg3_bilde((kvadrant_x + x),(kvadrant_y + y)) * del_1 * del_2);
            end
        end
        
        steg4_bilde(a,b) = round((steg4_bilde(a,b) * (1 / 4)) + 128);
        
    end
end


%% Steg 5
Q = [16 11 10 16 24 40 51 61;
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];


%% Steg 6

%% Steg 7





end
