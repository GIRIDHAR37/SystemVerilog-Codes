module memory (clk_i, rst_i, valid_i, wr_rd_i,addr_i,wdata_i,rdata_o,ready_o); 

	parameter WIDTH = 16;
	parameter DEPTH = 512;
	parameter ADDR_WIDTH = $clog2(DEPTH);

	input clk_i, rst_i, valid_i, wr_rd_i;
    input [ADDR_WIDTH-1:0] addr_i;
    input [WIDTH-1:0] wdata_i;
    output reg [WIDTH-1:0] rdata_o;
    output reg ready_o;

	reg [WIDTH-1:0] mem [DEPTH-1:0];

	integer i;

	always @(posedge clk_i or posedge rst_i) begin
    	if (rst_i) begin
        	for (i=0; i<DEPTH; i=i+1) begin
            	mem[i] = 0;
        	end
        	rdata_o <= 0;
        	ready_o <= 0;
    	end 
		else begin
        	if (valid_i) begin
            	ready_o <= 1;
            	if (wr_rd_i) begin
                	if (addr_i < DEPTH) begin
                    	mem[addr_i] <= wdata_i; // writing data into memory
                	end
            	end 
				else begin
                	if (addr_i < DEPTH) begin
                    	rdata_o <= mem[addr_i]; // reading from memory
                	end
            	end
        	end 
			else begin
            	ready_o <= 0;
        	end
    	end
	end

endmodule

// output :
/*
# num_agents=3
# num_tx=10
# mon from agent[3]
# cov from agent[3]
# gen from agent[0]
# bfm from agent[0]
# gen from agent[1]
# bfm from agent[1]
# gen from agent[2]
# bfm from agent[2]
# i=0
# from bfm 15 
# 
# 
# mon from agent[3]
# executing monitor on memory
# cov from agent[3]
# executing coverage functionality at 15
# i=1
# from bfm 15 
# 
# 
# i=2
# from bfm 15 
# 
# 
# from bfm 25 
# 
# 
# valid tx detected 25
# -----------------printing write agent---------------
# 	 count=1 
# 	 addr=27343
# 	 data=3621531314
# 	 wr_rd=1 
# from bfm 45 
# 
# 
# valid tx detected 45
# -----------------printing  read agent---------------
# 	 count=2 
# 	 addr=27343
# 	 data=11954
# 	 wr_rd=0 
# from bfm 65 
# 
# 
# valid tx detected 65
# -----------------printing write agent---------------
# 	 count=3 
# 	 addr=33958
# 	 data=1674742207
# 	 wr_rd=1 
# from bfm 85 
# 
# 
# valid tx detected 85
# -----------------printing  read agent---------------
# 	 count=4 
# 	 addr=33958
# 	 data=35263
# 	 wr_rd=0 
# from bfm 105 
# 
# 
# valid tx detected 105
# -----------------printing write agent---------------
# 	 count=5 
# 	 addr=25735
# 	 data=3092382247
# 	 wr_rd=1 
# from bfm 125 
# 
# 
# valid tx detected 125
# -----------------printing  read agent---------------
# 	 count=6 
# 	 addr=25735
# 	 data=551
# 	 wr_rd=0 
# from bfm 145 
# 
# 
# valid tx detected 145
# -----------------printing write agent---------------
# 	 count=7 
# 	 addr=61265
# 	 data=1864271087
# 	 wr_rd=1 
# from bfm 165 
# 
# 
# valid tx detected 165
# -----------------printing  read agent---------------
# 	 count=8 
# 	 addr=61265
# 	 data=34031
# 	 wr_rd=0 
# from bfm 185 
# 
# 
# valid tx detected 185
# -----------------printing write agent---------------
# 	 count=9 
# 	 addr=17820
# 	 data=674347868
# 	 wr_rd=1 
# from bfm 205 
# 
# 
# valid tx detected 205
# -----------------printing  read agent---------------
# 	 count=10 
# 	 addr=17820
# 	 data=47964
# 	 wr_rd=0 
# from bfm 225 
# 
# 
# valid tx detected 225
# -----------------printing write agent---------------
# 	 count=11 
# 	 addr=58862
# 	 data=960664920
# 	 wr_rd=1 
# from bfm 245 
# 
# 
# valid tx detected 245
# -----------------printing  read agent---------------
# 	 count=12 
# 	 addr=58862
# 	 data=38232
# 	 wr_rd=0 
# from bfm 265 
# 
# 
# valid tx detected 265
# -----------------printing write agent---------------
# 	 count=13 
# 	 addr=36009
# 	 data=349557936
# 	 wr_rd=1 
# from bfm 285 
# 
# 
# valid tx detected 285
# -----------------printing  read agent---------------
# 	 count=14 
# 	 addr=36009
# 	 data=54448
# 	 wr_rd=0 
# from bfm 305 
# 
# 
# valid tx detected 305
# -----------------printing write agent---------------
# 	 count=15 
# 	 addr=3869
# 	 data=2148617747
# 	 wr_rd=1 
# from bfm 325 
# 
# 
# valid tx detected 325
# -----------------printing  read agent---------------
# 	 count=16 
# 	 addr=3869
# 	 data=19987
# 	 wr_rd=0 
# from bfm 345 
# 
# 
# valid tx detected 345
# -----------------printing write agent---------------
# 	 count=17 
# 	 addr=4375
# 	 data=4004755610
# 	 wr_rd=1 
# from bfm 365 
# 
# 
# valid tx detected 365
# -----------------printing  read agent---------------
# 	 count=18 
# 	 addr=4375
# 	 data=47258
# 	 wr_rd=0 
# from bfm 385 
# 
# 
# valid tx detected 385
# -----------------printing write agent---------------
# 	 count=19 
# 	 addr=18286
# 	 data=3708101104
# 	 wr_rd=1 
# from bfm 405 
# 
# 
# valid tx detected 405
# -----------------printing  read agent---------------
# 	 count=20 
# 	 addr=18286
# 	 data=8688
# 	 wr_rd=0 
# from bfm 425 
# 
# 
# valid tx detected 425
# -----------------printing write agent---------------
# 	 count=21 
# 	 addr=44749
# 	 data=1266273741
# 	 wr_rd=1 
# from bfm 445 
# 
# 
# valid tx detected 445
# -----------------printing  read agent---------------
# 	 count=22 
# 	 addr=44749
# 	 data=52685
# 	 wr_rd=0 
# from bfm 465 
# 
# 
# valid tx detected 465
# -----------------printing write agent---------------
# 	 count=23 
# 	 addr=7830
# 	 data=637450299
# 	 wr_rd=1 
# from bfm 485 
# 
# 
# valid tx detected 485
# -----------------printing  read agent---------------
# 	 count=24 
# 	 addr=7830
# 	 data=47163
# 	 wr_rd=0 
# from bfm 505 
# 
# 
# valid tx detected 505
# -----------------printing write agent---------------
# 	 count=25 
# 	 addr=46239
# 	 data=2525418955
# 	 wr_rd=1 
# from bfm 525 
# 
# 
# valid tx detected 525
# -----------------printing  read agent---------------
# 	 count=26 
# 	 addr=46239
# 	 data=54731
# 	 wr_rd=0 
# from bfm 545 
# 
# 
# valid tx detected 545
# -----------------printing write agent---------------
# 	 count=27 
# 	 addr=39862
# 	 data=1852269369
# 	 wr_rd=1 
# from bfm 565 
# 
# 
# valid tx detected 565
# -----------------printing  read agent---------------
# 	 count=28 
# 	 addr=39862
# 	 data=25401
# 	 wr_rd=0 
# from bfm 585 
# 
# 
# valid tx detected 585
# -----------------printing write agent---------------
# 	 count=29 
# 	 addr=4827
# 	 data=1077287681
# 	 wr_rd=1 
# from bfm 605 
# 
# 
# valid tx detected 605
# -----------------printing  read agent---------------
# 	 count=30 
# 	 addr=4827
# 	 data=6913
# 	 wr_rd=0 
# from bfm 625 
# 
# 
# valid tx detected 625
# -----------------printing write agent---------------
# 	 count=31 
# 	 addr=62147
# 	 data=3924902855
# 	 wr_rd=1 
# from bfm 645 
# 
# 
# valid tx detected 645
# -----------------printing  read agent---------------
# 	 count=32 
# 	 addr=62147
# 	 data=17351
# 	 wr_rd=0 
# from bfm 665 
# 
# 
# valid tx detected 665
# -----------------printing write agent---------------
# 	 count=33 
# 	 addr=14277
# 	 data=3922888522
# 	 wr_rd=1 
# from bfm 685 
# 
# 
# valid tx detected 685
# -----------------printing  read agent---------------
# 	 count=34 
# 	 addr=14277
# 	 data=34634
# 	 wr_rd=0 
# from bfm 705 
# 
# 
# valid tx detected 705
# -----------------printing write agent---------------
# 	 count=35 
# 	 addr=27014
# 	 data=2214776292
# 	 wr_rd=1 
# from bfm 725 
# 
# 
# valid tx detected 725
# -----------------printing  read agent---------------
# 	 count=36 
# 	 addr=27014
# 	 data=52708
# 	 wr_rd=0 
# from bfm 745 
# 
# 
# valid tx detected 745
# -----------------printing write agent---------------
# 	 count=37 
# 	 addr=45712
# 	 data=2128562965
# 	 wr_rd=1 
# from bfm 765 
# 
# 
# valid tx detected 765
# -----------------printing  read agent---------------
# 	 count=38 
# 	 addr=45712
# 	 data=19221
# 	 wr_rd=0 
# from bfm 785 
# 
# 
# valid tx detected 785
# -----------------printing write agent---------------
# 	 count=39 
# 	 addr=1442
# 	 data=642560164
# 	 wr_rd=1 
# from bfm 805 
# 
# 
# valid tx detected 805
# -----------------printing  read agent---------------
# 	 count=40 
# 	 addr=1442
# 	 data=45220
# 	 wr_rd=0 
# from bfm 825 
# 
# 
# valid tx detected 825
# -----------------printing write agent---------------
# 	 count=41 
# 	 addr=28357
# 	 data=3862342769
# 	 wr_rd=1 
# from bfm 845 
# 
# 
# valid tx detected 845
# -----------------printing  read agent---------------
# 	 count=42 
# 	 addr=28357
# 	 data=44145
# 	 wr_rd=0 
# from bfm 865 
# 
# 
# valid tx detected 865
# -----------------printing write agent---------------
# 	 count=43 
# 	 addr=49061
# 	 data=4140707645
# 	 wr_rd=1 
# from bfm 885 
# 
# 
# valid tx detected 885
# -----------------printing  read agent---------------
# 	 count=44 
# 	 addr=49061
# 	 data=12093
# 	 wr_rd=0 
# from bfm 905 
# 
# 
# valid tx detected 905
# -----------------printing write agent---------------
# 	 count=45 
# 	 addr=38538
# 	 data=861011838
# 	 wr_rd=1 
# from bfm 925 
# 
# 
# valid tx detected 925
# -----------------printing  read agent---------------
# 	 count=46 
# 	 addr=38538
# 	 data=65406
# 	 wr_rd=0 
# from bfm 945 
# 
# 
# valid tx detected 945
# -----------------printing write agent---------------
# 	 count=47 
# 	 addr=64406
# 	 data=2754168659
# 	 wr_rd=1 
# from bfm 965 
# 
# 
# valid tx detected 965
# -----------------printing  read agent---------------
# 	 count=48 
# 	 addr=64406
# 	 data=18259
# 	 wr_rd=0 
# from bfm 985 
# 
# 
# valid tx detected 985
# -----------------printing write agent---------------
# 	 count=49 
# 	 addr=55067
# 	 data=4100366506
# 	 wr_rd=1 
# from bfm 1005 
# 
# 
# valid tx detected 1005
# -----------------printing  read agent---------------
# 	 count=50 
# 	 addr=55067
# 	 data=41130
# 	 wr_rd=0 
# from bfm 1025 
# 
# 
# valid tx detected 1025
# -----------------printing write agent---------------
# 	 count=51 
# 	 addr=61651
# 	 data=2457621692
# 	 wr_rd=1 
# from bfm 1045 
# 
# 
# valid tx detected 1045
# -----------------printing  read agent---------------
# 	 count=52 
# 	 addr=61651
# 	 data=21692
# 	 wr_rd=0 
# from bfm 1065 
# 
# 
# valid tx detected 1065
# -----------------printing write agent---------------
# 	 count=53 
# 	 addr=5314
# 	 data=2558396789
# 	 wr_rd=1 
# from bfm 1085 
# 
# 
# valid tx detected 1085
# -----------------printing  read agent---------------
# 	 count=54 
# 	 addr=5314
# 	 data=2421
# 	 wr_rd=0 
# from bfm 1105 
# 
# 
# valid tx detected 1105
# -----------------printing write agent---------------
# 	 count=55 
# 	 addr=12650
# 	 data=1830414689
# 	 wr_rd=1 
# from bfm 1125 
# 
# 
# valid tx detected 1125
# -----------------printing  read agent---------------
# 	 count=56 
# 	 addr=12650
# 	 data=59745
# 	 wr_rd=0 
# from bfm 1145 
# 
# 
# valid tx detected 1145
# -----------------printing write agent---------------
# 	 count=57 
# 	 addr=60562
# 	 data=605360796
# 	 wr_rd=1 
# valid tx detected 1165
# -----------------printing  read agent---------------
# 	 count=58 
# 	 addr=60562
# 	 data=4764
# 	 wr_rd=0 
# ** Note: $finish    : top.sv(60)
#    Time: 1185 ns  Iteration: 1  Instance: /top
# 1
# Break in Module top at top.sv line 60
*/

