module RGB2Gray (
VGA_CLK,
RST,
iRED,
iGREEN,
iBLUE,
oRED,
oGREEN,
oBLUE,
VGA_X,
VGA_Y,
GRAY_ENABLED,
);

input            VGA_CLK;
input            RST;
input      [9:0] iRED;
input      [9:0] iGREEN;
input      [9:0] iBLUE;
output reg [9:0] oRED;
output reg [9:0] oGREEN;
output reg [9:0] oBLUE;
input	   [10:0] VGA_X;
input	   [10:0] VGA_Y;
input      GRAY_ENABLED;


always@(posedge VGA_CLK or negedge RST) begin
  if (!RST) begin
    oRED <= 0;
    oGREEN <= 0;
    oBLUE <= 0;
  end
  else begin
    if ( GRAY_ENABLED && VGA_X > 0 )
    begin
        oRED = (iRED + iGREEN + iBLUE) / 3;
        oGREEN = (iRED + iGREEN + iBLUE) / 3;
        oBLUE = (iRED + iGREEN + iBLUE) / 3;
    end
    else begin
        oRED = iRED;
        oGREEN = iGREEN;
        oBLUE = iBLUE;
    end
  end
end

endmodule