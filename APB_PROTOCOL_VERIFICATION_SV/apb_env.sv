class apb_env;
	
	apb_agent agent;

	function new();
		agent=new();
	endfunction

	task run();
		agent.run();
	endtask

endclass
