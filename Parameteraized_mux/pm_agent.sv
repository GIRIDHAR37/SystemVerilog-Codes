mailbox gen2bfm=new();
mailbox mon2cov=new();

class pm_agent;
	
	pm_gen gen;
	pm_bfm bfm;
	pm_mon mon;
	pm_cov cov;

	function new();
		gen=new();
		bfm=new();
		mon=new();
		cov=new();
	endfunction

	task run();
		fork 
			gen.run();
			bfm.run();
			mon.run();
			cov.run();
		join
	endtask

endclass
