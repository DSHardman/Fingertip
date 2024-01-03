normd = normalize(secondresponses(26:107,:), "range", [0, 1]); %, "norm", Inf);
i = 17;
h = heatmap(normd(:,keeps(28*(i)-27:28*(i))).',...
    'XDisplayLabels',NaN*ones(size(normd, 1),1),...
    'YDisplayLabels',NaN*ones(28,1), 'Colormap', gray);
grid off
h.ColorbarVisible = 'off';
set(gcf, 'position', [230   462   918   296]);

% imwrite(normd(:,keeps(28*(i)-27:28*(i))).',"lower25.jpg","jpg");
return

for i = 1:16
    subplot(2,8,i);
    imshow([normd(:,keeps(28*i-27:28*i)).'; normd(:,keeps(28*(i+16)-27:28*(i+16))).']);
    % imshow(normd(:,keeps(28*(i+16)-27:28*(i+16))).');
    title(string(i));
end