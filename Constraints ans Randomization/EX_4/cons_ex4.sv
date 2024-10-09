// Problem :

/* Print gray code array elements ?
*/

class sample;
  
  rand bit [4:0]gray_code_array[];
  
  constraint gray_code_array_c{
  	gray_code_array.size==20;
    foreach(gray_code_array[i]){
      gray_code_array[i] == (i^(i>>1));
    }
  }
      
  function void print();
    $display("printing gray code array elements : %p",gray_code_array);
  endfunction
    
endclass
    
module top;
  
  sample s;
  
  initial begin
    s=new();
    s.randomize();
    s.print();
  end
  
endmodule
    
// output :
    
/*
# printing gray code array elements : '{0, 1, 3, 2, 6, 7, 5, 4, 12, 13, 15, 14, 10, 11, 9, 8, 24, 25, 27, 26}
*/

