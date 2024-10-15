`define addr_width 16
`define width 32

`include "memory.v"
`include "intf_mem.sv"
`include "mem_tx.sv"
`include "common.sv"
`include "mem_mon.sv"
`include "mem_cov.sv"
`include "mem_gen.sv"
`include "mem_bfm.sv"
`include "mem_agent.sv"
`include "mem_env.sv"

module top;

	bit clk,rst;
	int num_tx;
	int num_agents;
	mem_env env;
	event start_env;

	mem_intf pif(clk,rst);

	memory dut(.clk_i(pif.clk),
	           .rst_i(pif.rst),
			   .valid_i(pif.valid_i),
			   .wr_rd_i(pif.wr_rd_i),
			   .addr_i(pif.addr_i),
			   .wdata_i(pif.wdata_i),
			   .rdata_o(pif.rdata_o),
			   .ready_o(pif.ready_o)
			  );


	always #5 clk=~clk;

	initial begin
		rst=1;
		repeat(2) @(posedge clk);
		rst=0;
		->start_env;
	//	env=new();
	end
	
	initial begin
	    assert($value$plusargs("testname=%s",common::testname));
		assert($value$plusargs("num_tx=%0d",num_tx));
		assert($value$plusargs("num_agents=%0d",num_agents));
		common::num_tx=num_tx;
		common::num_agents=num_agents;
		wait(start_env.triggered());
			env=new();
			env.run();
    end

	initial begin
		wait(common::func_start.triggered());
		repeat(2) @(posedge clk);
		$finish();
    end
	
endmodule
