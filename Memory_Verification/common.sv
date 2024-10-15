class common;
	
	static mailbox gen2bfm=new();
	static mailbox mon2cov=new();
	static event func_start;
	static int drive_done;
	static string testname="n_wr_n_rd_test";
	static int num_tx=15;
	static int num_agents=1;
	static semaphore smp=new(1);

endclass
