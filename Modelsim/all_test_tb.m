module all_test_tb();
reg  clk                   ;
reg  reset                 ;
wire [15:0]int_delay_signal;
wire [15:0]fir_delay_signal;

integer fir_delay_signal_file;
integer int_delay_signal_file;


all_test all_test_inst(
.clk             (clk             ),
.reset           (reset           ),
.int_delay_signal(int_delay_signal),
.fir_delay_signal(fir_delay_signal)
);

initial
begin
#0 clk=0;
#0 reset=1;
#100 reset=0;
#100 reset=1;
#10000
fir_delay_signal_file=$fopen("fir_delay_signal_file.txt");
int_delay_signal_file=$fopen("int_delay_signal_file.txt");
#1000000 $fclose(fir_delay_signal_file);
$fclose(int_delay_signal_file);


end




always@(int_delay_signal)
begin	
	$fdisplay(fir_delay_signal_file,"%d",$signed(int_delay_signal));
	$fdisplay(int_delay_signal_file,"%d",$signed(fir_delay_signal));
end

always #5 clk=~clk;
endmodule