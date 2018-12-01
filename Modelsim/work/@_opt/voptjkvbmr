library verilog;
use verilog.vl_types.all;
entity clk_manage is
    generic(
        count_int_delay : integer := 10;
        count_testsignal: integer := 10;
        count_dataout   : integer := 10;
        count_fir_lagrange: integer := 10;
        max_count       : integer := 10
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        CLK_int_delay   : out    vl_logic;
        CLK_testsignal  : out    vl_logic;
        CLK_data_out    : out    vl_logic;
        CLK_fir_lagrange: out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of count_int_delay : constant is 1;
    attribute mti_svvh_generic_type of count_testsignal : constant is 1;
    attribute mti_svvh_generic_type of count_dataout : constant is 1;
    attribute mti_svvh_generic_type of count_fir_lagrange : constant is 1;
    attribute mti_svvh_generic_type of max_count : constant is 1;
end clk_manage;
