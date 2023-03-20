function out = DimDump(path)
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

    fprintf("const u16 SpriteWidths[] = \n{\n");
    for ii = 3:fileCount
        fprintf("%u, ", widthList(ii - 2));
    end
    fprintf("\n};\n");

    fprintf("const u16 SpriteHeights[] = \n{\n");
    for ii = 3:fileCount
        fprintf("%u, ", heightList(ii - 2));
    end
    fprintf("\n};\n");
end