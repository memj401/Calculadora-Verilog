library verilog;
use verilog.vl_types.all;
entity adder8 is
    port(
        cout            : out    vl_logic;
        s               : out    vl_logic_vector(7 downto 0);
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic
    );
end adder8;
