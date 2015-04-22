/*
\authors Yakup Cengiz
\date 03/22/2015
*/
module chronometer(
CLK,             // clock
RST,             // reset
ssd_0,           // seven segment digit #0
ssd_1,           // seven segment digit #1
ssd_2,           // seven segment digit #2
ssd_3,           // seven segment digit #3
);

// set signal type
input CLK, RST;

wire [3:0] counter_0, counter_1, counter_2, counter_3;
output [6:0] ssd_0, ssd_1, ssd_2, ssd_3;
  
updateCounter updateCounter(CLK, RST, counter_0, counter_1, counter_2, counter_3);
updateSevenSegment updateSevenSegment_0(counter_0, ssd_0);
updateSevenSegment updateSevenSegment_1(counter_1, ssd_1);
updateSevenSegment updateSevenSegment_2(counter_2, ssd_2);
updateSevenSegment updateSevenSegment_3(counter_3, ssd_3);

endmodule