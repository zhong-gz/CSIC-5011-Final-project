clc
clear
close all

load('face.mat');
X=reshape(Y,[10304,33])';

scale = 0.05;

N = size(X,1);
X = double(X);
X = normalize(X,'norm');
Y = flip(Y,1);

for i = 1:3
    faceimg(:,:,i,:) = Y;
end

mappedA = compute_mapping(X,'LTSA',2,5,'JDQR');

figure(1);
hold on
for i = 1:N
    image([mappedA(i,1) mappedA(i,1)+scale],...
        [mappedA(i,2) mappedA(i,2)+scale*1.217]...
        ,faceimg(:,:,:,i));
    hold on
end
% xlim([0 33*scale])
% ylim([-0.1 scale*1.217+0.1])
% axis off