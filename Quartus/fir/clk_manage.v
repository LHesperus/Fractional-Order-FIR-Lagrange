module clk_manage(
input clk,
input reset,
output CLK_int_delay,
output CLK_testsignal,
output CLK_data_out,
output CLK_fir_lagrange
);
parameter count_int_delay   =10;
parameter count_testsignal  =10;
parameter count_dataout     =10;
parameter count_fir_lagrange=10;
parameter max_count         =10;

reg [3:0]count;

always@(posedge clk)
begin
   if(!reset||count==max_count)
		count<=1;
   else
		count<=count+1'b1;
end

//------------------------------------
reg clk_int_delay    ;
reg clk_testsignal   ;
reg clk_data_out     ;
reg clk_fir_lagrange ;

always@(posedge clk)
begin
	if(!reset)
		clk_int_delay<=0;
	else if(count==count_int_delay)
		clk_int_delay<=~clk_int_delay;
end

always@(posedge clk)
begin
	if(!reset)
		clk_testsignal<=0;
	else if(count==count_testsignal)
		clk_testsignal<=~clk_testsignal;
end

always@(posedge clk)
begin
	if(!reset)
		clk_data_out<=0;
	else if(count==count_dataout)
		clk_data_out<=~clk_data_out;
end

always@(posedge clk)
begin
	if(!reset)
		clk_fir_lagrange<=0;
	else if(count==count_fir_lagrange)
		clk_fir_lagrange<=~clk_fir_lagrange;
end

assign CLK_int_delay    =clk_int_delay   ;
assign CLK_testsignal   =clk_testsignal  ;
assign CLK_data_out     =clk_data_out    ;
assign CLK_fir_lagrange =clk_fir_lagrange;

endmodule