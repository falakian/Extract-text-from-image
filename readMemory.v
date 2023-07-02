`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:18 06/28/2023 
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
module readMemory( clka , douta);
`include "parameter.h"

input clka ;
output [data_width-1 : 0] douta ;

reg [addr_width -1 : 0] addra  = startAdderss;
reg [addr_width -1 : 0] next_addr = startAdderss;
memoryConfig memory (
  .clka(clka), // input clka
  .addra(addra), // input [14 : 0] addra
  .douta(douta) // output [7 : 0] douta
);


always @(posedge clka)
         addra <= next_addr;
		  
always @(posedge clka)
    begin
        if(addra == {(addr_width-1){1}})
           next_addr =  addra;
        else
            next_addr =  addra+1;
    end

endmodule