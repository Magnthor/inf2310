clear all;
bilde = double(imread('uio.png'));
%test_bilde = double(imread('eight.png'));
%info = imfinfo('uio.png');
komprimering = 8;


%% Oppgave 2


trans_bilde = komprimere('uio.png', komprimering);