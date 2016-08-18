% Function to add a transparent gradient to the background of a figure
function addGradient(currentFigure, varargin)

% currentFigure is the front figure
% rangeLow is a numeric value (0:256) to set the lightest color used
% rangeHigh is a numeric value (0:256) to set the darkest color used
% colormap sets the colormap type, any default can be used or I added
%   'reds' and 'blues'
% alpha sets the transperence
% inverse sets if the dark color is the top or the bottom

hold on;

p = inputParser;
addRequired(p, 'currentFigure');
addOptional(p, 'rangeLow', 0);
addOptional(p, 'rangeHigh', 256);
addOptional(p, 'colormap', 'jet');
addOptional(p, 'alpha', 1);
addOptional(p, 'inverse', 0);
addOptional(p, 'auto', 0); % if pbaspect is set to auto in the figure, then set this to 1, otherwise leave as 0

% add more options here if need be

parse(p, currentFigure, varargin{:});

if (p.Results.inverse)
    colorData = repmat(p.Results.rangeLow : p.Results.rangeHigh, 100, 1);
else
    colorData = repmat(fliplr(p.Results.rangeLow:p.Results.rangeHigh), 100, 1);
end

currentAxis = gca();
tempAxis = axes();

xaxisLim = tempAxis.XLim;
yaxisLim = tempAxis.YLim;

set(tempAxis, 'Position', get(currentAxis, 'Position'));

% tempAxis.XScale = currentAxis.XScale;
% tempAxis.YScale = currentAxis.YScale;
tempAxis.XLim = currentAxis.XLim;
tempAxis.YLim = currentAxis.YLim;
tempAxis.DataAspectRatio = currentAxis.DataAspectRatio;

image(xaxisLim, yaxisLim, colorData', 'AlphaData', p.Results.alpha);

switch p.Results.colormap
    case 'reds'
        load('colors.mat');
        colormap(Reds);
    case 'blues'
        load('colors.mat');
        colormap(Blues);
    case 'purples'
        load('colors.mat');
        colormap(Purples);
    case 'greens'
        load('colors.mat');
        colormap(Greens);
        
    % add more cases here with the same structure as previous two
    % mus add the new color to the colors.mat file
    % structure:
    %
    %case 'newColor'
    %   load('colors.mat');
    %   colormap(newColor);
    
    otherwise
        colormap(p.Results.colormap);
end

box off;
axis off;
set(tempAxis, 'Position', get(currentAxis, 'Position'));

pbaspect(tempAxis, pbaspect(currentAxis))

xlim(tempAxis, xaxisLim);
ylim(tempAxis, yaxisLim);

% reset gca to the original axis
if p.Results.auto == 1
    pbaspect('auto');
    axes(currentAxis);
    pbaspect('auto');
else
    axes(currentAxis);
end


end