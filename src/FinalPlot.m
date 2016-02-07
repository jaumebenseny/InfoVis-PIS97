% Load saved figures
c=hgload('motivation.fig');
k=hgload('results.fig');
d= hgload('tasks.fig');
% Prepare subplots
figure
h(1)=subplot(3,1,1);
h(2)=subplot(3,2,2);
h(3)=subplot(3,2,3);
% Paste figures on the subplots
copyobj(allchild,c,h(1));
copyobj(allchild,k,h(2));
copyobj(allchild,d,h(3));
% Add legends
l(1)=legend(h(1),'Motivation')
l(2)=legend(h(2),'Searches')
l(3)=legend(h(3),'Results')