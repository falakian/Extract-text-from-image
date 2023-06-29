module writing_output_to_binary_file(input reg result[height*width*8:0);
parameter width = 1920;
parameter height = 1080;
integer i ;
initial 
    begin
    $fopen("binary-output.bin");
    for (i=0; i<height*width*8; i= i+1) 
        begin
            $fwrite("binary-output.bin", "%h ",result[i][j]);
        end
    $fclose();
    end
    
endmodule
