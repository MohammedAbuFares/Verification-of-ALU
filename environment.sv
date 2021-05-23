

`ifndef GUARD_ENVIRONMENT
`define GUARD_ENVIRONMENT


`include "generator.sv"
`include "driver.sv"
`include "monitor.sv" 
`include "scr_brd.sv" 

class environment;
   
  //generator,driver, monitor, and scoreboard  handles
  generator gen;
  driver    driv;
  monitor   mon;  
  score      scr; 
   
  //mailbox handle's
  mailbox gen2driv;
  mailbox mon_to_scb; 
  
  
  virtual inter_calc intf;
  

   
  
  function new(virtual inter_calc intf); 
    //get the interface from test
    this.intf = intf;
    
    //creating the mailbox 
    gen2driv = new();
    mon_to_scb  = new(); 
     
    //creating generator and driver and monitor and scoreboard
    gen = new(gen2driv); 
    driv = new(intf,gen2driv);
    mon = new(intf,mon_to_scb); 
    scr  = new(mon_to_scb); 
  endfunction
     
     
    //task to reset the input value at beginning
    task pre_test();
      driv.reset();
    endtask
    
    //main tasks
    
  task test();
    fork    // fork and join any i think to allow sequence execution of below mains 
    gen.main();
    driv.main();
    mon.main();  
    scr.main(); 
    join_any
  endtask
  
  //after test tasks
  
  task post_test();

   wait(gen.repeat_count == driv.num_of_trans);
  // wait(gen.repeat_count == scr.num_of_trans); 



endtask
   

   
  //run task
  task run;
   
    pre_test();
    test();
    post_test();
 //  $finish;
 
  endtask
   
endclass


`endif