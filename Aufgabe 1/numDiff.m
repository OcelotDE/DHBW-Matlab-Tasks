function y = numDiff(func, x, Method)
%numDiff - Calculates the numerical y value using differentials
%
% Syntax:  y = numDiff(func, x, Method)
%
% Inputs:
%    func - The function of which the zeropoint needs to be calculated
%    x - The current x value of which the tangent needs to be calculated
%    Method - The method that is being using to determine y
%
% Outputs:
%    y - The y-value of the calculated tangent's x value
%
% Example: 
%    numDiff(f, 2, 'Forward')
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%

% Author: Marlon Oberberger
% Work address
% email: inf21109@lehre.dhbw-stuttgart.de
% Website: N/A
% March 2023; Last revision: 23-March-2023

%------------- BEGIN CODE --------------

% method selection
switch Method
    case 'Forward'
        h = 10^(-8);
        y = (func(x + h) - func(x)) / h;
    case 'Backward'
        h = 10^(-8);
        y = (func(x) - func(x - h)) / h
    case 'Central'
        h = 10^(-6);
        y = (func(x + h) - func(x - h)) / (2*h)
end

%------------- END OF CODE --------------
end
