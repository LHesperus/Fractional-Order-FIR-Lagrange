library verilog;
use verilog.vl_types.all;
entity all_test is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        int_delay_signal: out    vl_logic_vector(15 downto 0);
        fir_delay_signal: out    vl_logic_vector(15 downto 0)
    );
end all_test;
