/*
\authors Yakup Cengiz
\date 03/30/2015
*/

module keyToSevenSegment(key_code, seven_segment);

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

input [7:0] key_code;
output reg[6:0] seven_segment;

always @*
   case(key_code)
       8'h1c: seven_segment = 7'b0001000;   // A
       8'h32: seven_segment = 7'b0000000;   // B
       8'h21: seven_segment = 7'b1000110;   // C
       8'h23: seven_segment = 7'b1000000;   // D
       8'h24: seven_segment = 7'b0000110;   // E
       8'h2b: seven_segment = 7'b0001110;   // F
       8'h34: seven_segment = 7'b0000010;   // G
       8'h33: seven_segment = 7'b0001001;   // H
       8'h43: seven_segment = 7'b1111001;   // I
       default: seven_segment = 7'b1111111;
    endcase
endmodule