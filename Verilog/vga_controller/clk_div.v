module clk_div(clk, outClk);

input clk;
output outClk;

reg[4:0] counter;
always @(posedge clk) begin
    counter <= counter + 1;
end
	
assign outClk = counter[1];

endmodule