library verilog;
use verilog.vl_types.all;
entity int_delay is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        delay           : in     vl_logic_vector(2 downto 0);
        src_signal      : in     vl_logic_vector(15 downto 0);
        delay_signal    : out    vl_logic_vector(15 downto 0)
    );
end int_delay;
