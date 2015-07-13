module mouse(ps2data,ps2clk,clk,rst,ssdlo,ssdhi);
inout ps2data,ps2clk;
input clk,rst;
output [6:0] ssdlo,ssdhi;
reg direction_clk, direction_data, host_data,host_clk;
reg [3:0] durum;
reg [31:0] say,i;
reg [8:0] data;
reg [10:0] received_data;

updateSevenSegmentDisplay data_low(received_data[4:1],ssdlo);
updateSevenSegmentDisplay data_high(received_data[8:5],ssdhi);

assign ps2clk=direction_clk?host_clk:1'bz;
assign ps2data=direction_data?host_data:1'bz;

always @ (posedge clk or negedge rst)
begin
   if (!rst)
	begin
	   durum=4'd1;
		direction_clk=1'b0;
		direction_data=1'b0;
		say=0;
		data[7:0]=8'hF4;
		data[8]=^data;
	end
	else
	case (durum)
	4'd1: begin 
	          host_clk=1'b0;
				 direction_clk=1'b1;
				 if (say<2500)
				    say=say+1;
				 else
				 begin
				    say=0;
					 host_clk=1'b1;
					 durum=4'd3;
				 end
				 if (say==2200)
				 begin
				 	 host_data=1'b0;
				    direction_data=1'b1;
				 end
			 end
//	4'd2: begin 
//	         host_data=1'b0;
//				direction_data=1'b1;
//				durum=4'd3;
//	      end
	4'd3: begin 
	         direction_clk=1'b0;
				durum=4'd4;
	      end
	4'd4: begin 
	         if (!ps2clk)
				begin
	         	durum=4'd5;
					i=0;
				end
	      end
	4'd5: begin 
	         host_data=data[i];
			   durum=4'd6;
	      end			
	4'd6: begin 
	         if (ps2clk)
				begin
	         	durum=4'd7;
				end
	      end		
	4'd7: begin 
	         if (!ps2clk)
				begin
	         	durum=4'd8;
				end
	      end	
	4'd8: begin 
	         if (i<8)
				begin
	         	i=i+1;
					durum=4'd5;
				end
				else
				begin
					i=0;
					host_data=1'b1;
					durum=4'd9;
				end
	      end	
	4'd9: begin 
	         direction_data=1'b0;
				durum=4'd10;
	      end			
	4'd10: begin 
	         if (!ps2data)
				   durum=4'd11;
	      end	
	4'd11: begin 
	         if (!ps2clk)
				   durum=4'd12;
	      end		
	4'd12: begin 
	         if (ps2data && ps2clk)
				begin
				   durum=4'd13;
					i=0;
				end
	      end			
	4'd13: begin 
	         if (!ps2clk)
				   durum=4'd14;
	      end						
	4'd14: begin
				if (ps2clk)
				begin
				   if (i<11)
					begin
				      received_data[i]=ps2data;
				      i=i+1;
				      durum=4'd13;
					end
					if (i==11)
					begin
					   i=0;
						durum=4'd12;
					end
				end				
	      end		
	default: durum=durum;	
	endcase
end

endmodule