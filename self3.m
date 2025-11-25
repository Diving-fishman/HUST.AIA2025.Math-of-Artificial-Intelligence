A=imread('image1.jpg');
X=double(rgb2gray(A));

% figure(1)
% imagesc(X) , axis off , colormap gray
% title('Original Image')

[U,S,V]=svd(X);

r = 50;

Xapp = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';

% figure(2)
% imagesc(Xapp) , axis off , colormap gray
% title('Approximated Image')

figure(3)
semilogy(diag(S));

figure(4)
semilogy(diag(S)/sum(diag(S)));