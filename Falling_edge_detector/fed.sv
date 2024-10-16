module fed(
  input  logic clk,
  input  logic signal,
  output logic ed
);

  logic signalPrev;

  always_ff @(posedge clk) begin
    signalPrev <= signal;
    ed       <= (!signal && signalPrev);
  end

endmodule

// output :
/*
# Time=0 | clk=0 | signal=0 | ed=x
# Time=5 | clk=1 | signal=0 | ed=x
# Time=10 | clk=0 | signal=0 | ed=x
# Time=15 | clk=1 | signal=0 | ed=0
# Time=20 | clk=0 | signal=0 | ed=0
# Time=25 | clk=1 | signal=0 | ed=0
# Time=30 | clk=0 | signal=1 | ed=0
# Time=35 | clk=1 | signal=1 | ed=0
# Time=40 | clk=0 | signal=1 | ed=0
# Time=45 | clk=1 | signal=1 | ed=0
# Time=50 | clk=0 | signal=0 | ed=0
# Time=55 | clk=1 | signal=0 | ed=1
# Time=60 | clk=0 | signal=0 | ed=1
# Time=65 | clk=1 | signal=0 | ed=0
# Time=70 | clk=0 | signal=1 | ed=0
# Time=75 | clk=1 | signal=1 | ed=0
# Time=80 | clk=0 | signal=1 | ed=0
# Time=85 | clk=1 | signal=1 | ed=0
# Time=90 | clk=0 | signal=0 | ed=0
# Time=95 | clk=1 | signal=0 | ed=1
# Time=100 | clk=0 | signal=0 | ed=1
# Time=105 | clk=1 | signal=0 | ed=0
# Time=110 | clk=0 | signal=1 | ed=0
# Time=115 | clk=1 | signal=1 | ed=0
# Time=120 | clk=0 | signal=1 | ed=0
# Time=125 | clk=1 | signal=1 | ed=0
# Time=130 | clk=0 | signal=0 | ed=0
# Time=135 | clk=1 | signal=0 | ed=1
# Time=140 | clk=0 | signal=0 | ed=1
# Time=145 | clk=1 | signal=0 | ed=0
# Time=150 | clk=0 | signal=1 | ed=0
# Time=155 | clk=1 | signal=1 | ed=0
# Time=160 | clk=0 | signal=1 | ed=0
# Time=165 | clk=1 | signal=1 | ed=0
# Time=170 | clk=0 | signal=1 | ed=0
# Time=175 | clk=1 | signal=1 | ed=0
# ** Note: $finish    : testbench.sv(52)
#    Time: 180 ns  Iteration: 0  Instance: /fed_tb
*/
