function [matrix] = idct_8_block(block)

    matrix = zeros(8,8);

    for x = 0 : 7
        for y = 0 : 7

            
            for a = 0 : 7
                for b = 0 : 7
                    
                    del_1 = cos((((2 * x) + 1) * (a) * pi) / 16);
                    del_2 = cos((((2 * y) + 1) * (b) * pi) / 16);
                    matrix(x+1,y+1) = matrix(x+1,y+1) + (block(a+1,b+1) * del_1 * del_2 * c(a) * c(b));

                end
            end


            matrix(x+1,y+1) = round(matrix(x+1,y+1) * (1 / 4));


        end 
    end


end