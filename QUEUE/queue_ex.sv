class queue_ex;
  
  rand int queue[$];
  
  constraint queue_c{
    queue.size()==20;
    foreach(queue[i]){
      queue[i] inside {[100:200]};
      queue[i]%5==0;
    }
    unique{queue};
  }
      
  function void print();
    if(queue.size()==0)
      $display("Queue is empty");
    else
      $display("filled elements in queue : %p",queue);
  endfunction
    
endclass
    
module top;
  
  queue_ex Q;
  int queue[$:14];
  
  initial begin
    Q=new();
    Q.print();
    repeat(3) begin
      Q.randomize();
      Q.print();
    end
    Q.randomize();
    $display("Printing queue elements before shuffling : ");
    Q.print();
    Q.queue.shuffle();
    $display("Printing queue elements after shuffling : ");
    Q.print();
    Q.randomize();
    $display("Printing queue elements before reversing : ");
    Q.print();
    Q.queue.reverse();
    $display("Printing queue elements after reversing : ");
    Q.print();
    
    $display("size of queue : %0d",queue.size());
/*    
    foreach(queue[i]) begin
      if(i%2==0)
        queue.push_back(i);
      else
        queue.push_back(0);
    end
*/
    
// pushing elements from back (right)
    for(int i=0;i<=queue.size();i++) begin
      if(i%2==0)
        queue.push_back(i);
      else
        queue.push_back(32'd0);
    end
    
    $display("size of queue : %0d",queue.size());
      
    $display("pushed elements from back (right) in queue : %p",queue);

// poping elements from front (left)
    for(int i=0;i<5;i++) begin
      queue.pop_front();
    end
    
    $display("size of queue : %0d",queue.size());
      
    $display("after poped elements from front (left) remaining elements in queue : %p",queue);

//  pushing elements from front (left)    
    for(int i=0;i<=queue.size();i++) begin
      if(i%2==0)
        queue.push_front(32'd0);
      else begin
        queue.push_front(i);
      end
    end
    
    $display("size of queue : %0d",queue.size());
      
    $display("pushed elements from front (left) in queue : %p",queue);
    
// poping elements from back (right)
    for(int i=0;i<5;i++) begin
      queue.pop_back();
    end
    
    $display("size of queue : %0d",queue.size());
      
    $display("after poped elements from back (right) remaining elements in queue : %p",queue);
    
// inserting element at particular index 
    queue.insert(5,7);
    
    $display("size of queue : %0d",queue.size());
      
    $display("printing elements in queue after inserting an element in particular index : %p",queue);
    
// deleting element at particular index 
    queue.delete(7);
    
    $display("size of queue : %0d",queue.size());
      
    $display("printing elements in queue after deleting an element in particular index : %p",queue);
    
    #1;
// if we didn't mention delay the queue will delete only one element at last index and display size and elements according to the compiler mention delay 
    
// deleting whole queue 
    queue.delete();
    
    $display("size of queue : %0d",queue.size());
      
    $display("printing elements in queue after deleting whole queue : %p",queue);
    
  end

endmodule

// ouptut :
/*
# Queue is empty
# filled elements in queue : '{110, 155, 150, 185, 105, 195, 100, 130, 160, 145, 180, 140, 135, 115, 170, 175, 190, 200, 125, 165}
# filled elements in queue : '{155, 100, 120, 115, 130, 165, 170, 140, 145, 110, 135, 105, 180, 200, 150, 190, 195, 125, 175, 185}
# filled elements in queue : '{180, 170, 130, 155, 110, 100, 165, 140, 135, 115, 190, 150, 185, 105, 120, 175, 200, 160, 195, 125}
# Printing queue elements before shuffling : 
# filled elements in queue : '{130, 115, 135, 165, 185, 145, 160, 110, 100, 120, 195, 155, 175, 190, 170, 140, 105, 125, 200, 150}
# Printing queue elements after shuffling : 
# filled elements in queue : '{190, 140, 100, 145, 160, 120, 175, 105, 195, 135, 125, 130, 110, 165, 170, 150, 185, 115, 155, 200}
# Printing queue elements before reversing : 
# filled elements in queue : '{195, 185, 175, 180, 115, 125, 110, 160, 130, 155, 165, 145, 190, 120, 135, 140, 200, 105, 150, 100}
# Printing queue elements after reversing : 
# filled elements in queue : '{100, 150, 105, 200, 140, 135, 120, 190, 145, 165, 155, 130, 160, 110, 125, 115, 180, 175, 185, 195}
# size of queue : 0
# size of queue : 15
# pushed elements from back (right) in queue : '{0, 0, 2, 0, 4, 0, 6, 0, 8, 0, 10, 0, 12, 0, 14}
# size of queue : 10
# after poped elements from front (left) remaining elements in queue : '{0, 6, 0, 8, 0, 10, 0, 12, 0, 14}
# size of queue : 15
# pushed elements from front (left) in queue : '{0, 3, 0, 1, 0, 0, 6, 0, 8, 0, 10, 0, 12, 0, 14}
# size of queue : 10
# after poped elements from back (right) remaining elements in queue : '{0, 3, 0, 1, 0, 0, 6, 0, 8, 0}
# size of queue : 11
# printing elements in queue after inserting an element in particular index : '{0, 3, 0, 1, 0, 7, 0, 6, 0, 8, 0}
# size of queue : 10
# printing elements in queue after deleting an element in particular index : '{0, 3, 0, 1, 0, 7, 0, 0, 8, 0}
# size of queue : 0
# printing elements in queue after deleting whole queue : '{}
*/
    
