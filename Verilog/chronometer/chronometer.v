/*
\authors Yakup Cengiz
\date 03/22/2015
*/
module chronometer(
CLK, // clock
RST, // reset
segment_digit_0, // seven segment digit #0
segment_digit_1, // seven segment digit #1
segment_digit_2, // seven segment digit #2
segment_digit_3, // seven segment digit #3
counter_0,       // for debug purpose (simulation)
counter_1,       // for debug purpose (simulation)
counter_2,       // for debug purpose (simulation)
counter_3        // for debug purpose (simulation)
);

// set signal type
input CLK, RST;

output [3:0] counter_0, counter_1, counter_2, counter_3;
output [6:0] segment_digit_0, segment_digit_1, segment_digit_2, segment_digit_3;
  
updateCounter updateCounter(CLK, RST, counter_0, counter_1, counter_2, counter_3);
updateSevenSegment updateSevenSegment_0(counter_0, segment_digit_0);
updateSevenSegment updateSevenSegment_1(counter_1, segment_digit_1);
updateSevenSegment updateSevenSegment_2(counter_2, segment_digit_2);
updateSevenSegment updateSevenSegment_3(counter_3, segment_digit_3);

endmodule