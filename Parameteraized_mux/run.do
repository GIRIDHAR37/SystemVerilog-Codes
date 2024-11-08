vlib work
vlog pm_tb.sv
vsim -novopt -suppress 12110 pm_tb
add wave -position insrtpoint sim:/pm_tb/dut/*
run -all
