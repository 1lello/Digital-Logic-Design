/*
\authors Yakup Cengiz
\date 05/02/2015
*/

module vga_controller(CLK, RST, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);
input  CLK;
input  RST;
output VGA_HS;        // VGA H_SYNC
output VGA_VS;        // VGA V_SYNC
output [3:0] VGA_R;   // VGA Red[3:0]
output [3:0] VGA_G;   // VGA Green[3:0]
output [3:0] VGA_B;   // VGA Blue[3:0]

wire   [3:0] VGA_R_internal; // VGA Red[3:0]
wire   [3:0] VGA_G_internal; // VGA Green[3:0]
wire   [3:0] VGA_B_internal; // VGA Blue[3:0]

wire display_on;
wire vga_clk;

// Host Side
wire [10:0] Current_X;
wire [10:0] Current_Y;

clk_div  unit1(CLK, vga_clk);
vga_sync unit2(vga_clk, RST, VGA_HS, VGA_VS, Current_X, Current_Y);

// draw something
//all_pixels_white unit3(vga_clk, RST, VGA_R_internal, VGA_G_internal, VGA_B_internal, Current_X, Current_Y);
rectangle        unit4(vga_clk, RST, VGA_R_internal, VGA_G_internal, VGA_B_internal, Current_X, Current_Y);
//horizontal_line  unit5(vga_clk, RST, VGA_R_internal, VGA_G_internal, VGA_B_internal, Current_X, Current_Y);
//vertical_line    unit6(vga_clk, RST, VGA_R_internal, VGA_G_internal, VGA_B_internal, Current_X, Current_Y);

assign VGA_R = (Current_X > 0) ? VGA_R_internal : 0;
assign VGA_G = (Current_X > 0) ? VGA_G_internal : 0;
assign VGA_B = (Current_X > 0) ? VGA_B_internal : 0;

endmodule