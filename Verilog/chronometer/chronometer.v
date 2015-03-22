/*
\authors Yakup Cengiz
\date 03/22/2015
*/
module chronometer(
CLK, // clock
RST, // reset
segmen_digit_0, // seven segment digit #0
segmen_digit_1, // seven segment digit #1
segmen_digit_2, // seven segment digit #2
segmen_digit_3, // seven segment digit #3
counter_0,       // for debug purpose (simulation)
counter_1,       // for debug purpose (simulation)
counter_2,       // for debug purpose (simulation)
counter_3,       // for debug purpose (simulation)
);

// set signal type
input CLK, RST;

output [3:0] counter_0, counter_1, counter_2, counter_3;
output [6:0] segmen_digit_0, segmen_digit_1, segmen_digit_2, segmen_digit_3;
  
updateCounter ins_updateCounter(CLK, RST, counter_0, counter_1, counter_2, counter_3);
updateSevenSegment ins_0(counter_0, segmen_digit_0);
updateSevenSegment ins_1(counter_1, segmen_digit_1);
updateSevenSegment ins_2(counter_2, segmen_digit_2);
updateSevenSegment ins_3(counter_3, segmen_digit_3);

endmodule