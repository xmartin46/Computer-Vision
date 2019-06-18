function [num] = imageName2num(string)
    switch string
        case "BotodOr"
            num = 0;
        case "Buixol"
            num = 1;
        case "Crocus"
            num = 2;
        case "DentdeLleo"
            num = 3;
        case "Fadrins"
            num = 4;
        case "Fritillaria"
            num = 5;
        case "Gerbera"
            num = 6;
        case "Girasol"
            num = 7;
        case "Hemerocallis"
            num = 8;
        case "Lliri"
            num = 9;
        case "Narcis"
            num = 10;
        case "Viola"
            num = 11;
        otherwise
            num = 0;
    end
end