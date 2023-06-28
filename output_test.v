module vga_controller(
  input reg[7:0] img[16588800:0] ; // 16588800 = 1920*1080*8
  input wire clk,
  input wire reset,
  output wire [3:0] red,
  output wire [3:0] green,
  output wire [3:0] blue,
  output wire hsync,
  output wire vsync
);

  // VGA timings
  parameter H_DISPLAY = 1920;      // Horizontal display resolution
  parameter H_FRONT_PORCH = 88;   // Horizontal front porch
  parameter H_SYNC_PULSE = 44;    // Horizontal sync pulse
  parameter H_BACK_PORCH = 148;    // Horizontal back porch
  parameter V_DISPLAY = 1080;      // Vertical display resolution
  parameter V_FRONT_PORCH = 4;   // Vertical front porch
  parameter V_SYNC_PULSE = 5;     // Vertical sync pulse
  parameter V_BACK_PORCH = 36;    // Vertical back porch

  reg [15:0] h_cnt;
  reg [15:0] v_cnt;

  reg hsync_reg;
  reg vsync_reg;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      h_cnt <= 0;
      v_cnt <= 0;
      hsync_reg <= 0;
      vsync_reg <= 0;
    end else if (h_cnt == H_DISPLAY + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH - 1) begin
      h_cnt <= 0;
      if (v_cnt == V_DISPLAY + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH - 1) begin
        v_cnt <= 0;
        vsync_reg <= ~vsync_reg;
      end else begin
        v_cnt <= v_cnt + 1;
      end
    end else begin
      h_cnt <= h_cnt + 1;
      hsync_reg <= (h_cnt < H_SYNC_PULSE) ? 1 : 0;
    end
  end

  assign hsync = hsync_reg;
  assign vsync = vsync_reg;

  // RGB color generation
  always @(posedge clk) begin
    if (v_cnt >= V_FRONT_PORCH && v_cnt < V_DISPLAY + V_FRONT_PORCH && h_cnt >= H_FRONT_PORCH && h_cnt < H_DISPLAY + H_FRONT_PORCH) begin
      red <= 4'b0001;   // Set red color to maximum
      green <= 4'b0011; // Set green color to minimum
      blue <= 4'b0001;  // Set blue color to minimum
    end else begin
      red <= 4'b0000;   // Set red color to minimum
      green <= 4'b0000; // Set green color to minimum
      blue <= 4'b0000;  // Set blue color to minimum
    end
  end

endmodule