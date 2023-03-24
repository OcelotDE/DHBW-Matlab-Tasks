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
 
myNewton('function', @myPoly) % calc without derivative func

myNewton('function', @myPoly, 'derivative', @dmyPoly) % calc with derivative func

%------------- END OF CODE --------------