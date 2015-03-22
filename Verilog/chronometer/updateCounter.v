module updateCounter(
CLK, // clock
RST, // reset
counter_0, // for debug purpose (simulation)
counter_1, // for debug purpose (simulation)
counter_2, // for debug purpose (simulation)
counter_3, // for debug purpose (simulation)
);

// set signal type
input CLK, RST;
output reg [3:0] counter_0, counter_1, counter_2, counter_3;

always @(posedge CLK, negedge RST)
begin
	if (~RST) begin
        // TODO : for loop
        counter_0 = 0;
        counter_1 = 0;
        counter_2 = 0;
        counter_3 = 0;
	end
	else
	begin
		if(counter_0 == 9) begin
			counter_0 = 0;
            if (counter_1 == 9) begin
				counter_1 = 0;
                if (counter_2 == 5) begin
					counter_2 = 0;
                    if(counter_3 == 9)
                        counter_3 = 0;
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