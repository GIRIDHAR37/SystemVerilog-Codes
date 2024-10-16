module eed (
  input  logic clk,
  input  logic signal,
  output logic ed
);

  logic signalPrev;

  always_ff @(posedge clk) begin
    signalPrev <= signal;
    ed         <= signal ^ signalPrev;
  end

endmodule

// output :
/*
# Time=0 | clk=0 | signal=0 | ed=x
# Time=5 | clk=1 | signal=0 | ed=x
# Time=10 | clk=0 | signal=1 | ed=x
# Time=15 | clk=1 | signal=1 | ed=1
# Time=20 | clk=0 | signal=0 | ed=1
# Time=25 | clk=1 | signal=0 | ed=1
# Time=30 | clk=0 | signal=0 | ed=1
# Time=35 | clk=1 | signal=0 | ed=0
# Time=40 | clk=0 | signal=1 | ed=0
# Time=45 | clk=1 | signal=1 | ed=1
# Time=50 | clk=0 | signal=1 | ed=1
# Time=55 | clk=1 | signal=0 | ed=1
# Time=60 | clk=0 | signal=0 | ed=1
# Time=65 | clk=1 | signal=0 | ed=0
# Time=70 | clk=0 | signal=0 | ed=0
# ** Note: $finish    : eed_tb.sv(34)
#    Time: 75 ns  Iteration: 0  Instance: /eed_tb
*/
