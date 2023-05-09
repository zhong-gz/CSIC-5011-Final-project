clc
clear
close all

t = 100;

scale = 0.5;

load('face.mat');
X=reshape(Y,[10304,33])';

N = size(X,1);
X = double(X);
X = normalize(X,'norm');
Y = flip(Y,1);

for i = 1:3
    faceimg(:,:,i,:) = Y;
end

for i = 1:N
    for j = 1:N
        W(i,j) = exp((-1*norm(X(i,:)-X(j,:))^2)/t);
    end
end

Degree = diag(sum(W,2));
P = Degree\W;
L = P-eye(N);

[V,D] = eig(L);
[d,ind] = sort(diag(D),"descend");
Vs = V(:,ind);

v1 = Vs(:,2);
[~,ind] = sort(v1,"descend");

figure(1);
hold on
for i = 1:N
    image([(i-1)*scale i*scale],...
        [0 0+scale*1.217]...
        ,faceimg(:,:,:,ind(i)));
    hold on
end
xlim([0 33*scale])
ylim([-0.1 scale*1.217+0.1])
axis off