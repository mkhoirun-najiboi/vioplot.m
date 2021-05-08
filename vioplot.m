function pltMean=vioplot(data,g,rataan)
hold on
h = violinplot(data,g);
for i = 1:length(h)
    h(i).ScatterPlot.Visible='off';
    h(i).BoxPlot.FaceColor = 'w';
    h(i).BoxPlot.EdgeColor = 'none';
    h(i).BoxPlot.FaceAlpha = 0.6;
    h(i).BoxWidth = 0.1 ;
    h(i).WhiskerPlot.Visible = 'off';
    h(i).MedianPlot.Visible = 'off';
end
xlim([0,13]);grid on;hold on
c=boxplot(data,g,'widths',0.2,'color','k');
getBox=findobj(gcf,'tag','Box');
getUpAdj=findobj(gcf,'tag','Upper Adjacent Value');
getLowAdj=findobj(gcf,'tag','Lower Adjacent Value');
getMed=findobj(gcf,'tag','Median');
getOutliers = findobj(gcf,'tag','Outliers');
for i = 1:length(h)
    getBox(i).LineWidth=1;
    jangkauan(i,1)=max(getBox(i).YData)-min(getBox(i).YData);
    upPos = getUpAdj(i).XData;
    getUpAdj(i).XData = [upPos(1)-0.1,upPos(2)+0.1];
    getUpAdj(i).LineWidth = 2;
    lowPos = getLowAdj(i).XData;
    getLowAdj(i).XData = [lowPos(1)-0.1,lowPos(2)+0.1];
    getLowAdj(i).LineWidth = 2;
    getMed(i).LineWidth=1.3;
    getOutliers(i).Marker='none';
end
jangkauan = flipud(jangkauan);
pltMean=plot(rataan);
pltMean.Marker='.';
pltMean.MarkerSize=20;
pltMean.MarkerEdgeColor='b';
hold off



