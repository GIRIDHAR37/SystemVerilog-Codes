class sample;
 	
  randc int a[15:0];
  rand  int b[15:0];
  
  constraint ab_c{
    foreach(a[i]){
      a[i] inside{[0:3]};
      a[i]==b[i];
    }
  }
      
      function void print();
    	$display("array a elements : %p\narray b elements : %p",a,b);
    endfunction
    
  endclass
    
 module top;
      sample s;
      initial begin;
        repeat(3) begin
        	s=new();
        	s.randomize();
        	s.print();
        end
      end
      
endmodule

// OUTPUT :
/*
# array a elements : '{3, 3, 2, 3, 3, 1, 1, 1, 0, 1, 2, 1, 1, 0, 3, 0}
# array b elements : '{3, 3, 2, 3, 3, 1, 1, 1, 0, 1, 2, 1, 1, 0, 3, 0}
# array a elements : '{1, 2, 3, 0, 1, 3, 3, 1, 0, 3, 3, 1, 3, 3, 3, 2}
# array b elements : '{1, 2, 3, 0, 1, 3, 3, 1, 0, 3, 3, 1, 3, 3, 3, 2}
# array a elements : '{3, 1, 0, 2, 2, 0, 3, 3, 1, 2, 3, 3, 1, 0, 0, 3}
# array b elements : '{3, 1, 0, 2, 2, 0, 3, 3, 1, 2, 3, 3, 1, 0, 0, 3}
*/
