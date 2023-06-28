
module logic1#(
parameter width = 10,
parameter height = 10,
parameter kernel = 3,
parameter percent = 110,
parameter size=(kernel-1)/2)
(
input [0:((width*height*8)-1)]myin,
output reg [0:((width*height*8)-1)]myout
);

reg [7:0] tmp ;
integer i , j , k , h , w, x , v , b , temp ;

always@(*)
begin
	for(h = 0 ; h < (8 * width * height) ; h = h + ((8 * width)))
	begin
	   for(w = 0; w < (8 * width); w = w + 8)
		begin
			i = h + w - (width * size * 8);
			j = h + w - (size * 8);
			temp = 0;
			repeat(kernel)
			begin
				repeat(kernel)
				begin
					if(((i + j ) < 0) || ((i + j ) > ((8 * width * height)- 1)))
						begin
							temp = temp + 0; 
						end
					else
						begin
							tmp = 8'b00000000;
							for(k =0 ; k < 8 ; k = k + 1)
							begin
								tmp[k] = myin[i+j+k];
							end
						end
					temp = temp + tmp;
					j = j + 8;
				end
				i = i + (width * 8);
			end	
				tmp = 8'b00000000;
			for(x = 0 ; x < 8 ; x = x + 1)
			begin
				tmp[x] = myin[h+w+x];
			end
			if( tmp*(kernel * kernel) > temp*( percent / 100 ))
			begin
				for(v = 0 ; v < 8 ; v = v + 1)
				begin
					myout[h + w + v ] = 0;
				end
			end
			else
			begin
				for(b = 0 ; b < 8 ; b = b + 1)
				begin
					myout[h + w + b ] = 1;
				end
			end
		end
	end
end

endmodule
