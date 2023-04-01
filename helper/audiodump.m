function audiodump(path)
    
    [~, name, ~] = fileparts(path);

    [y, ~] = audioread(path);

    output_file = name + '_array.txt';
    fid = fopen(output_file, 'w');
    
    vol = 300000;

    left_audio = cast((y(:,1) + 1) * vol, "uint32");
    right_audio = cast((y(:,2) + 1) * vol, "uint32");
    
    si = size(left_audio);
    si = si(1);

    fprintf(fid, "u32 %s_size = %d;\n", name, si);

    fprintf(fid, "u32 left_%s_audio[] =\n{", name);
    line_reset_counter = 1;
    for i = 1:si
        if i == si
            fprintf(fid, "%7.f", left_audio(i));
        else
            fprintf(fid, "%7.f, ", left_audio(i));
        end
        if line_reset_counter == 100
            line_reset_counter = 1;
            fprintf(fid,"\n");
        end
        line_reset_counter = line_reset_counter + 1;
    end
    fprintf(fid, "\n};\n");

    fprintf(fid, "\n");

    fprintf(fid, "u32 right_%s_audio[] =\n{", name);
    line_reset_counter = 1;
    for i = 1:si
        if i == si
            fprintf(fid, "%7.f", right_audio(i));
        else
            fprintf(fid, "%7.f, ", right_audio(i));
        end
        if line_reset_counter == 100
            line_reset_counter = 1;
            fprintf(fid,"\n");
        end
        line_reset_counter = line_reset_counter + 1;
    end
    fprintf(fid, "\n};\n");

    fclose(fid);
end