# AddGradient
A Matlab function to add a gradient image to a figure background.  This function was motivated because our research group commonly creates figures with colored backgrounds in powerpoint post generation of the figure in Matlab.  This function helps make the figures more reproducible for publication.
Has been tested on linear and log scale images, double axis images, subplots, and most other simply matlab figures.

### Developers
Nathan Walter, UIUC, walternathan6754@gmail.com

### Test Environments
Matlab 2015b, Mac OS X 10.11

### src
##### Files
* addGradient.m
    function to add a gradient image to a figure background
    ##### Inputs
    * 'currentFigure' -- handle to figure to add gradient
    * 'rangeLow'      -- integer 0 to 256 indicating the lighter color
    * 'rangeHigh'     -- integer 0 to 256 indicating the darker color
    * 'colormap'      -- string indicating the colormap to generate gradient from (and default matlab color map or 'reds', 'blues', 'greens', 'purples')
    * 'alpha'         -- float 0 to 1 indicating the alpha channel of the gradient
    * 'inverse'       -- boolean indicating if gradient is up-down or down-up orientated
    * 'auto'          -- boolean indicating if the figure has 'auto' scaled axis
* resizeGradient.m
    function to resize an already added gradient if it does not fit current axis
* colors.mat
    Matlab matrix with various color gradients included

### Example
To add a colored gradient to the following image

<img src="./images/no_gradient.png" width="200">

`>> $ addGradient(gcf, 'rangeLow', 0, 'rangeHigh',100,'colormap', 'blues', 'alpha', .1, 'inverse', 1);`

This command adds a red tinted gradient to the figure as shown below

<img src="./images/with_gradient.png" width="200">
