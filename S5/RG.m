function RG(fila, col, label)
% Segmentació utilitzant la tècnica Region Growing. Necessita fila, columna
% i el label. 
    global im eti MAXFILA MAXCOL TH seedVal
    
    eti(fila, col) = label;
%     val = im(fila, col, :); en el cas que fem servir el valor del pare no
%     de la llavor. Si l'haguéssim utilitzat hauríem hagut de fer la
%     següent crida sum(imabsdiff(val, pxVal))
    
    fila = fila - 1; % up
    if fila > 0
        if eti(fila, col) == 0 % 0 = no etiquetat
            pxVal = im(fila, col, :);
            if sum(imabsdiff(seedVal, pxVal)) < TH
                eti(fila, col) = label;
                RG(fila, col, label);
            end
        end
    end
    
    fila = fila + 2; % down
    if fila <= MAXFILA
        if eti(fila, col) == 0
            pxVal = im(fila, col, :);
            if sum(imabsdiff(seedVal, pxVal)) < TH
                eti(fila, col) = label;
                RG(fila, col, label);
            end
        end
    end
    
    fila = fila - 1; % fila actual
    col = col - 1; % left
    if col > 0
        if eti(fila, col) == 0
            pxVal = im(fila, col, :);
            if sum(imabsdiff(seedVal, pxVal)) < TH
                eti(fila, col) = label;
                RG(fila, col, label);
            end
        end
    end
    
    col = col + 2; % right
    if col <= MAXCOL
        if eti(fila, col) == 0
            pxVal = im(fila, col, :);
            if sum(imabsdiff(seedVal, pxVal)) < TH
                eti(fila, col) = label;
                RG(fila, col, label);
            end
        end
    end
end