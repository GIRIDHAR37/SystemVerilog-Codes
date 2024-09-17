class rectangle ; 
  rand int length , width; // class properties 
  
  constraint len_wid_c{
    length inside{[0:50]}; 
    width inside{[50:100]};
  }
  
  function void display();
    $display("length : %0d , width : %0d",length,width);
  endfunction
   
  function int area();//class method  
    return length * width ; 
  endfunction 
   
  function int perimeter(); // class method  
    return 2*(length + width ); 
  endfunction  
   
endclass  
 
module tb; 
   
  rectangle rec ;  // class handle  
   
  initial begin  
    rec = new(); // class constructur initial value to defualt  
    //access the class object  
    rec.randomize();
    rec.display();
    $display("area of rectangle : %0d ", rec.area()); 
    $display("perimeter of rectangle : %0d ", 
rec.perimeter());  
 
  end  
endmodule

// output :
/*
# length : 8 , width : 52
# area of rectangle : 416 
# perimeter of rectangle : 120

# length : 5 , width : 98
# area of rectangle : 490 
# perimeter of rectangle : 206
*/

