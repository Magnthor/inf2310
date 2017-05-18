function [convoluted, fourier] = dobbelt_filtrering(bilde, antall)

convoluted = zeros(1, antall);
fourier = zeros(1, antall);



for i = 1: antall;
    [convoluted(i), fourier(i)] = filtrering(bilde, ((1 / (i ^ 2 )) * ones(i)));
    
    
end

    function [con, fft] = filtrering(bilde, filter)
    [m, n] = size(bilde);

    tic;

    convuluted = conv2(bilde, filter);

    con = toc;

    tic;

    bilde_fftd = fft2(bilde);
    filter_fftd = fft2(filter, m, n);
    bilde_filtered = bilde_fftd .* filter_fftd;
    bilde_fft2 = ifft2(bilde_filtered);

    fft = toc;



    end
end