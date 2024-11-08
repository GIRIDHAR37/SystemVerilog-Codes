class pm_cov;

	pm_tx tx;
	event e1;

	covergroup pm_cg@(e1);
		I : coverpoint tx.i{
			option.auto_bin_max=5;
			bins i_inputs[] = {[0:15]};
		}

		S : coverpoint tx.s{
			option.auto_bin_max=5;
			bins selection_inputs[] = {[0:3]};
		}

		Y : coverpoint tx.y{
			bins y_output = {0,1};
		}

		IXSXY : cross I,Y,S;
		
	endgroup

	function new();
		pm_cg=new();
	endfunction

	task run();
		forever begin
			mon2cov.get(tx);
			tx.print();
			pm_cg.sample();
			->e1;
		end
	endtask

endclass
