function GraphicsDump(name, path, maxSize, fOutput)
    im = imread(path);

    [h, w, d] = size(im);

    fprintf(fOutput, "{\n");
    for ii = 1:h
        fprintf(fOutput, "\t");
        for jj = 1:w
            fprintf(fOutput, "0xFF");
            for kk = [3, 2, 1]
                fprintf(fOutput, "%02X", im(ii, jj, kk));
            end
            fprintf(fOutput, ", ");
        end
        fprintf(fOutput, "\n");
    end

    fprintf(fOutput, "\t");
    for ii = (w*h):(maxSize-1)
        % fprintf(fOutput, "0x0, ");
    end

    fprintf(fOutput, "\n},\n");
end