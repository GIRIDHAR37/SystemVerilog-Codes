class mem_bfm;
	
	mem_tx tx;
	virtual mem_intf vif;
	int num;

	function new(int num=0);
		vif=top.pif;
		$display("bfm from agent[%0d]",num);
		this.num=num;
	endfunction

	task run();
		forever begin
			common::gen2bfm.get(tx);
		//	tx.print(num);
			$display("from bfm %0t \n\n",$time);
			common::smp.get(1);
			drive_tx(tx);
			common::smp.put(1);
			common::drive_done=common::gen2bfm.num();
			if(common::drive_done==0) ->common::func_start;
		end
	endtask
	task drive_tx(mem_tx tx);
		@(vif.bfm_cb);
		vif.bfm_cb.addr_i<=tx.addr;
		vif.bfm_cb.wr_rd_i<=tx.wr_rd;
		if(tx.wr_rd==1) vif.bfm_cb.wdata_i<=tx.data;
		vif.bfm_cb.valid_i<=1'b1;
		wait(vif.bfm_cb.ready_o==1);
		//@(vif.bfm_cb.clk_i);
		vif.bfm_cb.addr_i<=0;
		vif.bfm_cb.wdata_i<=0;
		vif.bfm_cb.valid_i<=0;
	endtask
endclass
