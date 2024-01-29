% % Visualise key channels 
% [coeff,score,latent,tsquared,explained, mu] = pca(responses(:, 1:928));
% heatmap(reshape([coeff(:,1)], [29 32]).');

n = 1; % How many of the first PCA channels to average over
repetitions = 20; % Repetitions for each quantity

quantity = [1:1:5 10:10:928]; % Locations to test
errors = zeros([length(quantity), repetitions]); % Store solutions here


for i = 1:length(quantity)
    quantity(i) % Print current location
    for j = 1:repetitions
        % Random location of 500 consecutive conditions used as test data
        startindex = randi(size(responses, 1)-501) + 1;
        trainresponses = responses([1:startindex-1 startindex+500:end], 1:928);
        testresponses = responses(startindex:startindex+499, 1:928);
        trainhums = intconditions([1:startindex-1 startindex+500:end], 1);
        testhums = intconditions(startindex:startindex+499, 1);

        % Calculate PCA coefficients & rank relative order
        [coeff,score,latent,tsquared,explained, mu] = pca(trainresponses);
        [~,ranking] = sort(mean(coeff(:,1:n), 2), 'descend');

        % mldivide best fit
        humfit = trainresponses(:, ranking(1:quantity(i)))\trainhums;
    
        % Save resulting mean error
        predictions = testresponses(:, ranking(1:quantity(i)))*humfit;
        errors(i, j) = mean(abs(predictions-testhums));
    end
end

% Plot trade-off graph
plot(quantity, mean(errors, 2));

%% 
load("HumidityPCAErrors.mat");
addplot(errors, quantity, 'b');
% hold on
% load("Temperature2PCAErrors.mat");
% addplot(errors, quantity, 'g');

% load("TemperaturePCAErrors.mat");

function addplot(errors, quantity, col)
    plot(quantity, mean(errors, 2));
    
    x2 = [quantity, fliplr(quantity)];
    inBetween = [mean(errors.')-std(errors.'),...
        fliplr(mean(errors.')+std(errors.'))];
    fill(x2, inBetween, col, 'linestyle', 'none', 'FaceAlpha', 0.5);
    
    hold on
    plot(quantity, mean(errors, 2), 'linewidth', 2, 'color', 'k');
    box off
    set(gca, 'linewidth', 2, 'fontsize', 15);
    xlim([0 928]);
    xlabel("Number of combinations");
    ylabel("Average Error (% RH)");
    
    set(gcf, 'position', [335   458   864   300]);
end