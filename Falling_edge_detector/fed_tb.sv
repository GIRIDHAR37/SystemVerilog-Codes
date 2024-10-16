`include "fed.sv"

module fed_tb;

  // Declare signals
  logic clk;
  logic signal;
  logic ed;

  // Instantiate the FallingEdgeDetector
  fed dut (
    .clk(clk),
    .signal(signal),
    .ed(ed)
  );

  // Clock generation: 10ns period (100MHz)
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    // Initialize signals
    clk = 0;
    signal = 0;
    #10;  // Wait for a couple of clock cycles

    // Test case 1: No edge (signal stays low)
    signal = 0;
    #20;

    // Test case 2: Rising edge, then falling edge
    signal = 1;
    #20;
    signal = 0;
    #20;

    // Test case 3: Multiple falling edges
    signal = 1;
    #20;
    signal = 0;
    #20;
    signal = 1;
    #20;
    signal = 0;
    #20;

    // Test case 4: Constant high signal (no falling edge)
    signal = 1;
    #30;

    // Finish simulation
    $finish;
  end

  // Monitor changes for debug purposes
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
