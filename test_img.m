Earth = 255;
Body = 127;
Head = 0;
Apple = 191;
Snake.Color = [Head,Body,Body,Body,Body];
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

pause(2)
TimeOut = 0;
ii = '';
Figure.CurrentCharacter = '8';
while ~strcmp('game over',ii)
    pause(0.2-TimeOut)
    tic
    PointOX = Snake.Coordinate(1,Snake.LenBody);
    PointOY = Snake.Coordinate(2,Snake.LenBody);
    for i = 0:Snake.LenBody-2
        Snake.Coordinate(1,Snake.LenBody-i) = Snake.Coordinate(1,Snake.LenBody-i-1);
        Snake.Coordinate(2,Snake.LenBody-i) = Snake.Coordinate(2,Snake.LenBody-i-1);
    end;
    vectorX = Snake.Coordinate(1,2)-Snake.Coordinate(1,3);
    vectorY = Snake.Coordinate(2,2)-Snake.Coordinate(2,3);
    switch Figure.CurrentCharacter
        case '8'
            Snake.Coordinate(2,1) = Snake.Coordinate(2,1) + 1;
        case '6'
            Snake.Coordinate(1,1) = Snake.Coordinate(1,1) + 1;
        case '2'
            Snake.Coordinate(2,1) = Snake.Coordinate(2,1) - 1;
        case '4'
            Snake.Coordinate(1,1) = Snake.Coordinate(1,1) - 1;
        case ''
            pause(10)
        otherwise
            Snake.Coordinate(1,1) = Snake.Coordinate(1,2) + vectorX;
            Snake.Coordinate(2,1) = Snake.Coordinate(2,2) + vectorY;
    end;
    if Snake.Coordinate(1,1) > 25 || Snake.Coordinate(2,1) > 25 || ...
            Snake.Coordinate(1,1) < 1 || Snake.Coordinate(2,1) < 1
        ii = 'game over';
        break;
    end;
    switch Field.CData(Snake.Coordinate(1,1),Snake.Coordinate(2,1))
        case Body
            ii = 'game over';
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
    for i = 1:Snake.LenBody
        PointOX = Snake.Coordinate(1,i);
        PointOY = Snake.Coordinate(2,i);
        Field.CData(PointOX,PointOY) = Snake.Color(i);
    end;
    TimeOut = toc;
end;
