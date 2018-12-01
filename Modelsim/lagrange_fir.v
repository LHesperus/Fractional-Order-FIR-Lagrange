module lagrange_fir(
input  clk,
input  reset,
input  [15:0]src_signal,
output [15:0]delay_signal,
output [45:0]delay_signal_long
);


//-------------------------------------------
parameter N_h=6;					//响应的长度
parameter h0=  12;					//脉冲响应
parameter h1=  -98;
parameter h2=  586;
parameter h3=  586;
parameter h4=  -98;
parameter h5=  12;


//parameter N_h=6;					//响应的长度
//parameter h0=   0;					//脉冲响应
//parameter h1=  0;
//parameter h2=  0;
//parameter h3=  0;
//parameter h4=  0;
//parameter h5=  -1;

reg [10:0]h0reg=h0;
reg [10:0]h1reg=h1;
reg [10:0]h2reg=h2;
reg [10:0]h3reg=h3;
reg [10:0]h4reg=h4;
reg [10:0]h5reg=h5;







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
//--------卷积运算-----------------------
reg [45:0]delay_signal_temp;
always@(posedge clk)
begin
	if(!reset)
		delay_signal_temp<=0;
	else
		delay_signal_temp<=$signed(src_signal_0)*$signed(h5reg)+$signed(src_signal_1)*$signed(h4reg)+$signed(src_signal_2)*$signed(h3reg)+$signed(src_signal_3)*$signed(h2reg)+$signed(src_signal_4)*$signed(h1reg)+$signed(src_signal_5)*$signed(h0reg);
end
assign 	delay_signal=delay_signal_temp[15+10:10];
assign  delay_signal_long=delay_signal_temp;
endmodule