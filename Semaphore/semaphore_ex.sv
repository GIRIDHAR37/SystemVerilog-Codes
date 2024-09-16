module top;
  // Declare semaphore with 1 key, representing one resource (memory access)
  semaphore smp = new(1);

  // First process tries to access the memory using blocking get()
  initial begin
    #5;  // Wait for some time
    smp.get(1);  // Process#1 gets the key from the semaphore (access the memory)
    $display("%0t: Process#1 is writing to the memory", $time);
    #20;  // Simulate memory access time
    $display("%0t: Process#1 has completed writing to the memory", $time);
    smp.put(1);  // Process#1 returns the key (releases the resource)
  end

  // Second process tries to access the memory using try_get() (non-blocking)
  initial begin
    #2;  // Start after some time
    if (smp.try_get(1)) begin
      $display("%0t: Process#2 successfully acquired the key and is writing to the memory", $time);
      #20;  // Simulate memory access time
      $display("%0t: Process#2 has completed writing to the memory", $time);
      smp.put(1);  // Process#2 returns the key (releases the resource)
    end else begin
      $display("%0t: Process#2 could not acquire the key and will continue without accessing the memory", $time);
    end
  end
endmodule

// output :
/*
# 2: Process#2 successfully acquired the key and is writing to the memory
# 22: Process#2 has completed writing to the memory
# 22: Process#1 is writing to the memory
# 42: Process#1 has completed writing to the memory
*/
