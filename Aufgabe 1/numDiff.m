function y = numDiff(func, x, Method)
%FUNCTION_NAME - One line description of what the function or script performs (H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    func - The function of which the zeropoint needs to be calculated
%    x - The current x value of which the tangent needs to be calculated
%
% Outputs:
%    y - The y-value of the calculated tangent's x value
%
% Example: 
%    Line 1 of example
%    Line 2 of example
%    Line 3 of example
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Marlon Oberberger
% Work address
% email: inf21109@lehre.dhbw-stuttgart.de
% Website: N/A
% March 2023; Last revision: 12-May-2004

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
