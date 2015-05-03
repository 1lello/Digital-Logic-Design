/*
\authors Yakup Cengiz
\date 05/02/2015
*/

module all_pixels_white( 
vga_clk, RST,
red, green, blue,
xPos, yPos);

input vga_clk, RST;

output reg [3:0] red;
output reg [3:0] green;
output reg [3:0] blue;
input  [9:0]     xPos;
input  [9:0]     yPos;

always@(posedge vga_clk or negedge RST)
begin
    if(!RST)
    begin
        red   = 4'h0;
        green = 4'h0;
        blue  = 4'h0;
    end
    else
    begin
        red   = 4'hF;
        green = 4'hF;
        blue  = 4'hF;
    end
end
endmodule