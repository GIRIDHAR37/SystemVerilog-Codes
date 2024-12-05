class apb_mon;
	
	apb_tx tx;
	virtual apb_if vif;

	function new();
		vif=apb_tb.pif;
	endfunction 

	task run();
		forever begin
			@(vif.cb_mon);
			tx=new();
			if(vif.cb_mon.psel_i==1'b1 && vif.cb_mon.penable_i==1'b1) begin
				tx.pwrite_i=vif.cb_mon.pwrite_i;
				if(tx.pwrite_i) begin
					tx.pwdata_i=vif.cb_mon.pwdata_i;
					tx.pready_o=vif.cb_mon.pready_o;
					tx.pslverr_o=vif.cb_mon.pslverr_o;
				end
				else begin
					tx.prdata_o=vif.cb_mon.prdata_o;
					tx.pready_o=vif.cb_mon.pready_o;
					tx.pslverr_o=vif.cb_mon.pslverr_o;
				end
			end
			mon2cov.put(tx);
			#1;
			tx.print("printing from monitor : ");
		end
	endtask

endclass
