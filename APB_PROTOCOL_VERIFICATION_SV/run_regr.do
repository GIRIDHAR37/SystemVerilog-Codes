# compilation 
vlog apb_tb.sv

# optimization
vopt apb_tb +cover=fcbest -o apb_base_test

# open test list file 
set fp [open "testname_list.txt" r]

# loop through test list
while {[gets $fp testname] >= 0} {
	# run simulation and coverage for each testname
	vsim -coverage apb_base_test +testname=$testname -novopt -suppress 12110
	do exclusion.do

	# run the simulation to completion 
	run -all

}

# close the testname_list file
close $fp
