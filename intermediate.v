`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:32 06/28/2023 
// Design Name: 
// Module Name:    intermediate 
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
module intermediate(  clk , totalData
    );
parameter data_width = 8;
parameter imageWidth = 131 ;
parameter imageheight = 185 ;
input clk ;
output reg [8*imageheight*imageWidth-1 : 0] totalData ;
wire[data_width-1 : 0] tempOutput ;
readMemory memory(clk , tempOutput);
integer counter = imageheight*imageWidth ;
always@(posedge clk)
begin
	if(counter>0)
	begin
		totalData[8*counter-1:8*counter-8] = tempOutput ;
		counter = counter-1  ;
	end
		
end

endmodule
