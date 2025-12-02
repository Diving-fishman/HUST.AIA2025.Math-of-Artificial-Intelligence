clear all; close all

% Load image
X = double(rgb2gray(imread('cat.jpeg', 'jpeg')));
[nx, ny] = size(X);

%% View the original and reduced images
[U,S,V] = svd(X);

% original
figure,subplot(2,2,1)
imagesc(X), axis off, colormap gray
title('original')

%% approximate image using truncated SVD for r = 5, 20, 100
plotind = 2;
for r = [5, 20, 100]
    Xapprox = U(:,1:r) * S(1:r, 1:r) * V(:,1:r)';
    subplot(2,2,plotind)
    plotind = plotind + 1;
    imagesc(Xapprox), axis off
    title(['r=', num2str(r), ', ', num2str(100*r*(nx+ny)/(nx*ny), '%2.2f'), '% storage'])
end
set(gcf, 'Position', [100, 100, 550, 400])

%% Plot the singular values and cumulative energy
figure
subplot(1,2,1)
semilogy(diag(S), 'k*', 'LineWidth', 1.2), grid on
xlabel('r')
ylabel('singular value, \sigma_r')
xlim([-50 1000])
hold on
rList = [5, 20, 100];
plot(rList, S(rList, rList), 'r.', 'MarkerSize', 20);

subplot(1,2,2)
cumEnergy = cumsum(diag(S))/sum(diag(S));
plot(cumEnergy, 'k*', 'LineWidth', 1.2), grid on
xlabel('r')
ylabel('cumulative energy')
xlim([-50 1000])
ylim([0 1.1])
hold on
plot(rList, cumEnergy(rList), 'r.', 'MarkerSize', 20);
set(gcf, 'position', [100, 100, 550, 240])
