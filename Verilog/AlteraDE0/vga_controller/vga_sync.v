module vga_sync(
//    Control Signal
CLK,
RST,
// VGA Side
VGA_HS,
VGA_VS,
// VGA Current Pixel Position
Current_X,
Current_Y
);

//    Host Side
output [10:0] Current_X;
output [10:0] Current_Y;

//    VGA Side
output reg VGA_HS;
output reg VGA_VS;
//    Control Signal
input CLK;
input RST;
    
//    Internal Registers
reg [10:0] H_Cont;
reg [10:0] V_Cont;

////////////////////////////////////////////////////////////
//    Horizontal    Parameter
parameter H_FRONT  = 16;
parameter H_SYNC   = 92;
parameter H_BACK   = 46;
parameter H_ACT    = 640;
parameter H_BLANK  = H_FRONT+H_SYNC+H_BACK;
parameter H_TOTAL  = H_FRONT+H_SYNC+H_BACK+H_ACT;
////////////////////////////////////////////////////////////
//    Vertical Parameter
parameter V_FRONT = 10;
parameter V_SYNC  = 2;
parameter V_BACK  = 33;
parameter V_ACT   = 480;
parameter V_BLANK = V_FRONT+V_SYNC+V_BACK;
parameter V_TOTAL = V_FRONT+V_SYNC+V_BACK+V_ACT;

assign    Current_X = (H_Cont>=H_BLANK) ? H_Cont-H_BLANK : 11'h0;
assign    Current_Y = (V_Cont>=V_BLANK) ? V_Cont-V_BLANK : 11'h0;

//    Horizontal Generator: Refer to the pixel clock
always@(posedge CLK or negedge RST)
begin
    if(!RST)
    begin
        H_Cont = 0;
        VGA_HS = 1;
    end
    else
    begin
        if(H_Cont<H_TOTAL-1)
            H_Cont = H_Cont+1'b1;
        else
            H_Cont = 0;
            
        //    Horizontal Sync
        if(H_Cont == H_FRONT-1)            //    Front porch end
            VGA_HS = 1'b0;
        if(H_Cont == H_FRONT+H_SYNC-1)    //    Sync pulse end
            VGA_HS = 1'b1;
    end
end

//    Vertical Generator: Refer to the horizontal sync
always@(posedge VGA_HS or negedge RST)
begin
    if(!RST)
    begin
        V_Cont = 0;
        VGA_VS <= 1;
    end
    else
    begin
//        if(V_Cont<V_TOTAL)
        if(V_Cont<V_TOTAL-1)
        V_Cont = V_Cont+1'b1;
        else
        V_Cont = 0;
        //    Vertical Sync
        if(V_Cont==V_FRONT-1)            //    Front porch end
        VGA_VS = 1'b0;
        if(V_Cont==V_FRONT+V_SYNC-1)    //    Sync pulse end
        VGA_VS = 1'b1;
    end
end


endmodule
