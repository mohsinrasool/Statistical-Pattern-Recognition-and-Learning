function [  ] = plotData( data, plotTitle )

    % hold the output until all data is plotted
    iClass1 = 0;
    iClass2 = 0;
    iclass3 = 0;
    class1 = [];
    class2 = [];
    class3 =  [];

    hold all;
    for i = 1:size(data,1)
        switch data(i,3)
            case 1
                iClass1 = iClass1 + 1;
                class1(iClass1, 1) = data(i,1);
                class1(iClass1, 2) = data(i,2);
            case 2
                iClass2 = iClass2 + 1;
                class2(iClass2, 1) = data(i,1);
                class2(iClass2, 2) = data(i,2);
            case 3
                iclass3 = iclass3 + 1;
                class3(iclass3, 1) = data(i,1);
                class3(iclass3, 2) = data(i,2);
        end
    end
    
    scatter(class1(:,1), class1(:,2),'o','blue');
    scatter(class2(:,1), class2(:,2),'+','red');
    scatter(class3(:,1), class3(:,2),'.','black');

    % Create xlabel
    xlabel({'X-axis'});

    % Create ylabel
    ylabel({'Y-axis'});

    % Create title
    title({plotTitle});

    legend('Bus (1)', 'Dinosaur (2)', 'Elephant (3)');
    % hold off and display the fig.
    hold off;
end

