clear all;
bilde = double(imread('uio.png'));
%test_bilde = double(imread('eight.png'));
%info = imfinfo('uio.png');
komprimering = 8;


%% Oppgave 2


[trans_bilde, steg3] = komprimere('uio.png', komprimering);

test = bilde(1:8, 1:8);
test = test - 128;
test2 = dct_8_block(test, 1, 1);