`ifndef GUARD_GENERATOR
`define GUARD_GENERATOR

`include "transaction.sv"





class generator;
 
rand transaction trans; 

//event ended; 

// To specify number of transaction
  int  trCount=0;
  int repeat_count;
  
   mailbox gen2driv;
   
   //  For creating the mailbox
     function new(mailbox gen2driv); 
    //getting the mailbox handle from env
   this.gen2driv = gen2driv;
 
  endfunction
      
 task main();
   
   
  // randomize of the transaction 
  
       repeat(repeat_count) begin
        trans = new();
      if( !trans.randomize() ) $fatal("Gen:: trans randomization failed");
       
      gen2driv.put(trans);
        
          
       trCount++;
       trans.print_all("[Generating]");
       $display ( "Number of sent Transaction: %d", trCount);
      end
    
    endtask
    
    
  
 endclass
 
 `endif
 
 /* this part to check if generator running properly with transaction file
 
 module check;
      
      initial begin
        
        generator gent;
        
        gent =new();
        
        gent.main();
    end
      
      endmodule
  */
  
  
  
      

 
 

