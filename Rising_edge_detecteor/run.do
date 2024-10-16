vlib work
vlog red_tb.sv
vsim -novopt -suppress 12110 red_tb
add wave -position insrtpoint sim:/red_tb/dut/*
run -all
