function [  ] = plotData( train, prediction, plotTitle )

    hold all;
   
    scatter(train(:,1), train(:,2),'.','blue');
    scatter(prediction(:,1), prediction(:,2),'.','red');

    % Create xlabel
    xlabel({'Points'});

    % Create ylabel
    ylabel({'Targets'});

    % Create title
    title({plotTitle});

%     legend('Bus (1)', 'Dinosaur (2)', 'Elephant (3)');
    % hold off and display the fig.
    hold off;
end

