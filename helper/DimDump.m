function out = DimDump(path, fOutput)
    listings = dir(path);
    fileCount = length(listings);
    widthList = zeros(fileCount - 2, 1);
    heightList = zeros(fileCount - 2, 1);

    out = 0;

    for ii = 3:fileCount
        im = imread(path + "/" + listings(ii).name);
        [h, w, d] = size(im);

        widthList(ii - 2) = w;
        heightList(ii - 2) = h;

        if w*h > out
            out = w*h;
        end
    end

    fprintf(fOutput, "const u16 SpriteWidths[] = \n{\n");
    for ii = 3:fileCount
        fprintf(fOutput, "%u, ", widthList(ii - 2));
    end
    fprintf(fOutput, "\n};\n");

    fprintf(fOutput, "const u16 SpriteHeights[] = \n{\n");
    for ii = 3:fileCount
        fprintf(fOutput, "%u, ", heightList(ii - 2));
    end
    fprintf(fOutput, "\n};\n");
end