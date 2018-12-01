//只能实现较少单位的延迟
module int_delay(
input  clk,
input  reset,
input  [2:0]delay,
input  [15:0]src_signal,
output [15:0]delay_signal
);




//------------------------------------------
reg [15:0]src_signal_0;				//当前信号
reg [15:0]src_signal_1;
reg [15:0]src_signal_2;
reg [15:0]src_signal_3;
reg [15:0]src_signal_4;
reg [15:0]src_signal_5;


//---------------------------------------------

//--------------存储信号------------------
always@(posedge clk)
begin
	if(!reset)
	  begin 
		src_signal_0<=0;
		src_signal_1<=0;
		src_signal_2<=0;
		src_signal_3<=0;
		src_signal_4<=0;
		src_signal_5<=0;
	  end
	else
	  begin
		src_signal_0<=src_signal;
		src_signal_1<=src_signal_0;
		src_signal_2<=src_signal_1;
		src_signal_3<=src_signal_2;
		src_signal_4<=src_signal_3;
		src_signal_5<=src_signal_4;
	  end
end

reg [15:0]delay_signal_reg;
always@(posedge clk)
begin
 if(!reset)
   delay_signal_reg<=0;
 else
  case(delay)
   3'd1:delay_signal_reg<=src_signal;
   3'd2:delay_signal_reg<=src_signal_0;
   3'd3:delay_signal_reg<=src_signal_1;
   3'd4:delay_signal_reg<=src_signal_2;
   3'd5:delay_signal_reg<=src_signal_3;
   3'd6:delay_signal_reg<=src_signal_4;
   3'd7:delay_signal_reg<=src_signal_5;
  endcase
end
assign delay_signal=delay_signal_reg;
endmodule