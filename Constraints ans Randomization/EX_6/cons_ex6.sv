/*
PROBLEM : write a constraint to get the random no from 0 to 100 such that no will not repeat. (Without using unique and randc)
*/

// CODE : 


class sample;
  
  rand bit[7:0] arr[];
  
  constraint arr_c{
    arr.size()==15;
    foreach(arr[i]){
      arr[i] inside {[0:100]}; 
      if (i > 0) {
        foreach (arr[j]) {          
			if (j < i) 
				arr[i] != arr[j]; 
        }
      }
    }
  }
      
      function void print();
    	$display("printing array elements : %p",arr);
	  endfunction
    
endclass
    
 module top;
   
   sample s;
   
   initial begin
     $display("/*");
     repeat(5) begin
     	s=new();
     	s.randomize();
     	s.print();
     end
     $display("*/");
   end
   
 endmodule
    
// RESULT :

/*
printing array elements : '{79, 74, 4, 20, 26, 53, 100, 5, 43, 90, 91, 99, 87, 83, 7}
# printing array elements : '{57, 12, 10, 49, 25, 42, 68, 19, 26, 17, 55, 85, 8, 2, 87}
# printing array elements : '{53, 54, 6, 68, 76, 33, 78, 62, 95, 66, 20, 83, 89, 64, 90}
# printing array elements : '{41, 43, 21, 23, 55, 67, 17, 75, 90, 50, 64, 16, 5, 80, 61}
# printing array elements : '{28, 77, 16, 73, 18, 8, 59, 34, 58, 29, 52, 46, 13, 45, 82}
*/

