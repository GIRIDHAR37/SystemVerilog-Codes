class apb_bfm;

	apb_tx tx;
	virtual apb_if vif;

	function new();
		vif=apb_tb.pif;
	endfunction

	task run();
		forever begin
			gen2bfm.get(tx);
			drive_tx(tx);
			tx.print("printing drive transaction from bfm");
			#1;
		end
	endtask

	task drive_tx(apb_tx tx);
// Setup phase
    	@(vif.cb_bfm);
    	vif.cb_bfm.psel_i    <= 1'b1;       
    	vif.cb_bfm.penable_i <= 1'b0;       
    	vif.cb_bfm.paddr_i   <= tx.paddr_i; 
    	vif.cb_bfm.pwrite_i  <= tx.pwrite_i;
    	if (tx.pwrite_i) begin
// Write operation
        	vif.cb_bfm.pwdata_i <= tx.pwdata_i;  
		end
		else begin
// read operation
			tx.prdata_o <= vif.cb_bfm.prdata_o;
		end
// Enable phase
    	@(vif.cb_bfm);
    	vif.cb_bfm.penable_i <= 1'b1;  
		wait(vif.cb_bfm.pready_o == 1'b1); 
// Return to idle
    	@(vif.cb_bfm);
    	vif.cb_bfm.psel_i    <= 1'b0;  
    	vif.cb_bfm.penable_i <= 1'b0;  
	endtask
	
endclass
