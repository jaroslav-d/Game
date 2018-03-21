clear;
% % Timer
% Time(1,:) = clock;
% Time(2,:) = clock;
% Delay = 3;
% while Time(2,:) < (Time(1,:) + Delay)
%     Time(2,:) = clock;
% end;
% 
% Coordinate.body.X = Snake.body.XData;
% Coordinate.body.Y = Snake.body.YData;
% Coordinate.head.X = Snake.head.XData;
% Coordinate.head.Y = Snake.head.YData;
% 
% % голова вправо
% Coordinate.body.X = Coordinate.body.X + 1;
% Snake.body.XData = Coordinate.body.X;
% Coordinate.head.X = Coordinate.head.X + 1;
% Snake.head.XData = Coordinate.head.X;
% 
% % голова вправо
% Coordinate.body.X = Coordinate.body.X + 1;
% Snake.body.XData = Coordinate.body.X;
% Coordinate.head.X = Coordinate.head.X + 1;
% Snake.head.XData = Coordinate.head.X;
% 
% % голова вправо
% Coordinate.body.X = Coordinate.body.X + 1;
% Snake.body.XData = Coordinate.body.X;
% Coordinate.head.X = Coordinate.head.X + 1;
% Snake.head.XData = Coordinate.head.X;
% 
% % голова вверх
% Coordinate.body.X = Coordinate.body.X + 1;
% Snake.body.XData = Coordinate.body.X;
% Coordinate.head.X = Coordinate.head.X + 1;
% Snake.head.XData = Coordinate.head.X;

% k = 255;
% LOL = image([k,k,k,0,0;k,k,0,0,0;k,k,k,k,0;0,k,k,k,0]);
% view(270,90)
% colormap gray;

% [x,y] = ginput(4);

% % Timer
% Time(1,:) = clock;
% Time(2,:) = clock;
% Delay = 1;
% while Time(2,:) < (Time(1,:) + Delay)
%     Time(2,:) = clock;
% end;

% [row,col] = find(~Field.CData);
i = 1;
switch i
    case 1
        i = 0;
    otherwise
        i = 2;
end;