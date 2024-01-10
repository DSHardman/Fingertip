% values taken from toolbox defaults - see powerpoint for raw data
classified = [245 24 20 4 36 100;
    59 175 40 54 59 16;
    56 26 219 42 46 34;
    28 77 50 204 29 11;
    73 74 38 34 129 51;
    139 13 23 14 48 146];

% just classification of centre 4
nclass = zeros(4);
for i = 1:4
    for j = 1:4
        nclass(i,j) = classified(i+1,j+1)/sum(classified(i+1,2:5));
    end
end

heatmap(nclass, "colormap", gray)
clim([0 1])
set(gca, 'fontsize', 15);
set(gcf, 'Position', [488   338   484   420], "color", "w");
grid off
xlabel("Predicted");
ylabel("Actual");