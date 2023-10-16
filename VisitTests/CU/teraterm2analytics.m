lines = readlines("bottomlayer.log");
lines = lines(2:end-1);
bottomresponses = [];
for i = 1:length(lines)
    line = char(lines(i));
    try
        bottomresponses = [bottomresponses; str2double(split(line(27:end-2), ", ")).'];
    catch
        ;
    end
end

%%

% [homo, data] = getEITresponse(bottomresponses, 10:12, 65:70); %A
% [homo, data] = getEITresponse(bottomresponses, 31:33, 65:70); %B
% [homo, data] = getEITresponse(bottomresponses, 56:58, 65:70); %C
% [homo, data] = getEITresponse(bottomresponses, 77:79, 65:70); %D
% [homo, data] = getEITresponse(bottomresponses, 99:101, 65:70); %E
[homo, data] = getEITresponse(bottomresponses, 121:123, 65:70); %F


function [homo, data] = getEITresponse(response, rangedata, rangehom)
    data = zeros([1024, 1]);
    homo = zeros([1024, 1]);
    for i = 1:1024
        data(i) = mean(response(rangedata, i));
        homo(i) = mean(response(rangehom, i));
    end
    % Account for different starting electrode
    data = [data(385:end); data(1:384)];
    homo = [homo(385:end); homo(1:384)];
end