class example;
  
  rand logic a[];
  
  constraint a_c{
    a.size()==10;
    foreach(a[i]){
      a[i] inside{[0:1]};
    }
  }
  
  function void post_randomize();
    foreach(a[i]) begin
     if(a[i]==1)
       a[i]=1'bx;
     else 
       a[i]=1'bz;
    end
  endfunction
          
  function void print();
      $display("Array a : %p",a);
  endfunction
      
endclass
 
module top;
  
  example ex=new();
  
  initial begin
    repeat(5) begin
      ex.randomize();
      ex.print;
    end
  end
  
endmodule
    
// output :
/*
# Array a : '{x, z, z, x, x, x, z, x, z, z}
# Array a : '{x, x, x, x, z, x, z, z, z, z}
# Array a : '{x, x, z, z, z, z, z, z, x, x}
# Array a : '{x, z, x, x, x, z, z, z, x, x}
# Array a : '{x, z, x, z, x, x, x, x, z, z}
*/

