`include "red.sv"

module red_tb;

  // Testbench signals
  logic clk;
  logic signal;
  logic ed;

  // Instantiate the RisingEdgeDetector module
  red dut (
    .clk(clk),
    .signal(signal),
    .ed(ed)
  );

  // Clock generation: 10ns period (100 MHz)
  always #5 clk = ~clk;

  // Initial block to apply stimulus
  initial begin
    // Initialize signals
    clk = 0;
    signal = 0;

    // Apply stimulus
    #10 signal = 1;  // Rising edge of signal
    #20 signal = 0;  // Falling edge of signal
    #20 signal = 1;  // Another rising edge
    #20 signal = 0;  // Falling edge
    #30 signal = 1;  // Another rising edge after a delay
    #30 $finish;     // End simulation
  end

  // Monitor changes to signals
  initial begin
    $monitor("Time : %0t clk = %b, signal = %b, ed = %b",$time, clk, signal, ed);
  end
/*  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
  end
*/
endmodule
