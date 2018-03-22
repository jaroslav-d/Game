function myui()
Figure = figure;
Figure.WindowKeyPressFcn = @pushbutton_callback;
end
function pushbutton_callback(hObject,x)
pause(0.1)
hObject.y = x.Key;
end