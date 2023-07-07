function plotAnimation2(pathCoords)
% animate path points with tale! concurrent.

x = pathCoords(:,1);
y = pathCoords(:,2);

Color='g';

h1=plot(x(1), y(1), 'o', 'MarkerFaceColor', Color, 'MarkerEdgeColor', Color(1,:),'MarkerSize',4);
h2=plot(x(1:2), y(1:2), 'Color', Color,'LineWidth', 2);
pause(0.2)

frame = getframe(gcf);
img =  frame2im(frame);
[img,cmap] = rgb2ind(img,256);
imwrite(img,cmap,'animation.gif','gif','LoopCount',Inf,'DelayTime',1);

for i=2:numel(x)
    
    set(h1, 'XData', x(i))
    set(h1, 'YData', y(i))
    
    set(h2, 'XData', x(i-1:i))
    set(h2, 'YData', y(i-1:i))

    % % New Obstacles
    % if i==4
    %     plot(obstX(i),obstY(i),'ko', 'MarkerSize',5,'MarkerFaceColor','k');
    % end
    
    drawnow
    pause(0.2)
    
    frame = getframe(gcf);
    img =  frame2im(frame);
    [img,cmap] = rgb2ind(img,256);
    imwrite(img,cmap,'animation.gif','gif','WriteMode','append','DelayTime',0.2);
end

end