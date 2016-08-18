% function to fix the size of the gradient in the figure
% this is needed because if the figure is scaled really small
% the gradient will sometimes not be contained to the 
% axis of the figure not sure why
function resizeGradient(currentFigure)

h = findall(currentFigure, 'type', 'axes');
set(h(2), 'Position', get(h(1), 'Position'));

end