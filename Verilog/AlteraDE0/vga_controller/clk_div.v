/*
\authors Yakup Cengiz
\date 05/02/2015
*/

//`timescale 1 ps / 1 ps

module clk_div(clk, outClk);

input clk;
output outClk;

reg[1:0] counter;
always @(posedge clk) begin
    counter <= counter + 1'b1;
end
	
assign outClk = counter[0];

endmodule