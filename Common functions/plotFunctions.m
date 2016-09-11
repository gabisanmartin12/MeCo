%
% Plot function/s 2D in the same window
%
% @params xMin      Represents the left boundary of the domain
% @params xMax      Represents the right boundary of the domain
% @params step      Represents the step to take on the domain
% @params xLabel    Represents the label to x axis.
% @params yLabel    Represents the label to y axis.
% @params plotTitle Represents the title of the figure
% @params gridOn    Represents if the grid must be turned on
% @params holdOn    Represents if there are more than one functions to plot
% @params functions Represents an cell of strings with functions to plot
% @params legends   Represents an cell with the legends to the funcions
%
% @return null
%
function plotFunctions(xMin, xMax, step, xLabel, yLabel, ...
                        plotTitle, gridOn, holdOn, functions, legends)
    
    % Compute the count of functions to plot
    functionsCount = size(functions);
    
    % Compute the domain
    domain = (xMin: step: xMax);
    
    % Should I turn on the grid?
    if gridOn
        grid on;
    end
    
    % Should I turn on the hold?
    if holdOn
        hold on;
    end
    
    % Set global properties
    xlabel(xLabel);
    ylabel(yLabel);
    title(plotTitle);
    
    % Get the colors
    colors = getColors();
    
    % Plot each function
    for i = (1:functionsCount)
        % Get the function and its legend
        fun = functions{i};
        
        % Evaluate the function on the domain
        values = subs(fun, 'x', domain);
        
        % Plot it
        plot(domain, values, colors(i));
    end
    
    % Show the legends
    legend(legends);
end

