function Flagu = stopcall(Flag,Callback)
if isempty(Flag)
    Flagu = '0';
end;
if strcmp(Flag,'p') && ~strcmp(Callback,'p')
    Flagu = '0';
end;
if strcmp(Flag,'p') && strcmp(Callback,'p')
    Flagu = 'p';
end;
end