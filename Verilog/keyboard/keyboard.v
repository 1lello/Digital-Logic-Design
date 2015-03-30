/*
\authors Yakup Cengiz
\date 03/30/2015
*/

module keyboard(
CLK,     // PS/2 CLOCK
ps2data, // PS/2 DATA
RST,     // RESET
ssd_0,   // seven segment digit #0
ssd_1,   // seven segment digit #1
ssd_2,   // seven segment digit #2
ssd_3,   // seven segment digit #3
ssd_4,   // seven segment digit #4
ssd_5,   // seven segment digit #5
ssd_6,   // seven segment digit #6
ssd_7,   // seven segment digit #7
);

input CLK,RST,ps2data;
output [6:0] ssd_0, ssd_1, ssd_2, ssd_3, ssd_4, ssd_5, ssd_6,ssd_7;
reg [7:0] data0, data1, data2, data3, data4, data5, data6, data7;
wire [3:0] bitIndex;

always @(posedge CLK)
begin
    if (bitIndex >= 4'd1 && bitIndex <= 4'd8)
       data0[bitIndex - 1] = ps2data;
       
	if ( bitIndex == 4'd0 )
	begin
	    data7 = data6;
	    data6 = data5;
		data5 = data4;
		data4 = data3;
		data3 = data2;
		data2 = data1;
		data1 = data0;
	end
end

updateReadBitIndex readReceivedBitIndex(bitIndex, CLK, RST);

updateSevenSegmentDisplay updateSSD_0(data0,ssd_0);
updateSevenSegmentDisplay updateSSD_1(data1,ssd_1);
updateSevenSegmentDisplay updateSSD_2(data2,ssd_2);
updateSevenSegmentDisplay updateSSD_3(data3,ssd_3);
updateSevenSegmentDisplay updateSSD_4(data4,ssd_4);
updateSevenSegmentDisplay updateSSD_5(data5,ssd_5);
updateSevenSegmentDisplay updateSSD_6(data6,ssd_6);
updateSevenSegmentDisplay updateSSD_7(data7,ssd_7);

endmodule