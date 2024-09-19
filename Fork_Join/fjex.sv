module example_fork_join_variations;

  initial begin
    $display("Time : %0t Start example with fork-join variations\n",$time);

    // Fork-Join example (wait for all processes to finish)
    $display("Time : %0t Fork-Join Example",$time);
    fork
      // Process 1
      begin
        #5;
        $display("Time : %0t Process 1 (fork-join) done",$time);
      end
      // Process 2
      begin
        #10;
        $display("Time : %0t Process 2 (fork-join) done",$time);
      end
    join
    $display("$Time : %0t All processes (fork-join) completed\n",$time);

    // Fork-Join_any example (wait for any one process to finish)
    $display("Time : %0t Fork-Join_any Example",$time);
    fork
      // Process 1
      begin
        #5;
        $display("Time : %0t Process 1 (fork-join_any) done",$time);
      end
      // Process 2
      begin
        #10;
        $display("Time : %0t Process 2 (fork-join_any) done",$time);
      end
    join_any
    $display("Time : %0t One process (fork-join_any) completed, continuing...\n",$time);

    // Fork-Join_none example (don't wait for any process)
    $display("Time : %0t Fork-Join_none Example",$time);
    fork
      // Process 1
      begin
        #5;
        $display("Time : %0t Process 1 (fork-join_none) done",$time);
      end
      // Process 2
      begin
        #10;
        $display("Time : %0t Process 2 (fork-join_none) done",$time);
      end
    join_none
    $display("Time : %0t Moving on without waiting for any process (fork-join_none)\n",$time);

    // Some delay to allow all fork-join_none processes to complete before ending simulation
    #20;
    $display("Time : %0t Simulation complete.",$time);

  end

endmodule

// output :
/*
# Time : 0 Start example with fork-join variations
# 
# Time : 0 Fork-Join Example
# Time : 5 Process 1 (fork-join) done
# Time : 10 Process 2 (fork-join) done
# $Time : 10 All processes (fork-join) completed
# 
# Time : 10 Fork-Join_any Example
# Time : 15 Process 1 (fork-join_any) done
# Time : 15 One process (fork-join_any) completed, continuing...
# 
# Time : 15 Fork-Join_none Example
# Time : 15 Moving on without waiting for any process (fork-join_none)
# 
# Time : 20 Process 2 (fork-join_any) done
# Time : 20 Process 1 (fork-join_none) done
# Time : 25 Process 2 (fork-join_none) done
# Time : 35 Simulation complete.
*/
