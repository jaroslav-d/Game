clear;
% создание окна с заданными параметрами
Figure = figure;
Figure.Color = 'none'; %черный фон
Figure.DockControls = 'on'; %
Figure.MenuBar = 'none';
Figure.Name = 'Snake';
Figure.NumberTitle = 'off';
Figure.ToolBar = 'none';
Figure.Clipping = 'off';
% создание осей
axes
Axes = Figure.Children;
Axes.Position = [0.003,0.005,0.993,0.989];
% создание змеи
Snake.body = plot([1,2.8],[1,1]);
hold on
Snake.head = plot([2.8,3],[1,1]);
Snake.body.LineWidth = 10;
Snake.head.LineWidth = 10;
% настройки осей
Figure.Children.YTickLabel = '';
Figure.Children.XTickLabel = '';
Axes.XLimMode = 'manual';
Axes.YLimMode = 'manual';
Axes.XLim = [0,10];
Axes.YLim = [0,10];
Axes.XColor = [1,1,1];
Axes.YColor = [1,1,1];