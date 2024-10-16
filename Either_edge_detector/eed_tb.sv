`include "eed.sv"

module eed_tb;

  // Testbench signals
  logic clk;
  logic signal;
  logic ed;

  // Instantiate the DUT (Device Under Test)
  eed dut (
    .clk(clk),
    .signal(signal),
    .ed(ed)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test stimulus
  initial begin
    // Initialize signal
    signal = 0;
    
    // Apply test vectors
    #10 signal = 1;   // Rising edge of signal
    #10 signal = 0;   // Falling edge of signal
    #20 signal = 1;   // Rising edge of signal
    #15 signal = 0;   // Falling edge of signal
    
    #20 $finish; // End the simulation
  end

  // Monitor outputs
  initial begin
    $monitor("Time=%0t | clk=%b | signal=%b | ed=%b", $time, clk, signal, ed);
  end

/*  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
  end
*/
endmodule
