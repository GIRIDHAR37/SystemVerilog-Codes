vlog apb_tb.sv
vopt apb_tb +cover=fcbest -o apb_base_test
vsim -coverage apb_base_test -novopt -suppress 12110 
coverage save -onexit apb_base_test.ucdb
add wave -position insertpoint sim:/apb_tb/dut/*
run -all
