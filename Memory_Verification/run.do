vlog top.sv
vopt top +cover=fcbest -o n_wr_rd_test
vsim -coverage n_wr_rd_test +testname=n_wr_rd_test +num_tx=10 +num_agents=3 -novopt -suppress 12110 
coverage save -onexit n_wr_rd_test.ucdb
add wave -position insertpoint sim:/top/dut/*
run -all
