vlib work
vlog eed_tb.sv
vsim -novopt -suppress 12110 eed_tb
add wave -position insrtpoint sim:/eed_tb/dut/*
run -all
