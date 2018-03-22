clear;
% создание окна с заданными параметрами
Figure = figure;
Figure.Color = 'none'; %черный фон
Figure.DockControls = 'on';
Figure.MenuBar = 'none';
Figure.Name = 'Snake';
Figure.NumberTitle = 'off';
Figure.ToolBar = 'none';
Figure.Clipping = 'off';
% создание осей
axes
Axes = Figure.Children;
Axes.Position = [0.003,0.005,0.993,0.989];
% создание поля
mymap = [0 0 0
    1 0 0
    0 1 0
    0 0 1
    1 1 1];
Field = image(ones(25)*255);
view(270,90)
% colormap(mymap)
% colormap colorcube;
Field.CDataMapping = 'scaled';
% настройки осей
Figure.Children.YTickLabel = '';
Figure.Children.XTickLabel = '';
Axes.XLimMode = 'manual';
Axes.YLimMode = 'manual';
Axes.XLim = [0,26];
Axes.YLim = [0,26];
Axes.Color = [0,0,0];
Axes.XColor = [0,0,0];
Axes.YColor = [0,0,0];
Figure.WindowKeyPressFcn = @myfun;

%%
DW = DialogWindow(Figure.Position,1);
Snake.Color = DW.Matrix;

Earth = 255;
Body = 127;
Head = 0;
Apple = 191;
Snake.Color(:) = Body;
Snake.Color(1) = Head;
Snake.LenBody = length(Snake.Color);

right = 0;
while right == 0
    PointOX = randi([1 25]);
    PointOY = randi([1 25]);
    if (PointOY-Snake.LenBody) >= 1
        for i = 1:Snake.LenBody
            Field.CData(PointOX,PointOY-i) = Snake.Color(i);
            Snake.Coordinate(:,i) = [PointOX,PointOY-i];
        end;
        right = 1;
    else
        right = 0;
    end;
end;
Field.CData(randi([1 25]),randi([1 25])) = Apple;


Figure.Children.XTickLabel = 'numpad8';
PrevButton = ignore('numpad8');
pause(2)
Delay = 0;
ii = '';
while ~strcmp('game over',ii)
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    pause(0.2-Delay)
    if strcmpi(Figure.Children.XTickLabel,'p')
        DW = DialogWindow(Figure.Position,2);
        Figure.Children.XTickLabel = '0';
        if strcmp(DW.CloseGame,'close')
            close(Figure);
            break;
        end;
    end;
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    tic
    PointOX = Snake.Coordinate(1,Snake.LenBody);
    PointOY = Snake.Coordinate(2,Snake.LenBody);
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    for i = 0:Snake.LenBody-2
        Snake.Coordinate(1,Snake.LenBody-i) = Snake.Coordinate(1,Snake.LenBody-i-1);
        Snake.Coordinate(2,Snake.LenBody-i) = Snake.Coordinate(2,Snake.LenBody-i-1);
    end;
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    vectorX = Snake.Coordinate(1,2)-Snake.Coordinate(1,3);
    vectorY = Snake.Coordinate(2,2)-Snake.Coordinate(2,3);
    NextButton = Figure.Children.XTickLabel;
%     disp(NextButton)
    if strcmp(NextButton,PrevButton)
        NextButton = '0';
    end;
%     disp(NextButton)
    switch NextButton
        case 'numpad8'
            Snake.Coordinate(2,1) = Snake.Coordinate(2,1) + 1;
%             disp('8')
        case 'numpad6'
            Snake.Coordinate(1,1) = Snake.Coordinate(1,1) + 1;
%             disp('6')
        case 'numpad2'
            Snake.Coordinate(2,1) = Snake.Coordinate(2,1) - 1;
%             disp('2')
        case 'numpad4'
            Snake.Coordinate(1,1) = Snake.Coordinate(1,1) - 1;
%             disp('4')
        otherwise
            Snake.Coordinate(1,1) = Snake.Coordinate(1,2) + vectorX;
            Snake.Coordinate(2,1) = Snake.Coordinate(2,2) + vectorY;
            NextButton = '0';
%             disp('nothing')
    end;
    if ~strcmp('0',NextButton)
    PrevButton = ignore(NextButton);
    end;
%     disp(strcat('prev ',PrevButton));
    if Snake.Coordinate(1,1) > 25 || Snake.Coordinate(2,1) > 25 || ...
            Snake.Coordinate(1,1) < 1 || Snake.Coordinate(2,1) < 1
        ii = 'game over';
        break;
    end;
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    switch Field.CData(Snake.Coordinate(1,1),Snake.Coordinate(2,1))
        case Body
            ii = 'game over_2';
            break;
        case Apple
            Snake.LenBody = Snake.LenBody + 1;
            Snake.Color(Snake.LenBody) = Body;
            Snake.Coordinate(1,Snake.LenBody) = PointOX;
            Snake.Coordinate(2,Snake.LenBody) = PointOY;
            while Field.CData(PointOX,PointOY) == Body || Field.CData(PointOX,PointOY) == Head 
            PointOX = randi([1 25]);
            PointOY = randi([1 25]);
            end;
            Field.CData(PointOX,PointOY) = Apple;
        otherwise
            Field.CData(PointOX,PointOY) = Earth;
    end;
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    for i = 1:Snake.LenBody
        PointOX = Snake.Coordinate(1,i);
        PointOY = Snake.Coordinate(2,i);
        Field.CData(PointOX,PointOY) = Snake.Color(i);
    end;
%     disp(strcat('ZTick',Figure.Children.ZTickLabel))
    Delay = toc;
end;
