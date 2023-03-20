function FolderDump(path)
    listings = dir(path);

    fileCount = length(listings);

    nameList = strings(fileCount - 2, 1);

    
    maxSize = DimDump(path);

    % skip "./" and "../"
    fprintf("const u32 GraphicsData[][%u] = \n{\n", maxSize);
    for ii = 3:fileCount
        nameLen = length(listings(ii).name);
        spriteName = listings(ii).name(1:(nameLen-4));
        nameList(ii - 2) = spriteName;
        GraphicsDump(spriteName, path + "/" + listings(ii).name, maxSize);
    end
    fprintf("};\n");

    fprintf("\n\nenum SpriteIndex\n{\n");
    fprintf("__ENUM_START__,\n");
    fprintf("%s = __ENUM_START__,\n", nameList(1));
    for ii = 2:(fileCount - 2)
        fprintf("%s,\n", nameList(ii));
    end
    fprintf("__ENUM_END__,\n");
    fprintf("};\n")
end