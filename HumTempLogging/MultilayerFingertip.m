figure();

subplot(3,1,1);
plot(conditiontimes, conditions(:, 1));
set(gca, "fontsize", 12);
box off
title("Humidity");
ylabel("Humidity (%)");


subplot(3,1,2);
plot(responsetimes, responses(:, 1:1024));
set(gca, "fontsize", 12);
box off
title("Outer Layer Responses");
ylabel("Raw Value (V)");


subplot(3,1,3);
plot(responsetimes, responses(:, 1025:end));
set(gca, "fontsize", 12);
box off
title("Inner Layer Responses");
ylabel("Raw Value (V)");

set(gcf, 'position', [261   212   886   546], 'color', 'w');

%% overlay figure

figure();

subplot(2,1,1);
yyaxis left
plot(hours(downsample(responsetimes, 30)-responsetimes(1)), downsample(responses(:, keeps), 30), 'color', [0 0 0], 'linewidth', 0.5, 'marker', 'none', 'linestyle', '-');
set(gca, "fontsize", 12);
set(gca,'ycolor','k');
yyaxis right
plot(hours(conditiontimes-conditiontimes(1)), smooth(conditions(:, 1), 100), 'linewidth', 3, 'color', 1/255*[27 158 119]);
set(gca, "fontsize", 12);
box off
set(gca,'ycolor', 1/255*[27 158 119]);
set(gca,'xticklabel',[])
xlim([0 92]);
ylabel("Humidity (%)");
title("Outer Layer");


subplot(2,1,2);
yyaxis left
plot(hours(downsample(responsetimes, 30)-responsetimes(1)), downsample(responses(:, keeps+1024), 30), 'color', [0 0 0], 'linewidth', 0.5, 'marker', 'none', 'linestyle', '-');
set(gca, "fontsize", 12);
ylabel("                                       Response (V)");
set(gca,'ycolor','k');
yyaxis right
plot(hours(conditiontimes-conditiontimes(1)), smooth(conditions(:, 2), 100), 'linewidth', 3, 'color', 1/255*[117 112 179]);
set(gca, "fontsize", 12);
box off
set(gca,'ycolor', 1/255*[117 112 179]);
xlabel("Time (h)");
ylabel("Temperature (^oC)");
ylim([15 30]);
xlim([0 92]); 
title("Inner Layer");

set(gcf,"Position", [227   365   936   380]);