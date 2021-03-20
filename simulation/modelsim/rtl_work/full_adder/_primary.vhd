library verilog;
use verilog.vl_types.all;
entity full_adder is
    port(
        cout            : out    vl_logic;
        sum             : out    vl_logic;
        ain             : in     vl_logic;
        bin             : in     vl_logic;
        cin             : in     vl_logic
    );
end full_adder;
