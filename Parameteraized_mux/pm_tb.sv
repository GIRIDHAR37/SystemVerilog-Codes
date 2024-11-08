`include "pm.v"
`include "pm_if.sv"
`include "pm_tx.sv"
`include "pm_mon.sv"
`include "pm_cov.sv"
`include "pm_gen.sv"
`include "pm_bfm.sv"
`include "pm_agent.sv"
`include "pm_env.sv"

//parameter n_tb=4;

module pm_tb;
	
	parameter n_tb=4;

	pm_env env;
	pm_if pif();

	pm #(.n(n_tb)) dut(.i(pif.i),
					   .s(pif.s),
					   .y(pif.y)
					  );

	initial begin
		env=new();
		env.run();
		#50;
		$finish();
	end
	
endmodule
