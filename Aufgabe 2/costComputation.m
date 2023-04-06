function [costVals, theta0_grid, theta1_grid] = costComputation(theta0_vals, theta1_vals, obj)
    [theta0_grid, theta1_grid] = meshgrid(theta0_vals, theta1_vals);
    costVals = zeros(length(theta0_vals), length(theta1_vals));
    for i = 1:length(theta0_vals)
        for j = 1:length(theta1_vals)
            obj.setTheta(theta0_vals(i), theta1_vals(j));
            costVals(i, j) = obj.costFunction();
        end
    end
end

