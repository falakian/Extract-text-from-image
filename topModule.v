`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:06 07/01/2023 
// Design Name: 
// Module Name:    topModule 
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
module topModule( clk
    );
`include "parameter.h"
input clk ; //system clk??
wire [8*imageheight*imageWidth-1 : 0] totalData ;
wire [8*imageheight*imageWidth-1 : 0] processedData ;
wire inputEnable ;
reg reset = 0 ; //push button
reg endSign = 0 ;//LED
reg [data_width-1 : 0] Data_in ;
wire clk_5MHZ ; //use clock divider
wire [7:0] red,green,blue ;
wire hsync,vsync ;
intermediate inter_ins(clk , totalData ,inputEnable);
logic1 logic_ins( .myin(totalData) , .myout(processedData) );
vga_controller vga_ins(clk,reset,Data_in,clk_5MHZ ,red,green,blue,hsync,vsync);
integer counter = imageheight*imageWidth ;
always@(posedge clk)
begin

	if(inputEnable==1)
	begin
		//if(finish logic == 1 )
		if(counter>0)
		begin
			counter = counter - 1 ;
			Data_in = {processedData[8*counter-1] ,processedData[8*counter-2] ,processedData[8*counter-3] ,processedData[8*counter-4] ,processedData[8*counter-5] , processedData[8*counter-6] , processedData[8*counter-7] , processedData[8*counter-8]} ;//clk should be 5mhz
		end
		else
			endSign = 1 ;
	end

end

endmodule