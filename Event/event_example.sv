module top;
	
	event e;

	initial begin
		$display("Time : %0t before event trigger process 1",$time);
		#1;
		->e;
	    $display("Time : %0t after event trigger process 1",$time);
	end

	initial begin
		$display("Time : %0t before event catch process 2",$time);
		wait(e.triggered());
	    $display("Time : %0t after event catch process 2",$time);
	end

	initial begin
		$display("Time : %0t before event catch process 3",$time);
		wait(e.triggered());
	    $display("Time : %0t after event catch process 3",$time);
	end

endmodule

// output :
/*
# Time : 0 before event trigger process 1
# Time : 0 before event catch process 2
# Time : 0 before event catch process 3
# Time : 1 after event trigger process 1
# Time : 1 after event catch process 3
# Time : 1 after event catch process 2
*/
