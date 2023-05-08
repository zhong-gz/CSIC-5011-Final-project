clc
clear
close all

load('face.mat');
X=reshape(Y,[10304,33])';

N = size(X,1);

scale = 0.05;

t = 1; 

sigama = 10;

Xsize = 0.1;

no_dims = 2;

mappedA = compute_mapping(X, 'DiffusionMaps', no_dims,t,sigama);

Xsize = scale*1*(max(mappedA(:,1))-min(mappedA(:,1)));
Ysize = scale*1.217*(max(mappedA(:,2))-min(mappedA(:,2)));

scatter(mappedA(:,1),mappedA(:,2))
hold on

Y = flip(Y,1);

for i = 1:3
    faceimg(:,:,i,:) = Y;
end

for i = 1:N
    image([mappedA(i,1)-Xsize mappedA(i,1)+Xsize],...
        [mappedA(i,2)-Ysize mappedA(i,2)+Ysize]...
        ,faceimg(:,:,:,i));
    hold on
end