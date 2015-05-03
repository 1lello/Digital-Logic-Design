/*
\authors Yakup Cengiz
\date 03/30/2015
*/

module char_generator(row, data);
    
input [3:0] row;
output reg[7:0] data;
    
always @(row)
begin
    case (row)
        4'h0: data = 8'b00000000;  
        4'h1: data = 8'b00000000;
        4'h2: data = 8'b00000000;
        4'h3: data = 8'b00010000;
        4'h4: data = 8'b00111000;
        4'h5: data = 8'b01101100;
        4'h6: data = 8'b11000110;
        4'h7: data = 8'b11000110;
        4'h8: data = 8'b11111110;
        4'h9: data = 8'b11000110;
        4'ha: data = 8'b11000110;
        4'hb: data = 8'b11000110;
        4'hc: data = 8'b11000110;
        4'hd: data = 8'b00000000;
        4'he: data = 8'b00000000;
        4'hf: data = 8'b00000000;
        default data = 8'b00000000;
    endcase
end

endmodule