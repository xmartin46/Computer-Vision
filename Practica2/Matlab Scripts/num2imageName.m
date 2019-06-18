function [name] = num2imageName(num)
    switch num
        case 0
            name = 'BotodOr';
        case 1
            name = 'Buixol';
        case 2
            name = 'Crocus';
        case 3
            name = 'DentdeLleo';
        case 4
            name = 'Fadrins';
        case 5
            name = 'Fritillaria';
        case 6
            name = 'Gerbera';
        case 7
            name = 'Girasol';
        case 8
            name = 'Hemerocallis';
        case 9
            name = 'Lliri';
        case 10
            name = 'Narcis';
        case 11
            name = 'Viola';
        otherwise
            name = -1;
    end
end