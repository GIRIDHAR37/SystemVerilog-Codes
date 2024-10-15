class mem_cov;
	int num;
	mem_tx tx;
    event e1;
	covergroup mem_cg@(e1);
		WR_RD:coverpoint tx.wr_rd{
			bins write = {1'b1};
			bins read = {1'b0};
		}
		ADDR: coverpoint tx.addr{
			option.auto_bin_max=8;
		}
		ADDRxWRRD:cross ADDR,WR_RD;
	endgroup

	function new(int num=0);
		$display("cov from agent[%0d]",num);
		this.num=num;
		mem_cg=new();
	endfunction

	task run();
		$display("cov from agent[%0d]",num);
		$display("executing coverage functionality at %0t",$time);
		forever begin
			common::mon2cov.get(tx);
			tx.print(num);
			mem_cg.sample();
			->e1;
		end
	endtask
endclass
