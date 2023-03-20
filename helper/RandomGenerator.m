function RandomGenerator()
    randNums = randi(2^32 - 1, 16);

    for ii = 1:16
        for jj = 1:16
            fprintf( "0x%08X, ", randNums(ii, jj) );
        end
        fprintf("\n");
    end
end