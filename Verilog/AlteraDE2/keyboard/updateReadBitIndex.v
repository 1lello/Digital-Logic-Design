/*
\authors Yakup Cengiz
\date 03/30/2015
*/

module updateReadBitIndex(bitIndex, CLK, RST);

input CLK,RST;
output reg [3:0]bitIndex;

always@(posedge CLK, negedge RST)
begin
	if(~RST)
	begin
		bitIndex = 4'd0;
	end
	else 
		if(bitIndex<4'd10)
			bitIndex = bitIndex + 4'd1;
		else
			bitIndex = 4'd0;
end

endmodule