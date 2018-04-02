classdef DialogWindow < handle
    properties
        Dialog
        TextOne
        TextTwo
        TextThree
        QuestionOne
        QuestionTwo
        QuestionThree
        ChoiceOne
        Matrix = ones(1,3);
        CloseGame = '';
    end
    methods
        function Window = DialogWindow(Position,Number)
            Window.Dialog = dialog;
            Window.Dialog.Position = [403 246 250 150];
            if length(Position) == 4 && isnumeric(Position)
                Window.Dialog.Position(1) = Position(3)/2 + Position(1) - Window.Dialog.Position(3)/2;
                Window.Dialog.Position(2) = Position(4)/2 + Position(2) - Window.Dialog.Position(4)/2;
            else
                error('"Figure Properties" --> "Position"')
            end;
            Window.Dialog.Name = 'Lets go Snake';
            
            switch Number
                case 1
                    begin;
                case 2
                    pause;
                case 3
                    ending;
                otherwise
                    error('from 1 to 3')
            end;
            
            function begin
                Window.TextOne = uicontrol;
                Window.TextOne.Parent = Window.Dialog;
                Window.TextOne.Position = [20 100 210 40];
                Window.TextOne.Style = 'text';
                Window.TextOne.String = 'input length snake';
                
                Window.TextTwo = uicontrol;
                Window.TextTwo.Parent = Window.Dialog;
                Window.TextTwo.Position = [20 0 210 90];
                Window.TextTwo.Style = 'text';
                Window.TextTwo.String = {'driving:','left - left arrow',...
                                         'right - right arrow','up - uparrow',...
                                         'down - downarrow','pause - p'};
                
                Window.QuestionOne = uicontrol;
                Window.QuestionOne.Parent = Window.Dialog;
                Window.QuestionOne.Position = [85 90 70 25];
                Window.QuestionOne.Style = 'popup';
                Window.QuestionOne.String = {3,4,5,6,7};
                Window.QuestionOne.Callback = @callback_one;
                
                function callback_one(obj,~)
                    idx = obj.Value;
                    popup_items = obj.String;
                    Window.ChoiceOne = str2double(char(popup_items(idx,:)));
                    Window.Matrix = ones(1,Window.ChoiceOne);
                end
            end
            
            function pause
                Window.TextOne = uicontrol;
                Window.TextOne.Parent = Window.Dialog;
                Window.TextOne.Position = [20 80 210 40];
                Window.TextOne.Style = 'text';
                Window.TextOne.String = 'pause';
                
                Window.QuestionOne = uicontrol;
                Window.QuestionOne.Parent = Window.Dialog;
                Window.QuestionOne.Position = [17 20 90 25];
                Window.QuestionOne.Style = 'pushbutton';
                Window.QuestionOne.String = 'to do';
                Window.QuestionOne.Callback = 'close';
                
                Window.QuestionTwo = uicontrol;
                Window.QuestionTwo.Parent = Window.Dialog;
                Window.QuestionTwo.Position = [142 20 90 25];
                Window.QuestionTwo.Style = 'pushbutton';
                Window.QuestionTwo.String = 'exit game';
                Window.QuestionTwo.Callback = @callback_two;
                
                function callback_two(obj,~)
                    Window.CloseGame = 'close';
                    close(Window.Dialog)
                end
            end
            
            uiwait(Window.Dialog);
        end
    end
end