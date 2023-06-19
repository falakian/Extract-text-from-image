`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:59 06/19/2023 
// Design Name: 
// Module Name:    logic 
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
module logic(
input in[height:0][width:0],
output reg out[height:0][width:0]
    );
parameter width = 1920;
parameter height = 1080;
parameter kernel = 51;
parameter percent = 110;
parameter size=(kernel-1)/2;
integer i , j , k , h ,temp;
parameter sw = width + kernel - 1; 
parameter sh = height + kernel - 1;
reg img [sh:0][sw:0];
always
begin
	for(i=0;i<=size;i=i+1)
	begin
		for(j=0;j<=sw ;j=j+1)
		begin
			img[i][j] = 0;
			img[height+size+i][j] = 0;
		end
	end
	
	for(j=0;j<=size;j=j+1)
	begin
		for(i=0;i<=sh ;i=i+1)
		begin
			img[i][j] = 0;
			img[i][width+size+j] = 0;
		end
	end
	
	for(i=0;i<=height;i=i+1)
	begin
		for(j=0;j<=width;j=j+1)
		begin
			img[i+size][j+size] = in[i][j];
		end
	end
end

always
begin
	for(i=size;i<=height+size;i=i+1)
	begin
		for(j=size;j<=width+size;j=j+1)
		begin
			temp=0;
			for(h=i-size;h<=i+size;h=h+1)
			begin
				for(k=j-size;k<=j+size;k=k+1)
				begin
					temp=temp+img[h][k];
				end
			end
			temp=temp/2601;
			if (temp > (img[i][j] * (percent / 100)))
			begin
				out[i][j] = 0;
			end
			else
			begin
				out[i][j] = 1;
			end
		end
	end
end

endmodule
