vlib work
vlog fed_tb.sv
vsim -novopt -suppress 12110 fed_tb
add wave -position insrtpoint sim:/fed_tb/dut/*
run -all
