module lagrange_fir_tb;
reg clk;
reg reset;
wire [15:0]delay_signal;
reg  [7:0]address;
wire [15:0]src_signal;
wire [45:0]delay_signal_long;

integer src_signal_file;
integer delay_signal_file;

//---信号源
src_signal src_signal_inst(
.address(address),
.clock  (clk),
.q      (src_signal));
//fir滤波器
lagrange_fir lagrange_fir_inst(
.clk           (clk         ),
.reset         (reset       ),
.src_signal    (src_signal  ),
.delay_signal  (delay_signal),
.delay_signal_long(delay_signal_long)
);

initial
begin
#0   clk=0;
#0   reset=1;
#0   address=0;
#100 reset=0;
#100 reset=1;
delay_signal_file=$fopen("delay_signal_file.txt");
src_signal_file=$fopen("src_signal_file.txt");
#10000 $fclose(delay_signal_file);
$fclose(src_signal_file);
end

reg [8:0]i;
reg [8:0]j;
initial
begin
for(j=1'b1;j<=8'd255;j=j+1'b1)
begin
  for(i=1'b0;i<=8'd255;i=i+1'b1)
	begin
	#10 address=address+8'd5;
	end
   // #10 address=0;
end
end



always #10
begin	
	$fdisplay(src_signal_file,"%d",src_signal);
	$fdisplay(delay_signal_file,"%d",delay_signal_long);
end







always #5  clk=~clk;
//always #10 address=address+1'b1;
endmodule