# Clock definition
create_clock -name CLK_MAIN -period 10.0 [get_ports clk]

# Input delay
set_input_delay 2.0 -clock CLK_MAIN [get_ports data_in]

# Output delay
set_output_delay 1.5 -clock CLK_MAIN [get_ports data_out]

# Clock uncertainty
set_clock_uncertainty 0.2 [get_clocks CLK_MAIN]
