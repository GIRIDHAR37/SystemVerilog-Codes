class apb_gen;

	apb_tx tx,tx_p;

	static string test_name="apb_base_test";

	task run();
		case(test_name)

			"apb_base_test" : begin
// write_operation and testing slave error feature 
				repeat(20) begin
					tx=new();
					assert(tx.randomize() with{tx.psel_i==1'b1;tx.penable_i==1'b0;tx.pwrite_i==1'b1;});
					tx_p=new tx;
					gen2bfm.put(tx);
					tx.print("printing write transaction from generator : ");
// read_operation and testing slave error feature 
					tx=new();
					assert(tx.randomize() with{tx_p.paddr_i==tx.paddr_i;tx.psel_i==1'b1;tx.penable_i==1'b1;tx.pwrite_i==1'b0;});
					gen2bfm.put(tx);
					tx.print("printing read transaction from generator : ");
				end
			end

			"apb_overflow":begin
			    repeat(20) begin
				    tx = new();
					assert(tx.randomize() with{tx.psel_i==1'b1;tx.penable_i==1'b0;tx.pwrite_i==1'b1;});
					gen2bfm.put(tx);
					tx.print("printing Write transaction with overflow");	
				end
			end
			
			"apb_underflow":begin
			    repeat(20) begin
				    tx = new();
					assert(tx.randomize() with{tx.psel_i==1'b1;tx.penable_i==1'b0;tx.pwrite_i==1'b0;});
					gen2bfm.put(tx);
					tx.print("printing Read transaction with Underflow");	
				end
			end

			"apb_invalid_address" : begin
				repeat(20)begin
				    tx = new();
					assert(tx.randomize() with {tx.psel_i == 1'b1; tx.penable_i == 1'b0; tx.pwrite_i == 1'b1; tx.paddr_i >= `MEM_DEPTH; });
					gen2bfm.put(tx);
					tx.print("Invalied Address case from generator");
				end
			end
			
		endcase
	endtask

endclass
