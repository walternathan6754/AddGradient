close all

figure
hold on

xlabel('x')
ylabel('$\exp$($\beta$ x)')

load('colors.mat');

x = 0:.01:10;

beta = [4, 2, 1, 1/2, 1/4, 1/8, 1/16];

for i = 1:length(beta)
    plot(x,exp(-beta(i)*x.^2), 'Color', Reds(50 + i*25,:), 'LineWidth', 2.0)
end

set(gca, 'XScale', 'log')
xlim([.1, 10]);

%%
addGradient(gcf, 'rangeLow', 0, 'rangeHigh',150,'colormap', 'blues', 'alpha', .1, 'inverse', 1)