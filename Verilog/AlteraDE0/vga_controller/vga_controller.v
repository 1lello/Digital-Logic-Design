module vga_controller(CLK, RST, VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B);
input CLK;
input RST;
output		  VGA_HS;			    //	VGA H_SYNC
output		  VGA_VS;				//	VGA V_SYNC
output	[3:0] VGA_R;   				//	VGA Red[3:0]
output	[3:0] VGA_G;	 			//	VGA Green[3:0]
output	[3:0] VGA_B;   				//	VGA Blue[3:0]

wire	[3:0] VGA_R_;   				//	VGA Red[3:0]
wire	[3:0] VGA_G_;	 			//	VGA Green[3:0]
wire	[3:0] VGA_B_;   				//	VGA Blue[3:0]

wire display_on;
wire vga_clk;

//    Host Side
wire [10:0] Current_X;
wire [10:0] Current_Y;

clk_div  u1(CLK, vga_clk);
vga_sync u2(vga_clk, RST, VGA_HS, VGA_VS, Current_X, Current_Y);
vga_pattern(vga_clk, RST, VGA_R_, VGA_G_, VGA_B_, Current_X, Current_Y);

assign VGA_R = (Current_X > 20) ? VGA_R_ : 0;
assign VGA_G = (Current_X > 20) ? VGA_G_ : 0;
assign VGA_B = (Current_X > 20) ? VGA_B_ : 0;

endmodule