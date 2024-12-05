mailbox gen2bfm=new();
mailbox mon2cov=new();

class apb_agent;

	apb_gen gen;
	apb_bfm bfm;
	apb_mon mon;
	apb_cov cov;

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

