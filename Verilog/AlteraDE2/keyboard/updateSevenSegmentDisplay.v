/*
\authors Yakup Cengiz
\date 03/30/2015
*/

module updateSevenSegmentDisplay(hex_digit, seven_segment);
    
input [3:0] hex_digit;
output reg[6:0] seven_segment;
    
// segment = {g,f,e,d,c,b,a};
// 0 means ON and 1 means OFF

// ---a----
// |      |
// f      b
// |      |
// ---g----
// |      |
// e      c
// |      |
// ---d----

always @(hex_digit)
begin
    case (hex_digit)
       4'h0: seven_segment = 7'b1000000;
	   4'h1: seven_segment = 7'b1111001;
	   4'h2: seven_segment = 7'b0100100;
	   4'h3: seven_segment = 7'b0110000;
	   4'h4: seven_segment = 7'b0011001;
	   4'h5: seven_segment = 7'b0010010;
	   4'h6: seven_segment = 7'b0000010;
	   4'h7: seven_segment = 7'b1111000;
	   4'h8: seven_segment = 7'b0000000;
	   4'h9: seven_segment = 7'b0010000;
	   4'ha: seven_segment = 7'b0001000;
	   4'hb: seven_segment = 7'b0000011;
	   4'hc: seven_segment = 7'b1000110;
	   4'hd: seven_segment = 7'b0100001;
	   4'he: seven_segment = 7'b0000110;
	   4'hf: seven_segment = 7'b0001110;
	   default seven_segment = 7'b1111111;
    endcase
end

endmodule