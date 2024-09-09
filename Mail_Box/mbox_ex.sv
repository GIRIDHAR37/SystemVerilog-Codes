module top;
  
  mailbox mbox=new(); // unbounded
  int in;
  int out;
  
  initial begin
    repeat(5) begin
      #2;
      in=$urandom_range(50,500);
      mbox.put(in);
//	  mbox.try_put(in);
      $display("Time : %0t --> putting element : %0d",$time,in);
    end
  end
  
  initial begin
    repeat(5) begin
      #3;
      mbox.get(out); // blocking functionallity ......
//      mbox.try_get(out); // non blocking functionality .....
      $display("Time : %0t --> getting element : %0d",$time,out);
    end
  end

  
endmodule

// output :
/*

** Without Delays : 

// -> by using put & get methods

# Time : 0 --> putting element : 396
# Time : 0 --> putting element : 351
# Time : 0 --> putting element : 409
# Time : 0 --> putting element : 336
# Time : 0 --> putting element : 411
# Time : 0 --> getting element : 396
# Time : 0 --> getting element : 351
# Time : 0 --> getting element : 409
# Time : 0 --> getting element : 336
# Time : 0 --> getting element : 411

// -> by using put & try_get methods

# Time : 2 --> putting element : 396
# Time : 3 --> getting element : 396
# Time : 4 --> putting element : 351
# Time : 6 --> getting element : 351
# Time : 6 --> putting element : 409
# Time : 8 --> putting element : 336
# Time : 9 --> getting element : 409
# Time : 10 --> putting element : 411
# Time : 12 --> getting element : 336
# Time : 15 --> getting element : 411

// -> by using try_put & get methods

# Time : 2 --> putting element : 396
# Time : 3 --> getting element : 396
# Time : 4 --> putting element : 351
# Time : 6 --> getting element : 351
# Time : 6 --> putting element : 409
# Time : 8 --> putting element : 336
# Time : 9 --> getting element : 409
# Time : 10 --> putting element : 411
# Time : 12 --> getting element : 336
# Time : 15 --> getting element : 411

// -> by using try_put & try_get methods

# Time : 2 --> putting element : 396
# Time : 3 --> getting element : 396
# Time : 4 --> putting element : 351
# Time : 6 --> getting element : 351
# Time : 6 --> putting element : 409
# Time : 8 --> putting element : 336
# Time : 9 --> getting element : 409
# Time : 10 --> putting element : 411
# Time : 12 --> getting element : 336
# Time : 15 --> getting element : 411
*/

