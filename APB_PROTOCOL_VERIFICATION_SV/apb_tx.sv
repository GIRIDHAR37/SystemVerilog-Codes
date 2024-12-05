class apb_tx;
	
	rand bit psel_i;
	rand bit penable_i;
	rand bit pwrite_i;
	rand bit [`ADDR_WIDTH-1:0]paddr_i;
	rand bit [`WIDTH-1:0]pwdata_i;
		 bit [`WIDTH-1:0]prdata_o;
		 bit pready_o;
		 bit pslverr_o;

	constraint paddr_i_c{
		paddr_i dist {[0:4]:=3,[5:10]:=5,[11:15]:=7};
//		foreach(paddr_i[i]){
//			paddr_i[i] inside {[0:15]};
//		}
	}

	function void print(string name);
		$display("printing from %s : ",name);
//		$display("printing ",pwrite_i?"write transaction : ":"read transaction : ");
		$display("\n psel_i : %b",psel_i);
		$display("\n penable_i : %b",penable_i);
		$display("\n pwrite_i : %b",pwrite_i);
		$display("\n paddr_i : %0h",paddr_i);
		$display("\n pwdata_i : %0h",pwdata_i);
		$display("\n prdata_o : %0h",prdata_o);
		$display("\n pready_o : %b",pready_o);
		$display("\n pslv_err_o : %b\n",pslverr_o);
	endfunction

endclass
