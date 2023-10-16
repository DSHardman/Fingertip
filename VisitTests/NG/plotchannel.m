function plotchannel(n)
    maxhum = 80;
    minhum = 45;

    for i = 1:2436
        [~, hum, letter, responses, ~] = getattempt(i);
        if letter == 'A'
            subplot(3,2,1);
        elseif letter == 'B'
            subplot(3,2,2);
        elseif letter == 'C'
            subplot(3,2,3);
        elseif letter == 'D'
            subplot(3,2,4);
        elseif letter == 'E'
            subplot(3,2,5);
        elseif letter == 'F'
            subplot(3,2,6);
        else
            fprintf("Letter not recognised\n")
        end
        hold on
        map = colormap("winter");
        index = round((hum-45)*7.3);
        plot(responses(:, n), 'color', map(index, :));
    end

    subplot(3,2,1); title("A");
    subplot(3,2,2); title("B");
    subplot(3,2,3); title("C");
    subplot(3,2,4); title("D");
    subplot(3,2,5); title("E");
    subplot(3,2,6); title("F");
    sgtitle(string(n));
end