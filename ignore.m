function output = ignore(input)
if ischar(input)
        switch input
            case 'numpad8'
                output = 'numpad2';
                return;
            case 'numpad6'
                output = 'numpad4';
                return;
            case 'numpad2'
                output = 'numpad8';
                return;
            case 'numpad4'
                output = 'numpad6';
                return;
            otherwise
                output = input;
                return;
        end
else
    error('Input must be a char, not a %s.',class(input))
end
end