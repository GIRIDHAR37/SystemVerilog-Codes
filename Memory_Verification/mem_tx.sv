class mem_tx;

	rand bit wr_rd;
	rand bit[`addr_width-1:0]addr;
	rand bit[`width-1:0]data;
	static int count=1;

	function void print(int num);
		$display("-----------------printing %s agent---------------",wr_rd?"write":"read");
		$display("\t count=%0d ",count++);
		$display("\t addr=%0d",addr);
		$display("\t data=%0d",data);
		$display("\t wr_rd=%0d ",wr_rd);
	endfunction

endclass
