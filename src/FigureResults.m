load results
figure
%%
%bars
n = 7;
bars = {};
labels1 = {};
for i = 1:n
    bars{i,1} = sum(cell2mat(results(:,i)))/size(results(:,1),1)*100;  
    if(i == 1) bars{i,2} = 'Confusing';
    elseif(i == 2) bars{i,2} = 'Coud not find';
    elseif(i == 3) bars{i,2} = 'No';
    elseif(i == 4) bars{i,2} = 'Obnoxious';
    elseif(i == 5) bars{i,2} = 'Other';
    elseif(i == 6) bars{i,2} = 'Poor design';
    elseif(i == 7) bars{i,2} = 'Too slow';
    end    
end
%
B = sortrows(bars,1);
%
subplot(1,2,2)
h = bar(1:n,cell2mat(B(:,1)),0.6);
%
yb = cat(1, h.YData); 
xb = bsxfun(@plus, h(1).XData, [h.XOffset]');
hold on;
for i = 1:size(xb,2)  
    %text(xb(i),yb(i)-6, sprintf('%2.1f%%',yb(i)),'color','w','Fontsize',7);
    text(xb(i),yb(i)-8, sprintf('%2.1f%%',yb(i)),'color','w');
    text(xb(i),yb(i)+0.5, B{i,2});
end
set(gca,'cameraupvector',[1 0 0])
axis ij
axis([0 8 0 100])
set(gca, 'visible', 'off') ;
%
title('Reasons for dissatisfying experiences')
%%
%treemap
column = getColValues(results(:,8));
n = size(column,1);
data = cell2mat(column(:,2)');

labels3 = {};
for i = 1:n
    labels3{i} = sprintf('%s\n%2.1f%%',column{i,1},100*data(i)/sum(data));
end

colormap autumn;
cmap = colormap;
for i = 1:n
    colors(i,:) = cmap(i*8,:);
end

subplot(1,2,1)
rectangles = treemap(data);
plotRectangles(rectangles,labels3,colors)
outline(rectangles)
title('Success Rate')


