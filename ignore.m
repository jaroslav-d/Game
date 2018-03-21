function output = ignore(input)
if ischar(input)
        switch input
            case '8'
                output = '2';
                return;
            case '6'
                output = '4';
                return;
            case '2'
                output = '8';
                return;
            case '4'
                output = '6';
                return;
            otherwise
                output = input;
                return;
        end
else
    error('Input must be a char, not a %s.',class(input))
end
end