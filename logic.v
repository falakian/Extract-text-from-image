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
module logic1(
input [0:71]myin,
output reg [0:71]myout
);
parameter width = 3;
parameter height = 3;
parameter kernel = 3;
parameter percent = 110;
parameter size=(kernel-1)/2;
reg [0:7]tmp,tmp1;
integer i , j , k , h , s, l, temp;
//parameter sw = width + kernel - 1; 
//parameter sh = height + kernel - 1;
//reg img [sh:0][sw:0];
/*always
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
*/
always @(*)
begin
	tmp = 8'b00000000;
	for(i=0;i<height*width*8;i=i+8)
	begin
	   for(l = 0; l < 8; l = l + 1)
		begin
			tmp1[l] = myin[i+l];
		end
		temp=0;
		k = i - width*8*size;
		repeat(kernel)
			begin
		   if(k < 0 || k > height*width*8)
				temp = temp + 0;
			else
				begin
					h = -size*8;
					repeat(kernel)
					begin
						if(k + h < ((k + h)/width*8)*width*8 || k + h > (((k + h)/width*8)*width*8)+width*8)
							temp = temp + 0;
						else
							begin
								for(j = 0; j < 8; j = j + 1)
								begin
									tmp[j] = myin[k+h+j];
								end
								temp = temp + tmp;
							end
					h = h + 8;
					end
				end
			k = k + width*8;
			end
			if (temp > (tmp1*kernel*kernel))
			begin
				for(s = 0; s < 8; s = s + 1)
								begin
									myout[i+s] = 0;
								end
			end
			else
			begin
				for(s = 0; s < 8; s = s + 1)
								begin
									myout[i+s] = 1;
								end
			end
		end
end


endmodule
