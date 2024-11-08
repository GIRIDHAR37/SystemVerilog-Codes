interface pm_if();

	parameter n_tb=4;

	bit [n_tb-1:0]i;
	bit [$clog2(n_tb)-1:0]s;
	bit y;
	
endinterface
