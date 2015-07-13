module SMOOTH_FILTER
(
CLK,
RST,
CLK_ENABLE,
FILTER_IN,
FILTER_OUT,
MASK1,
MASK2,
MASK3,
MASK4,
MASK7,
MASK_ACTIVE
);

// ports declaration
input        CLK;
input        RST;
input        CLK_ENABLE;
input  [9:0] FILTER_IN;
output [9:0] FILTER_OUT;

input MASK_ACTIVE;
input [2:0] MASK1;
input [2:0] MASK2;
input [2:0] MASK3;
input [2:0] MASK4;
input [2:0] MASK7;
wire [2:0]  MASK5;
wire [2:0]  MASK6;
wire [2:0]  MASK8;
wire [2:0]  MASK9;


assign MASK5 = MASK4 * MASK2;
assign MASK6 = MASK4 * MASK3;
assign MASK8 = MASK7 * MASK2;
assign MASK9 = MASK7 * MASK3;

////////////////////////////

wire [2:0] X1;
wire [2:0] X2;
wire [2:0] X3;
wire [2:0] X4;
wire [2:0] X5;
wire [2:0] X6;
wire [2:0] X7;
wire [2:0] X8;
wire [2:0] X9;

assign X1 = (MASK_ACTIVE) ? MASK1 : -3'd1;
assign X2 = (MASK_ACTIVE) ? MASK2 : -3'd2;
assign X3 = (MASK_ACTIVE) ? MASK3 : -3'd1;
assign X4 = (MASK_ACTIVE) ? MASK4 : 3'd0;
assign X5 = (MASK_ACTIVE) ? MASK5 : 3'd0;
assign X6 = (MASK_ACTIVE) ? MASK6 : 3'd0;
assign X7 = (MASK_ACTIVE) ? MASK7 : 3'd1;
assign X8 = (MASK_ACTIVE) ? MASK8 : 3'd2;
assign X9 = (MASK_ACTIVE) ? MASK9 : 3'd1;

//wire
wire [9:0] LINE0;
wire [9:0] LINE1;
wire [9:0] LINE2;

wire [19:0] MAC0;
wire [19:0] MAC1;
wire [19:0] MAC2;

wire [21:0] sum;
wire [9:0] FILTER_OUT;

//assign 
assign FILTER_OUT = sum[9:0]<0?-sum[9:0]:sum[9:0];

//module declaration 
filter_buffer L0
(			
	.clken(CLK_ENABLE),
	.clock(CLK),
	.shiftin(FILTER_IN),
	//.shiftout,
	.taps0x(LINE0),
	.taps1x(LINE1),
	.taps2x(LINE2)
);

Multiply mul0
(	
	.aclr0(!RST),
	.clock0(CLK),
	.dataa_0(LINE0),
	.datab_0(X9),
	.datab_1(X8),
	.datab_2(X7),
	.result(MAC0)
);

Multiply mul1
(	
	.aclr0(!RST),
	.clock0(CLK),
	.dataa_0(LINE1),
	.datab_0(X6),
	.datab_1(X5),
	.datab_2(X4),
	.result(MAC1)
);

Multiply mul2
(	
	.aclr0(!RST),
	.clock0(CLK),
	.dataa_0(LINE2),
	.datab_0(X3),
	.datab_1(X2),
	.datab_2(X1),
	.result(MAC2)
);

pa parellel_add
(
    .aclr(!RST),
	.clock(CLK),
	.data0x(MAC0),
	.data1x(MAC1),
	.data2x(MAC2),
	.result(sum)
);
	
endmodule
