class pm_env;

	pm_agent agent;

	function new();
		agent=new();
	endfunction

	task run();
		agent.run();
	endtask

endclass
