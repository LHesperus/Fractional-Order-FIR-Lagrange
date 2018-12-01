module clk_tb();
reg clk              ;
reg reset            ;
wire clk_int_delay   ;
wire clk_testsignal  ;
wire clk_data_out    ;
wire clk_fir_lagrange;

clk_manage clk_manage_inst(
.clk             (clk             ),
.reset           (reset           ),
.CLK_int_delay   (clk_int_delay   ),
.CLK_testsignal  (clk_testsignal  ),
.CLK_data_out    (clk_data_out    ),
.CLK_fir_lagrange(clk_fir_lagrange)
);

initial
begin
#0   clk=0;
#0   reset=1;
#100 reset=0;
#100 reset=1;
end


always #5 clk=~clk;
endmodule