function [matrix] = dct_8_block(block, m, n)

    matrix = zeros(8,8);

    for a = 0 : 7
        for b = 0 : 7

            
            for x = 0 : 7
                for y = 0 : 7
                    del_1 = cos((((2 * x) + 1) * (m+a) * pi) / 16);
                    del_2 = cos((((2 * y) + 1) * (n+b) * pi) / 16);
                    matrix(a+1,b+1) = matrix(a+1,b+1) + (block(x+1,y+1) * del_1 * del_2);

                end
            end


            matrix(a+1,b+1) = matrix(a+1,b+1) * (1 / 4) * c(a+m) * c(b+n);


        end 
    end


end