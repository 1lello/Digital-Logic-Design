/*
\authors Yakup Cengiz
\date 03/22/2015
*/

module updateCounter(
CLK, // clock
RST, // reset
counter_0,
counter_1,
counter_2,
counter_3
);

// set signal type
input CLK, RST;
output reg [3:0] counter_0, counter_1, counter_2, counter_3;

always @(posedge CLK, negedge RST)
begin
	if (~RST) begin
        // TODO : for loop
        counter_0 = 4'd0;
        counter_1 = 4'd0;
        counter_2 = 4'd0;
        counter_3 = 4'd0;
	end
	else
	begin
		if(counter_0 == 4'd9) begin
			counter_0 = 4'd0;
            if (counter_1 == 9) begin
				counter_1 = 4'd0;
                if (counter_2 == 5) begin
					counter_2 = 4'd0;
                    if(counter_3 == 4'd9 )
                        counter_3 = 4'd0;
                    else
                        counter_3 = counter_3 + 4'd1;
					end
				else
					counter_2 = counter_2 + 4'd1;
				end
				else
					counter_1 = counter_1 + 4'd1;
				end
		else begin
			counter_0 = counter_0 + 4'd1; 
        end
    end
 end
 
endmodule