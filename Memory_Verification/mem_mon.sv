class mem_mon;

	int num;
	mem_tx tx;
	virtual mem_intf vif;

	function new(int num);
		this.num=num;
		vif=top.pif;
		$display("mon from agent[%0d]",num);
	endfunction

	task run();
		$display("mon from agent[%0d]",num);
		$display("executing monitor on memory");
		forever begin
			@( vif.mon_cb);
			if(vif.mon_cb.valid_i==1 && vif.mon_cb.ready_o==1) begin
				tx=new();
				$display("valid tx detected %0t",$time);
				tx.wr_rd=vif.mon_cb.wr_rd_i;
				tx.addr=vif.mon_cb.addr_i;
				if(tx.wr_rd==1) tx.data=vif.mon_cb.wdata_i;
				else tx.data=vif.mon_cb.rdata_o;
				common::mon2cov.put(tx);
			end
		end
	endtask
endclass
