function FolderDump(path, fOutput)
    file = fopen(fOutput, 'w');

    listings = dir(path);

    fileCount = length(listings);

    nameList = strings(fileCount - 2, 1);

    fprintf(file, "#ifndef SPRITES_H\n");
    fprintf(file, "#define SPRITES_H\n\n");
    fprintf(file, '#include "xil_types.h"\n\n');
    fprintf(file, "namespace snake\n{\n");
    fprintf(file, "namespace sprites\n{\n");

    maxSize = DimDump(path, file);

    % skip "./" and "../"
    fprintf(file, "const u32 GraphicsData[][%u] = \n{\n", maxSize);
    for ii = 3:fileCount
        nameLen = length(listings(ii).name);
        spriteName = listings(ii).name(1:(nameLen-4));
        nameList(ii - 2) = spriteName;
        GraphicsDump(spriteName, path + "/" + listings(ii).name, maxSize, file);
    end
    fprintf(file, "};\n");

    fprintf(file, "\n\nenum SpriteIndex\n{\n");
    fprintf(file, "__ENUM_START__,\n");
    fprintf(file, "%s = __ENUM_START__,\n", nameList(1));
    for ii = 2:(fileCount - 2)
        fprintf(file, "%s,\n", nameList(ii));
    end
    fprintf(file, "__ENUM_END__,\n");
    fprintf(file, "};\n");

    fprintf(file, "}\n");
    fprintf(file, "}\n\n");
    fprintf(file, "#endif // SPRITES_H\n");

    flose(file);
end