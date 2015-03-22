module clock(CLK, out);

input CLK;
output reg out;

always @(posedge CLK)
begin
out = ~out;
end

endmodule