module pm #(parameter n=2)(input [n-1:0]i, 
						   input [$clog2(n)-1:0]s,
						   output y
						  );

		assign y=(s<=(n-1))?i[s]:0;

endmodule

// output :
/*
# Time : 0 | i :  0100 | s : 01 | y : 0
# Time : 1 | i :  1001 | s : 11 | y : 1
# Time : 2 | i :  1101 | s : 01 | y : 0
# Time : 3 | i :  0101 | s : 10 | y : 1
# Time : 4 | i :  0001 | s : 01 | y : 0
# Time : 5 | i :  0110 | s : 01 | y : 1
# Time : 6 | i :  1101 | s : 00 | y : 1
# Time : 7 | i :  1001 | s : 10 | y : 0
# Time : 8 | i :  0101 | s : 10 | y : 1
# Time : 9 | i :  0101 | s : 11 | y : 0
# Time : 10 | i :  0010 | s : 11 | y : 0
# Time : 11 | i :  0010 | s : 10 | y : 0
# Time : 12 | i :  1000 | s : 01 | y : 0
# Time : 13 | i :  1100 | s : 01 | y : 0
# Time : 14 | i :  1101 | s : 01 | y : 0
# Time : 15 | i :  0011 | s : 10 | y : 0
# Time : 16 | i :  0000 | s : 00 | y : 0
# Time : 17 | i :  1010 | s : 01 | y : 1
# Time : 18 | i :  0110 | s : 11 | y : 0
# Time : 19 | i :  1101 | s : 11 | y : 1
# Time : 20 | i :  1101 | s : 11 | y : 1
# ** Note: $finish    : pm_tb.v(28)
#    Time: 31 ps  Iteration: 0  Instance: /pm_tb
*/
