clear all;
bilde = double(imread('uio.png'));
%test_bilde = double(imread('eight.png'));
%info = imfinfo('uio.png');
komprimering = 8;


%% Oppgave 2


[steg5, steg4, steg3] = komprimere('uio.png', komprimering);
