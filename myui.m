function myui()
Figure = figure;
Figure.WindowKeyPressFcn = @pushbutton_callback;
end
function pushbutton_callback(hObject,x)
pause(0.1)
y = x.Key;
display(y)
end
