class pm_tx;

	parameter n_tb=4;

	rand bit [n_tb-1:0]i;
	rand bit [$clog2(n_tb)-1:0]s;
	     bit y;

	function void print();
	    $display("**************");
		$display("i : %b",i);
		$display("s : %b",s);
		$display("y : %b",y);
		$display("**************");
	endfunction

endclass
