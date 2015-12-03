/*
\brief First Verilog HDL project.

\authors Yakup Cengiz
\date    2015/12/04
*/
module HelloWorld(
	input1,
	input2,
	input3,
	input4,
	output1
);

input wire	input1;
input wire	input2;
input wire	input3;
input wire	input4;
output wire	output1;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_1 = input1 & input2;

assign	SYNTHESIZED_WIRE_0 = input3 & input4;

assign	output1 = SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

endmodule