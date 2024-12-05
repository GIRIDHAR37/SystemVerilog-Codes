`define WIDTH 8
`define ADDR_WIDTH $clog2(MEM_DEPTH)
`define MEM_DEPTH 16

typedef class apb_env;
typedef class apb_agent;
typedef class apb_gen;
typedef class apb_bfm;
typedef class apb_mon;
typedef class apb_cov;
typedef class apb_tx;

`include "apb_if.sv"
`include "apb_tx.sv"
`include "apb_mon.sv"
`include "apb_cov.sv"
`include "apb_bfm.sv"
`include "apb_gen.sv"
`include "apb_agent.sv"
`include "apb_env.sv"
`include "apb.v"

module apb_tb;

	bit pclk_i,presetn_i;
	apb_env env;

	apb_if pif(pclk_i,presetn_i);

	apb dut(.pclk_i(pif.pclk_i),
			.presetn_i(pif.presetn_i),
			.psel_i(pif.psel_i),
			.penable_i(pif.penable_i),
			.pwrite_i(pif.pwrite_i),
			.paddr_i(pif.paddr_i),
			.pwdata_i(pif.pwdata_i),
			.prdata_o(pif.prdata_o),
			.pready_o(pif.pready_o),
			.pslverr_o(pif.pslverr_o)
	);

	initial begin 
		presetn_i=0;
		pclk_i=0;
		repeat(2) @(posedge pclk_i);
		presetn_i=1;
	end

	initial begin
		assert($value$plusargs("testname=%s",apb_gen::test_name));
		env=new();
		env.run();
	end
	
	always #5 pclk_i=~pclk_i;

	initial begin
		#2000;
		$finish();
	end

endmodule
