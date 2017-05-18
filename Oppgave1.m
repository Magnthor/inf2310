clear all;
cow = double(imread('cow.png'));
%test_bilde = double(imread('eight.png'));
info = imfinfo('cow.png');

middel_filter_3 = (1 / (3 ^ 2 )) * ones(3);
middel_filter_4 = (1 / (4 ^ 2 )) * ones(4);
middel_filter_5 = (1 / (5 ^ 2 )) * ones(5);
middel_filter_6 = (1 / (6 ^ 2 )) * ones(6);
middel_filter_7 = (1 / (7 ^ 2 )) * ones(7);

%% Oppgave 1.1 Conv
cow_conv2 = conv2(cow, middel_filter_5);

figure('Name', 'cow_conv2');
image(uint8(cow_conv2));
axis image;
colormap(gray(255));
print('1-1-cow_conv2', '-dpng');

%% Oppgave 1.1 FFT2
cow_fftd = fft2(cow);
filter_fftd = fft2(middel_filter_5, info.Height, info.Width);
cow_filtered = cow_fftd .* filter_fftd;
cow_fft2 = ifft2(cow_filtered);

figure('Name', 'cow_fft2');
image(uint8(cow_fft2));
axis image;
colormap(gray(255));
print('1-1-cow_fft2', '-dpng');

%% Oppgave 1.3
[convoluted, fourier] = dobbelt_filtrering(cow, 50);

figure
t = linspace(1, 50, 50);
plot(t, convoluted)
hold on
plot(t, fourier)
