`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:53:15 06/23/2023 
// Design Name: 
// Module Name:    readMemory 
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
module readMemory(clk,douta);
parameter addr_width =4;
parameter data_width = 16;
input clk;
reg [addr_width-1:0] addra = 0 ;
output  [data_width-1:0] douta;
reg [addr_width-1:0] addr_next;
memoryconfiguration memory (
  .clka(clk), // input clka
  .addra(addra), // input [10 : 0] addra
  .douta(douta) // output [1079 : 0] douta
);
 always @(posedge clk)       //whenever there is a sequential block we can use non blocking assignment
         addra <= addr_next;
		  
always @(*)
    begin
        if(addra == {(addr_width-1){1}})
           addr_next =  addra;
        else
            addr_next =  addra+1;
    end
	 
endmodule

