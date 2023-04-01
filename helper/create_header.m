function create_header()

    fid = fopen('audio_sources.h', 'w');
    fprintf(fid, "#ifndef AUDIO_SOURCES_H\n#define AUDIO_SOURCES_H\n\n");

    files = dir('*.txt'); 
    N = length(files); 
    for i = 1:N
        curfile = files(i).name;
        filedata = fread(fopen(curfile, 'r'), '*char')';
        fprintf(fid, "%s\n", filedata);
        
    end

    fprintf(fid, "\n\n#endif");

    fclose(fid);
end