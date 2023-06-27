module writing_output_to_binary_file(input reg result[height:0][width:0]);
parameter width = 1920;
parameter height = 1080;
integer i , j;
initial 
    begin
    $fopen("binary-output.bin");
    for (i=0; i<height; i = i+1) 
        begin
            for (j=0; j<width; j=j+1) 
                begin
                    $fwrite("binary-output.bin", "%h ",result[i][j]);
                end
            $fwrite("binary-output.bin", "\n");
        end
    $fclose();
    end
    
endmodule
