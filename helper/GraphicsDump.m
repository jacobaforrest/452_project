function GraphicsDump(name, path, maxSize)
    im = imread(path);

    [h, w, d] = size(im);

    fprintf("{\n");
    for ii = 1:h
        fprintf("\t");
        for jj = 1:w
            fprintf("0xFF");
            for kk = [3, 2, 1]
                fprintf("%02X", im(ii, jj, kk));
            end
            fprintf(", ");
        end
        fprintf("\n");
    end

    fprintf("\t");
    for ii = (w*h):(maxSize-1)
        % fprintf("0x0, ");
    end

    fprintf("\n},\n");
end