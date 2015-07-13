/*
\authors Yakup Cengiz
\date 03/22/2015
*/

module updateSevenSegment(hex_digit, seven_seg);
    
input [3:0] hex_digit;
output reg[6:0] seven_seg;
    
// segment = {g,f,e,d,c,b,a};
// 0 means ON and 1 means OFF

always @(hex_digit)
begin
    case (hex_digit)
       4'h0: seven_seg = ~7'h3F;
       4'h1: seven_seg = ~7'h06;     // ---a----
       4'h2: seven_seg = ~7'h5B;     // |      |
       4'h3: seven_seg = ~7'h4F;     // f      b
       4'h4: seven_seg = ~7'h66;     // |      |
       4'h5: seven_seg = ~7'h6D;     // ---g----
       4'h6: seven_seg = ~7'h7D;     // |      |
       4'h7: seven_seg = ~7'h07;     // e      c
       4'h8: seven_seg = ~7'h7F;     // |      |
       4'h9: seven_seg = ~7'h67;     // ---d----
       default: seven_seg = 0;
    endcase
end

endmodule