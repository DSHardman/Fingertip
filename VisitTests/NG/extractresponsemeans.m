function responsemeans = extractresponsemeans(responses, channel)
    responsemeans = zeros([5, 1]);
    for i = 1:5
        responsemeans(i) = mean(responses(i*10-9:i*10, channel));
    end
end