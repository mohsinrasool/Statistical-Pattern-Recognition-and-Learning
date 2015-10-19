function [  ] = plotData( data, plotTitle )

    % hold the output until all data is plotted
    iClass7 = 0;
    iClass5 = 0;
    iClass2 = 0;
    class7 = [];
    class5 =  [];
    class2 = [];

    hold all;
    for i = 1:size(data,1)
        switch data(i,3)
            case 2
                iClass2 = iClass2 + 1;
                class2(iClass2, 1) = data(i,1);
                class2(iClass2, 2) = data(i,2);
            case 5
                iClass5 = iClass5 + 1;
                class5(iClass5, 1) = data(i,1);
                class5(iClass5, 2) = data(i,2);
            case 7
                iClass7 = iClass7 + 1;
                class7(iClass7, 1) = data(i,1);
                class7(iClass7, 2) = data(i,2);
        end
    end
    
    scatter(class2(:,1), class2(:,2),'+','red');
    scatter(class5(:,1), class5(:,2),'.','green');
    scatter(class7(:,1), class7(:,2),'o','blue');

    % Create xlabel
    xlabel({'Transformed Dimension (X)'});

    % Create ylabel
    ylabel({'Transformed Dimension (Y)'});

    % Create title
    title({plotTitle});

    legend('Class2', 'Class5', 'Class7');
    % hold off and display the fig.
    hold off;
end

