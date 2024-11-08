class pm_gen;

	pm_tx tx;

	task run();
		repeat(20) begin
			tx=new();
			assert(tx.randomize());
			gen2bfm.put(tx);
			$display("Time : %0t generator puting transaction to bfm : i : %b | s : %b",$time,tx.i,tx.s);
		end
	endtask

endclass
