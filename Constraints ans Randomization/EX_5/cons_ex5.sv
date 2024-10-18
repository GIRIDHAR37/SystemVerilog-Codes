// Problem :

/* Print  array elements in this format : 7,77,777,7777,77777,.... ?
*/

class sample;
  
  rand longint longintA[];
  
  constraint longintA_c{
  	longintA.size==15;
    foreach(longintA[i]){
      if(i==0)
	  	longintA[i]==7;
	  else if(i>0)
	  	longintA[i]==(longintA[i-1]*10)+7;
    }
  }
      
  function void print();
    $display("printing longintA array elements : %p",longintA);
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
# printing longintA array elements : '{7, 77, 777, 7777, 77777, 777777, 7777777, 77777777, 777777777, 7777777777, 77777777777, 777777777777, 7777777777777, 77777777777777, 777777777777777}
*/

