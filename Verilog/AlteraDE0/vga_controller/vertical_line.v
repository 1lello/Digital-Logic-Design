/*
\authors Yakup Cengiz
\date 05/02/2015
*/

module vertical_line( 
vga_clk, RST,
red, green, blue,
xPos, yPos);

input vga_clk, RST;

output reg [9:0] red;
output reg [9:0] green;
output reg [9:0] blue;
input  [9:0]     xPos;
input  [9:0]     yPos;



always@(posedge vga_clk or negedge RST)
begin
    if(!RST)
    begin
        red   = 0;
        green = 0;
        blue  = 0;
    end
    else
    begin
        if ( (xPos > 315 && xPos < 325) )
        begin
            red   = 4'hF;
            green = 4'hF;
            blue  = 4'hF;
        end
        else begin
            red   = 4'h0;
            green = 4'h0;
            blue  = 4'h0;
        end 
    end
end
endmodule