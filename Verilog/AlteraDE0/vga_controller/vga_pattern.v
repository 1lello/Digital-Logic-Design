module vga_pattern    ( 
vga_clk, RST,
red, green, blue,
xPos, yPos);
//    Read Out Side
output    reg    [9:0]    red;
output    reg    [9:0]    green;
output    reg    [9:0]    blue;
input    [9:0]        xPos;
input    [9:0]        yPos;
input                vga_clk;
//    Control Signals
input                RST;

always@(posedge vga_clk or negedge RST)
begin
    if(!RST)
    begin
        red   = 0;
        green = 0;
        blue  = 0;
    end
    else
    begin
            red    =    (yPos<120)                    ?            3    :
                        (yPos>=120 && yPos<240)        ?            7    :
                        (yPos>=240 && yPos<360)        ?            11    :
                                                                    15    ;
            green    =    (xPos<80)                        ?            1    :
                        (xPos>=80 && xPos<160)        ?            3    :
                        (xPos>=160 && xPos<240)        ?            5    :
                        (xPos>=240 && xPos<320)        ?            7    :
                        (xPos>=320 && xPos<400)        ?            9    :
                        (xPos>=400 && xPos<480)        ?            11    :
                        (xPos>=480 && xPos<560)        ?            13    :
                                                                    15    ;
            blue    =    (yPos<60)                        ?            15    :
                        (yPos>=60 && yPos<120)        ?            13    :
                        (yPos>=120 && yPos<180)        ?            11    :
                        (yPos>=180 && yPos<240)        ?            9    :
                        (yPos>=240 && yPos<300)        ?            7    :
                        (yPos>=300 && yPos<360)        ?            5    :
                        (yPos>=360 && yPos<420)        ?            3    :
                                                                    1    ;
        
    end
end

endmodule