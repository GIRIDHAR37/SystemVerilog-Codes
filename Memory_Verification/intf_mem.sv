interface mem_intf(input bit clk,rst);

	bit valid_i;
	bit wr_rd_i;
	bit [`addr_width-1:0]addr_i;
	bit [`width-1:0]wdata_i;
	bit [`width-1:0]rdata_o;
	bit ready_o;

	clocking mon_cb@(posedge clk);
			default input #0;
	    		input addr_i;
	    		input wr_rd_i;
	    		input wdata_i;
	    		input rdata_o; 
	    		input valid_i;
	    		input ready_o;
		endclocking

		clocking bfm_cb@(posedge clk);
			default input #0 output #1;
	    		output addr_i;
	    		output wr_rd_i;
	    		output wdata_i;
	    		input rdata_o; 
	    		output valid_i;
	    		input ready_o;
		endclocking

		modport bfm_mp(clocking bfm_cb);
		modport mon_mp(clocking mon_cb);
		
endinterface	
