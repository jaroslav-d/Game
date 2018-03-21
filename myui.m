function myui()
Figure = figure;
Figure.WindowKeyPressFcn = @pushbutton_callback;
end
function pushbutton_callback(hObject,x)
pause(0.1)
x = hObject.CurrentCharacter;
if x == '2'
    x = '8';
end
display(x);
end
