%% GradientDescentOptimizer: 
% performs the training for a linear regression model
%
% See also: LinearRegressionDataFormatter, LinearRegressionModel
% Author: Marlon Oberberger
% DHBW Stuttgart
% email: inf21109@lehre.dhbw-stuttgart.de
% data: Q2 2023

classdef GradientDescentOptimizer < matlab.mixin.SetGet
    %GRADIENTDESCENTOPTIMIZER 
    % Class to perform the training for a lineare regression Model
      
    properties (Access = private)
        costHistory
        learningRate
        maxIterations
    end
    
    methods (Access = public)
        function obj = GradientDescentOptimizer(varargin)
            %GRADIENTDESCENTOPTIMIZER Construct an instance of this class            
          
            % ========= YOUR CODE HERE =========
            % perform the varargin
            for i = 1:nargin
                if strcmp(varargin{i},'LearningRate')
                    obj.learningRate = varargin{i+1};
                elseif strcmp(varargin{i},'MaxIterations')
                    obj.maxIterations = varargin{i+1};
                end
            end
            
        end

        function h = runTraining(obj, linearRegressionModel)
            [alpha,maxIters,theta,X,y,m,costOverIters] = obj.getLocalsForTraining(linearRegressionModel);
                      
            % ========= YOUR CODE HERE =========
            % loop over theta-update-rule (maxIters):
            for i = 1:maxIters
                % vectorized updaterule can be implemented in one line of code
                theta = theta - (alpha / m) * (X' * (X * theta - y));

                % update theta property of linearRegressionModel (we want to call the cost function in the next step)
                linearRegressionModel.setTheta(theta(1), theta(2));
                % compute current costs and save them to costOverIters
                costOverIters(i) = linearRegressionModel.costFunction();
            end
            
            obj.costHistory = costOverIters;
            linearRegressionModel.setThetaOptimum(theta(1),theta(2));
            h = obj.showTrainingResult();
        end
        
        function h = showTrainingResult(obj)
           h = figure('Name','Costs over Iterations during training');
           plot(obj.costHistory,'x-');
           xlabel('Iterations'); ylabel('costs');
           grid on;
           xlim([2500 obj.maxIterations]);
        end
        
        function setLearningRate(obj, alpha)
           obj.learningRate = alpha;
        end
        
        function setMaxNumOfIterations(obj, maxIters)
            obj.maxIterations = maxIters;
        end
    
    end
    
    methods (Access = private) 
       function [alpha,maxIters,theta,X,y,m,costOverIters] = getLocalsForTraining(obj,linearRegressionModel)
            m = linearRegressionModel.trainingData.numOfSamples;
            theta = linearRegressionModel.theta;
            X = [ones(m,1) linearRegressionModel.trainingData.feature];
            alpha = obj.learningRate;
            y = linearRegressionModel.trainingData.commandVar;
            costOverIters = zeros(obj.maxIterations, 1);
            maxIters = obj.maxIterations;
        end 
    end
end

