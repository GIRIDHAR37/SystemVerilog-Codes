class mem_env;
	
	mem_agent agent[];
	mem_mon mon;
	mem_cov cov;

	function new();
		agent=new[common::num_agents];
		$display("num_agents=%0d",common::num_agents);
		$display("num_tx=%0d",common::num_tx);
		mon=new(common::num_agents);
		cov=new(common::num_agents);
		foreach(agent[i])
			agent[i]=new(i);
    endfunction

	task run();
		fork
			mon.run();
			cov.run();
		join_none
		foreach(agent[i])
			begin
				fork 
					begin
						$display("i=%0d",i);
						agent[i].run();
					end
				join_none
				#0;
			end
    endtask

endclass
