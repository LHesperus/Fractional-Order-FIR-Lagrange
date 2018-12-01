module fir(
input    clk,
input    reset,
output   [15:0]int_delay_signal,
output   [15:0]fir_delay_signal
);



//-------时钟
clk_manage clk_manage_inst(
.clk             (clk             ),
.reset           (reset           ),
.CLK_int_delay   (clk_int_delay   ),
.CLK_testsignal  (clk_testsignal  ),
.CLK_data_out    (clk_data_out    ),
.CLK_fir_lagrange(clk_fir_lagrange)
);

//---信号源
reg [7:0]address;
always@(posedge clk_testsignal or negedge reset)
begin
	if(!reset)
		address<=0;
	else
		address<=address+3'd5;
end

wire [15:0]src_signal;
src_signal src_signal_inst(
.address(address),
.clock  (clk_testsignal),
.q      (src_signal));

//---------整数延迟
wire [15:0]int_delay_signal0;
int_delay int_delay_inst(
.clk          (clk_int_delay    ),
.reset        (reset            ),
.delay        (3'd2             ),
.src_signal   (src_signal       ),
.delay_signal (int_delay_signal0)
);
//---------------分数延迟
wire [15:0]fir_delay_signal0;
lagrange_fir lagrange_fir_inst(
.clk           (clk_fir_lagrange    ),
.reset         (reset               ),
.src_signal    (src_signal          ),
.delay_signal  (fir_delay_signal0   ),
.delay_signal_long(delay_signal_long)
);

assign int_delay_signal=int_delay_signal0;
assign fir_delay_signal=fir_delay_signal0;
endmodule