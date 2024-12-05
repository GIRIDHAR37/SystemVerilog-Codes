class apb_cov;
	
	apb_tx tx;
	event g1;

	covergroup apb_cg@(g1);
		
		PSEL_I : coverpoint tx.psel_i{
//			bins psel_bins[] = {[0:1]}; // implicit bins 
			option.auto_bin_max=2;      // explicit bins
			option.at_least=0;
		}

		PENABLE_I : coverpoint tx.penable_i{
//			bins penable_bins[] = {[0:1]}; // implicit bins
			option.auto_bin_max=2;         // explicit bins
			option.at_least=0;
		}

		PWRITE_I : coverpoint tx.pwrite_i{
			bins pwrite_bins[] = {[0:1]}; // implicit bins 
			option.at_least=0;
		}

		PADDR_I : coverpoint tx.paddr_i{
//			bins paddr_bins[] = {[0:31]}; // implicit bins 
			option.auto_bin_max=2;  // explicit bins
		}

		PWDATA_I : coverpoint tx.pwdata_i{ 
			option.auto_bin_max=3;  // explicit bins
		}

		PRDATA_O : coverpoint tx.prdata_o{ 
			option.auto_bin_max=3;  // explicit bins
		}

		PREADY_O : coverpoint tx.pready_o{
			bins pready_bins[] = {[0:1]}; // implicit bins 
			option.at_least=2;
		}

		PSLVERR_O : coverpoint tx.pslverr_o{
			bins pslverr_bins[] = {[0:1]}; // implicit bins
			option.at_least=2;
		}

	endgroup

	function new();
		apb_cg=new();
	endfunction

	task run();
		forever begin
			mon2cov.get(tx);
			tx.print("printing from coverage: ");
			apb_cg.sample();
			->g1;
		end
	endtask
	
endclass
