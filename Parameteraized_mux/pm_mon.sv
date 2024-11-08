class pm_mon;
	
	pm_tx tx;
	virtual pm_if vif;

	function new();
		vif=pm_tb.pif;
	endfunction 
	
	task run();
//		forever begin
		repeat(20) begin
			tx=new();
//			$display("Time : %0t monitor puting transaction to coverage : i : %b | s : %b | y : %b",$time,vif.i,vif.s,vif.y);
			tx.i=vif.i;
			tx.s=vif.s;
			tx.y=vif.y;
	$display("Time : %0t puting transaction : i : %b | s : %b | y : %b",$time,tx.i,tx.s,tx.y);
			mon2cov.put(tx);
			#1;
			$display("Time : %0t monitor puting transaction to coverage : i : %b | s : %b | y : %b",$time,vif.i,vif.s,vif.y);
		end
	endtask

endclass
