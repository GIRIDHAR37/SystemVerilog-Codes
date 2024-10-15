class mem_agent;

	mem_gen gen;
	mem_bfm bfm;

	function new(int num=0);
		gen=new(num);
		bfm=new(num);
	endfunction

	task run();
		fork 
			gen.run();
			bfm.run();
		join
	endtask

endclass
