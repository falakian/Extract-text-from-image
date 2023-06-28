`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:07:00 06/23/2023 
// Design Name: 
// Module Name:    test_readMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test_readMemory(
    );

wire [1919:0] douta ;
reg clk =0;
readMemory testRam(clk,douta);
always #50 clk=~clk ;
initial 
begin
	$display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	#100 $display(douta) ;
	$stop() ;
end

endmodule
