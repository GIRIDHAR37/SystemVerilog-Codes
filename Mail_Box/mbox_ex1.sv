module mailbox_example;
  // Define a bounded mailbox with size 2
  mailbox mbox = new(2);
  int data;
  
  initial begin
    // Producer Process: Demonstrate put() and try_put()
    repeat(3) begin
      data = $urandom_range(10, 50);
      if (mbox.try_put(data)) // Non-blocking put
        $display("Time: %0t --> try_put success: %0d", $time, data);
      else
        $display("Time: %0t --> try_put failed, mailbox full", $time);
      #1;
    end
  end

  initial begin
    // Consumer Process: Demonstrate get() and try_get()
    #3; // Wait for the producer to put some data
    if (mbox.try_get(data)) // Non-blocking get
      $display("Time: %0t --> try_get success: %0d", $time, data);
    else
      $display("Time: %0t --> try_get failed, mailbox empty", $time);
    
    // Peek and Get Examples
    #2;
    mbox.peek(data); // Non-blocking peek
    $display("Time: %0t --> peeked element: %0d", $time, data);
    
    #1;
    mbox.get(data); // Blocking get
    $display("Time: %0t --> got element: %0d", $time, data);
    
    // Check number of elements
    $display("Time: %0t --> Number of elements in mailbox: %0d", $time, mbox.num());
  end
endmodule

