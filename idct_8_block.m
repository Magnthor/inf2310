function [matrix] = idct_8_block(block)

    matrix = zeros(8,8);

    for a = 0 : 7
        for b = 0 : 7

            
            for x = 0 : 7
                for y = 0 : 7
                    
                    del_1 = cos((((2 * a) + 1) * (x) * pi) / 16);
                    del_2 = cos((((2 * b) + 1) * (y) * pi) / 16);
                    matrix(a+1,b+1) = matrix(a+1,b+1) + (block(x+1,y+1) * del_1 * del_2 * c(a) * c(b));

                end
            end


            matrix(a+1,b+1) = round(matrix(a+1,b+1) * (1 / 4));


        end 
    end


end