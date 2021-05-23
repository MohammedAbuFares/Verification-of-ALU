`ifndef GUARD_DRIVER
`define GUARD_DRIVER

`include "generator.sv"
`include "interface.sv"
`include "transaction.sv"

//`define DRI_INF  intf.driver_cb // there might be a need for driver CB, so use instead of clocking_cb the cb name for driver created in interface

class driver;
  
  
  int num_of_trans;
  int i=0;
  
  virtual inter_calc intf; // to call the interface

  
  
  //declaring mailbox
  mailbox gen2driv; 
  
  
  function new(virtual inter_calc intf,mailbox gen2driv); 
    //getting the interface
	
    this.intf = intf;
    
    //getting the mailbox handles from  environment
    this.gen2driv = gen2driv;
   
  endfunction
  
  
  task main();
    
    
    
    forever begin
    
    
   transaction trans; //transaction handle
   
   
   //getting values from mailbox from generator
   gen2driv.get(trans);
   
//for (i =0; i<10; i++) begin

// $display("----------Driver::transaction %d received from generator---------------",num_of_trans);

//#50ns
 
  $display("--------------------------------------------------------------------------------------------------------------------------------");
  $display("--------------------------------------------------------------------------------------------------------------------------------");
  $display("--------------------------------------------------------------------------------------------------------------------------------");
  $display("--------------------------------------------------------------------------------------------------------------------------------");
  $display("--------------------------------------------------------------------------------------------------------------------------------");
$display($time);

//First cycle of data in (operand 1) , command, and tag

 @(posedge intf.c_clk); 

intf.req1_cmd_in <= trans.req1_cmd_in;             
intf.req2_cmd_in <= trans.req2_cmd_in;
intf.req3_cmd_in <= trans.req3_cmd_in;
intf.req4_cmd_in <= trans.req4_cmd_in;

  intf.req1_tag_in <= trans.req1_tag_in;
	intf.req2_tag_in <= trans.req2_tag_in;
	intf.req3_tag_in <= trans.req3_tag_in;
	intf.req4_tag_in <= trans.req4_tag_in;
	
	intf.req1_data_in <= trans.req1_data_in;
	intf.req2_data_in <= trans.req2_data_in;
	intf.req3_data_in <= trans.req3_data_in;
	intf.req4_data_in <= trans.req4_data_in;
$display("-----------------------------------------------------------------------------");	
$display("-----------------------DRIVER__INTERFACE__VALUES-----------------------------");
$display("-----------------------------------------------------------------------------");	
   
   $display("[FIRST CYCLE]");
   $display("------------------FIRST OPERAND");
   
    $display ($time,"PORT_1 ::: Data_in1_1 = %0h , PORT_2 ::: Data_in2_1= %0h, PORT_3 ::: Data_in3_1= %0h , PORT_4 ::: Data_in4_1= %0h", 
    trans.req1_data_in,trans.req2_data_in,trans.req3_data_in,trans.req4_data_in);
   
    
    $display ($time,"PORT_1 ::: Tag1=%b, PORT_2 ::: Tag2=%b, PORT_3 ::: Tag3=%b, PORT_4 ::: Tag4=%b ",
    trans.req1_tag_in,trans.req2_tag_in,trans.req3_tag_in ,trans.req4_tag_in);
    $display ($time,"Cmd1=%b,  Cmd2= %b, Cmd3 =%b, Cmd4 =%b",
    trans.req1_cmd_in,trans.req2_cmd_in,trans.req3_cmd_in,trans.req4_cmd_in);
    
  

//#50ns

// Second cycle for operand 2
 @(posedge intf.c_clk); 




  intf.req1_cmd_in <= trans.req1_cmd_inZERO;
	intf.req2_cmd_in <= trans.req1_cmd_inZERO;
	intf.req3_cmd_in <= trans.req1_cmd_inZERO;
	intf.req4_cmd_in <= trans.req1_cmd_inZERO;




  intf.req1_data_in <= trans.req1_data_in1;
	intf.req2_data_in <= trans.req2_data_in1;
	intf.req3_data_in <= trans.req3_data_in1;
	intf.req4_data_in <= trans.req4_data_in1;
	
	
	$display("[SECOND CYCLE]");
	 $display("------------------SECOND OPERAND");
	
	
	 $display ($time,"PORT_1 ::: Data_in1_2 = %0h , PORT_2 ::: Data_in2_2= %0h, PORT_3 ::: Data_in3_2= %0h , PORT_4 ::: Data_in4_2= %0h", 
    trans.req1_data_in1,trans.req2_data_in1,trans.req3_data_in1,trans.req4_data_in1);	
    $display ($time,"Cmd1=%b,  Cmd2= %b, Cmd3 =%b, Cmd4 =%b",
    trans.req1_cmd_inZERO,trans.req1_cmd_inZERO,trans.req1_cmd_inZERO,trans.req1_cmd_inZERO);
    
    $display("------------------------------------------------------");
    
    
    
   // #1000ns //-------------------------
  //#450ns // **************************
    #750ns // NNNNNNNNNNNNNNNNNNNNNNNNNNNN
    $display($time);
    
  
	
 //	@(posedge intf.c_clk); //--------------------
 	
 
  $display("ended");

	end
	
	
	endtask



	// for driving input values to 0 from start of simulation
	task reset();
 
 wait(intf.reset);
    $display("[ DRIVER ] ----- Reset Started -----");
 //  @(posedge intf.reset);  
 intf.req1_cmd_in <=0;
 intf.req2_cmd_in <=0;
 intf.req3_cmd_in <=0;
 intf.req4_cmd_in <=0;
 
 intf.req1_tag_in <=0;
 intf.req2_tag_in <=0;
 intf.req3_tag_in <=0;
 intf.req4_tag_in <=0;
 
 
 intf.req1_data_in <=0;
 intf.req2_data_in <=0;
 intf.req3_data_in <=0;
 intf.req4_data_in <=0;
 
//$display(" Data1: %d, tag1:%d, Command1: %d",intf.req1_data_in, intf.req1_tag_in,intf.req1_cmd_in);
//  repeat  (3)
  
//  @(posedge intf.reset);
//	`DRI_INF.reset <= 0; 
wait(!intf.reset);
    $display("[ DRIVER ] ----- Reset Ended   -----");
//  end


  endtask
  
  
	endclass

	
	`endif
	
	/*
	 module check2;
      
      initial begin
        
        driver drii;
        
        drii =new();
        
        drii.main();
    end
      
      endmodule
      */
      
	