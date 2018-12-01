module int_delay_tb();
reg clk                ;
reg reset              ;
reg [3:0]delay         ;
reg [15:0]src_signal   ;
wire [15:0]delay_signal;

int_delay int_delay_inst(
.clk          (clk         ),
.reset        (reset       ),
.delay        (delay       ),
.src_signal   (src_signal  ),
.delay_signal (delay_signal)
);

initial
begin
#0 clk=1;
#0 reset=1;
#0 delay=1;
#0 src_signal=0;
#100 reset=0;
#100 reset=1;
end



always #5 clk=~clk;
always #10 src_signal<=src_signal+1'b1;
endmodule