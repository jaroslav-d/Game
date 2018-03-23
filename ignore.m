function output = ignore(input)
if ischar(input)
        switch input
            case 'uparrow'
                output = 'downarrow';
                return;
            case 'rightarrow'
                output = 'leftarrow';
                return;
            case 'downarrow'
                output = 'uparrow';
                return;
            case 'leftarrow'
                output = 'rightarrow';
                return;
            otherwise
                output = input;
                return;
        end
else
    error('Input must be a char, not a %s.',class(input))
end
end