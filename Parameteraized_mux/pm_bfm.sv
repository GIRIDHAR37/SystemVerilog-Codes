class pm_bfm;

	pm_tx tx;
	virtual pm_if vif;

	function new();
		vif=pm_tb.pif;
	endfunction

	task run();
		forever begin
			gen2bfm.get(tx);
			drive_tx(tx);
			#1;
			$display("Time : %0t bfm geting transaction from generator : i : %b | s : %b | y : %b",$time,tx.i,tx.s,tx.y);
		end
	endtask

	task drive_tx(pm_tx tx);
		vif.i=tx.i;
		vif.s=tx.s;
		vif.y=tx.y;
//		#1;
//		$display("Time : %0t geting transaction : i : %b | s : %b | y : %b",$time,tx.i,tx.s,tx.y);
	endtask
	
endclass
