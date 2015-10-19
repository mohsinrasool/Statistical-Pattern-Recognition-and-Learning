function [  ] = plotData( data )

    % hold the output until all data is plotted
    hold all;
    for i = 1:size(data,1)
        if data(i,3) == 0
            scatter(data(i,1),data(i,2),'+','red'); 
        else
            scatter(data(i,1),data(i,2),'.','green'); 
        end
    end
    
    % hold off and display the fig.
    hold off;
end

