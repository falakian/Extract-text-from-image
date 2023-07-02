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
module intermediate(  clk , totalData ,inputEnable
    );
`include "parameter.h"
input clk ;
output reg [8*imageheight*imageWidth-1 : 0] totalData ;
output reg inputEnable  ;
wire[data_width-1 : 0] tempOutput ;
readMemory memory(clk , tempOutput);
integer counter = imageheight*imageWidth ;
always@(posedge clk)
begin
	if(counter>0) 
	begin
		{totalData[8*counter-1] , totalData[8*counter-2] , totalData[8*counter-3] , totalData[8*counter-4] , totalData[8*counter-5] ,totalData[8*counter-6] ,totalData[8*counter-7] ,totalData[8*counter-8]} = tempOutput ;
		counter = counter-1  ;
	end
	if(counter==0)
		inputEnable = 1 ;
		
end

endmodule