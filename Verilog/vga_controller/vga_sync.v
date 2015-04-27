module vga_sync(clk, hSync, vSync, xIndex, yIndex, displayEnable);

input clk;
output wire hSync;
output wire vSync;
output[9:0] xIndex;
output[9:0] yIndex;
output reg displayEnable;

parameter hPixels = 800;        
parameter vLines = 521;         
parameter hRetrace = 96; 	    
parameter vRetrace = 2; 	    
parameter hBackPorch = 144; 	// 96 + 48
parameter hFrontPorch = 784; 	// 640 + 144
parameter vBackPorch = 31; 		// 
parameter vFrontPorch = 511;    // 480 + 31

wire vgaClk;
//clkDiv vgaClkDivision(clk, vgaClk);
assign vgaClk = clk;

reg [9:0] hCounter;
reg [9:0] vCounter;

always @(posedge vgaClk) begin
	if (hCounter < hPixels - 1)
		hCounter = hCounter + 1;
	else begin
		hCounter = 0;
		if (vCounter < vLines - 1)
			vCounter = vCounter + 1;
		else
			vCounter = 0;
	end
end

assign hSync = (hCounter < hRetrace) ? 0:1;
assign vSync = (vCounter < vRetrace) ? 0:1;
assign xIndex = hCounter - hBackPorch;
assign yIndex = vCounter - vBackPorch;

always @(*) begin
	if (vCounter >= vBackPorch &&
        vCounter < vFrontPorch &&
        hCounter >= hBackPorch &&
        hCounter < hFrontPorch)
    begin
        displayEnable = 1;
    end 
    else begin
		displayEnable = 0;
	end
end
endmodule