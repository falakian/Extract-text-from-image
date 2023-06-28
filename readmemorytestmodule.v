`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:30:20 06/23/2023
// Design Name:   readMemory
// Module Name:   E:/programing projects/verilog/project/memoryconfig/readmemorytestmodule.v
// Project Name:  memoryconfig
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: readMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module readmemorytestmodule;

	// Inputs
	reg clk;

	// Outputs
	wire [15:0] douta;

	// Instantiate the Unit Under Test (UUT)
	readMemory uut (
		.clk(clk), 
		.douta(douta)
	);
	always begin
		clk = 0;
		#50 clk=~clk ;
				end
	initial begin
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

