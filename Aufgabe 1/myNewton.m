function [xZero, abortFlag, iters] = myNewton(varargin)
%myNewton - Calculates the zeropoint for a given function
%
% Syntax:  [xZero, abortFlag, iters] = myNewton('function', func, 'derivative', dfunc, 'startValue', x0, 'maxIter', maxIter, 'feps', feps, 'xeps', xeps, 'livePlot', livePlot)
%
% Inputs:
%    function - a function for the zeropoint to be calculated
%    derivative (optional) - the derivative function to the given function
%    startValue (optional) - the starting value for the newton algorithm
%    maxIter (optional) - maximum interation value for the newton algorithm
%    feps (optional) - tolerance for the function value
%    xeps (optional) - tolerance for the change in the root estimate
%    livePlot (optional) - wheter a plot should be drawn or not
%
% Outputs:
%    xZero - zeropoint of a given function
%    abortFlag - wheter the iteration got aborted and the reason for it
%    iters - amount of iterations
%
% Example: 
%    myNewton('function', @myPoly)
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

%% do the varargin
for i = 1:nargin
    if strcmp(varargin{i},'function')
        func = varargin{i+1};
    elseif strcmp(varargin{i},'derivative')
        dfunc = varargin{i+1};
    elseif strcmp(varargin{i},'startValue')
        x0 = varargin{i+1};
    elseif strcmp(varargin{i},'maxIter')
        maxIter = varargin{i+1};
    elseif strcmp(varargin{i},'feps')
        feps = varargin{i+1};
    elseif strcmp(varargin{i},'xeps')
        xeps = varargin{i+1};
    elseif strcmp(varargin{i},'livePlot')
        livePlot = varargin{i+1};   
    end
end

%% check for necessary parameters
if ~exist('func','var')
    error('No valid function');
end
    
if ~exist('x0','var')
    x0 = 0;
    disp(['Using default startvalue: x0 = ',num2str(x0)]);
end

if ~exist('maxIter','var')
    maxIter = 50;
    disp(['Using default maximum iterations: maxIter = ',num2str(maxIter)]);
end

if ~exist('feps','var')
    feps = 1e-6;
    disp(['Using default Feps: feps = ',num2str(feps)]);
end

if ~exist('xeps','var')
    xeps = 1e-6;
    disp(['Using default Xeps: xeps = ',num2str(xeps)]);
end

if ~exist('livePlot','var')
    livePlot = 'off';
    disp(['Using default live Plot: livePlot = ','off']);
end

if ~exist('dfunc', 'var')
    %% differential procedure selection once

        method = questdlg('Choose a method', ...
	        'Differential procedure menu', ...
	        'Forward', 'Backward', 'Central', 'Central');
end

%% start of algorithm
if strcmp(livePlot,'on')
   h = figure('Name','Newton visualization');
   ax1 = subplot(2,1,1);
   plot(ax1,0,x0,'bo');
   ylabel('xValue');
   hold on;
   grid on;
   xlim('auto')
   ylim('auto')
   ax2 = subplot(2,1,2);
   semilogy(ax2,0,func(x0),'rx');
   xlabel('Number of iterations')
   ylabel('Function value');
   hold on;
   grid on;
   xlim('auto')
   ylim('auto')
end
xOld = x0;
abortFlag = 'maxIter';
for i = 1:maxIter
    f = func(xOld);
    if abs(f) < feps
        abortFlag = 'feps';
        break;
    end
    if exist('dfunc', 'var')
        df = dfunc(xOld);
    else
        df = numDiff(func, xOld, method);
    end
    if df == 0
        abortFlag = 'df = 0';
        break;
    end
    xNew = xOld - f/df; 
    if abs(xNew-xOld) < xeps
        abortFlag = 'xeps';
        break;
    end
    xOld = xNew;
    if strcmp(livePlot,'on')
       plot(ax1,i,xNew,'bo');
       semilogy(ax2,i,func(xNew),'rx');
       pause(0.05);
    end
end
iters = i;
xZero = xNew;
end

%------------- END OF CODE --------------