class mem_gen;

	mem_tx tx,tx_t;
	mem_tx txq[$];
	int num;

	function new(int num=0);
		$display("gen from agent[%0d]",num);
		this.num=num;
	endfunction
	
	task run();
		case(common::testname)
			"wr_rd_test":begin
				tx=new();
				assert(tx.randomize()with{tx.wr_rd==1;}); //write tx
				tx_t=new tx;
				common::gen2bfm.put(tx);
				tx=new();
				assert(tx.randomize()with{tx.wr_rd==0;tx.addr==tx_t.addr;}); //read tx
				common::gen2bfm.put(tx);
			end
			"n_wr_rd_test":begin
				repeat(common::num_tx)begin
					tx=new();
					assert(tx.randomize()with{tx.wr_rd==1;}); //write tx
					tx_t=new tx;
					common::gen2bfm.put(tx);
					tx=new();
					assert(tx.randomize()with{tx.wr_rd==0;tx.addr==tx_t.addr;}); //read tx
					common::gen2bfm.put(tx);
				end
			end
			"n_wr_n_rd_test":begin
				repeat(common::num_tx)begin//generating write txs
					tx=new();
					assert(tx.randomize()with{tx.wr_rd==1;}); //write tx
					tx_t=new tx;
					txq.push_back(tx_t);
					common::gen2bfm.put(tx);
				end
				repeat(common::num_tx)begin//generating read txs
					tx=new();
					tx_t=txq.pop_front();
					assert(tx.randomize()with{tx.wr_rd==0;tx.addr==tx_t.addr;}); //read tx
					common::gen2bfm.put(tx);
				end
			end
		endcase
	endtask

endclass
