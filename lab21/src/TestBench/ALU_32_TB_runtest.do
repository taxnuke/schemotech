vcom "$DSN\src\alu_32.vhd" 
vcom "$DSN\src\TestBench\ALU_32_TB.vhd" 
vsim TESTBENCH_FOR_ALU_32 
wave  
wave operand1
wave operand2
wave result
wave cond_code
wave command
run 1.1 us
# The following lines can be used for timing simulation
# vcom <backannotated_vhdl_file_name>
# vcom "$DSN\src\TestBench\ALU_32_TB_tim_cfg.vhd" 
# vsim TIMING_FOR_ALU_32 
