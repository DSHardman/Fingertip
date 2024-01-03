electrodepositions = [36 12;
    36 8;
    36 4;
    36 0;
    32 0;
    28 0;
    24 0;
    20 0;
    16 0;
    12 0;
    8 0;
    4 0;
    0 0;
    0 4;
    0 8;
    0 12;
    0 16;
    0 20;
    0 24;
    0 28;
    4 28;
    8 28;
    12 28;
    16 28;
    20 28;
    24 28;
    28 28;
    32 28;
    36 28;
    36 24;
    36 20;
    36 16];

% delectrodepositions = zeros([32, 2]);
% for i = 1:16
%     delectrodepositions(i*2-1, :) = electrodepositions(i*2, :);
%     delectrodepositions(i*2, :) = electrodepositions(i*2-1, :);
% end

distances = zeros([32 1]);
for i = 1:16
    distances(i) = sqrt((electrodepositions(i,1)-electrodepositions(i+16,1))^2 +...
        (electrodepositions(i,2)-electrodepositions(i+16,2))^2);
    distances(33-i) = distances(i);
end
recipdistances = 1./distances;

summedresponse = zeros([32, 1]);
for i = 1:32
    sum = 0;
    for j = 1:28
        % sum = sum + max(bottomresponses(73:82, keeps(j+(i-1)*28))) -...
        %     min(bottomresponses(73:82, keeps(j+(i-1)*28)));
        % sum = sum + mean(bottomresponses(1:10, keeps(j+(i-1)*28)));
        sum = sum + (max(bottomresponses(:, keeps(j+(i-1)*28))) -...
            min(bottomresponses(:, keeps(j+(i-1)*28))))/...
            mean(bottomresponses(1:10, keeps(j+(i-1)*28)));
    end
    summedresponse(i) = sum;
end

subplot(2,1,1);
plot(recipdistances);
subplot(2,1,2);
plot(summedresponse);