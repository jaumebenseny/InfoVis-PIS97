load Motivation
figure
%%
%bars
n = 9;
bars = {};
labels1 = {};
for i = 1:n
    bars{i,1} = sum(cell2mat(Motivation(:,1+i)))/size(Motivation(:,1),1)*100;  
    if(i == 1) bars{i,2} = 'Convinience';
    elseif(i == 2) bars{i,2} = 'Customer opinions';
    elseif(i == 3) bars{i,2} = 'No pressure';
    elseif(i == 4) bars{i,2} = 'Not applicable';
    elseif(i == 5) bars{i,2} = 'Other';
    elseif(i == 6) bars{i,2} = 'Personalized';
    elseif(i == 7) bars{i,2} = 'Reviews';
    elseif(i == 8) bars{i,2} = 'Save time';
    elseif(i == 9) bars{i,2} = 'Vendor info';
    end    
end
%
B = sortrows(bars,1);
%
subplot(1,2,2)
h = bar(1:n,cell2mat(B(:,1)),0.7);
%
yb = cat(1, h.YData); 
xb = bsxfun(@plus, h(1).XData, [h.XOffset]');
hold on;
for i = 1:size(xb,2)  
    %text(xb(i),yb(i)-6, sprintf('%2.1f%%',yb(i)),'color','w','Fontsize',7);
    text(xb(i),yb(i)-9, sprintf('%2.1f%%',yb(i)),'color','w');
    text(xb(i),yb(i)+0.5, B{i,2});
end
set(gca,'cameraupvector',[1 0 0])
axis ij
axis([0 10 0 100])
title('Reasons for using the web')
set(gca, 'visible', 'off') ;
%
%stem(1:n, sort(cell2mat(bars)), 'filled')

%%
%treemap
column = getColValues(Motivation(:,1));
n = size(column,1);
data = cell2mat(column(:,2)');

% Add labels
labels2 = {};
for i = 1:n
    labels2{i} = sprintf('%s\n%2.1f%%',column{i,1},100*data(i)/sum(data));
end

%cla
subplot(1,2,1)
%colors = (jet(n)+1)/2;
colormap winter;
cmap = colormap;
for i = 1:n
    colors(i,:) = cmap(i*8,:);
end
rectangles = treemap(data);
plotRectangles(rectangles,labels2,colors)
outline(rectangles)
%axis([-0.01 1.01 -0.01 1.01])
title('Intentional searches?')
