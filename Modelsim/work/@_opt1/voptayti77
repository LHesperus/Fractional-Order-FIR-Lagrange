library verilog;
use verilog.vl_types.all;
entity lagrange_fir is
    generic(
        N_h             : integer := 6;
        h0              : integer := 12;
        h1              : integer := -98;
        h2              : integer := 586;
        h3              : integer := 586;
        h4              : integer := -98;
        h5              : integer := 12
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        src_signal      : in     vl_logic_vector(15 downto 0);
        delay_signal    : out    vl_logic_vector(15 downto 0);
        delay_signal_long: out    vl_logic_vector(45 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N_h : constant is 1;
    attribute mti_svvh_generic_type of h0 : constant is 1;
    attribute mti_svvh_generic_type of h1 : constant is 1;
    attribute mti_svvh_generic_type of h2 : constant is 1;
    attribute mti_svvh_generic_type of h3 : constant is 1;
    attribute mti_svvh_generic_type of h4 : constant is 1;
    attribute mti_svvh_generic_type of h5 : constant is 1;
end lagrange_fir;
