// Two external  synchronization signals,  hsync  and  vsync,  control 
// generation of the sawtooth waveforms
// The  VGA port  has five active signals
// hsync : horizontal synchronization   
// vsync : vertical synchronization 
// three video signals for the  red,  green, and blue beams.

module vga_controller(clk, reset, switch, hsync, vsync, rgb);

input clk, reset;
input [2:0] switch; 
output hsync, vsync; 
output [2:0] rgb;

reg[2:0] rgb_reg;
wire display_on;
//instantiatevgasynccircuit
vga_sync vsync_unit(clk, hsync, vsync, display_on, pixel_x, pixel_y);

//rgbbuffer
always@(posedge clk, posedge reset)
begin
    if(reset)
        rgb_reg = 0;
    else
        rgb_reg = switch;

end

assign rgb =(display_on) ? rgb_reg : 3'b0;

endmodule