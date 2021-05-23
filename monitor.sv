`ifndef GUARD_MONITOR
`define GUARD_MONITOR

`include "transaction.sv"

class monitor;
  
  mailbox mon_to_scb;
  
  int num_of_trans2=0;
  virtual inter_calc intf;
  
  function new(virtual inter_calc intf, mailbox mon_to_scb);
    
    //getting interface
    this.intf=intf;
    //get handle of mailbox from environment
    this.mon_to_scb=mon_to_scb;
    
endfunction

task main();
  
  forever begin 
    
    transaction trans;
    
    trans = new();
    
    
     #150ns
     
     $display($time);
 // $display("--------------------------------[ (RECEIVING FROM INTERFACE )]------------------------------------------------------------------");
 // $display("--------------------------------[ (RECEIVING FROM INTERFACE )]------------------------------------------------------------------");
 // $display("--------------------------------[ (RECEIVING FROM INTERFACE )]------------------------------------------------------------------");
 // $display("--------------------------------[ (RECEIVING FROM INTERFACE )]------------------------------------------------------------------");
 // $display("--------------------------------[ (RECEIVING FROM INTERFACE )]------------------------------------------------------------------");
    
    //first cycle operand 1, command, and tag to monitor and initialize the trans handle to each variable
    
    @(posedge intf.c_clk); 
    
    
    
    trans.req1_cmd_in = intf.req1_cmd_in;
	  trans.req2_cmd_in = intf.req2_cmd_in;
	  trans.req3_cmd_in=  intf.req3_cmd_in;
	  trans.req4_cmd_in=  intf.req4_cmd_in;
	
   	trans.req1_tag_in = intf.req1_tag_in;
	  trans.req2_tag_in = intf.req2_tag_in;
	  trans.req3_tag_in=  intf.req3_tag_in;
	  trans.req4_tag_in=  intf.req4_tag_in;
	
   	trans.req1_data_in = intf.req1_data_in;
	  trans.req2_data_in = intf.req2_data_in;
	  trans.req3_data_in=  intf.req3_data_in;
	  trans.req4_data_in=  intf.req4_data_in;
	  
$display("------------------------------------------------------------------------------");	
$display("-----------------------MONITOR__INTERFACE__VALUES-----------------------------");
$display("------------------------------------------------------------------------------");	
	   $display("[FIRST CYCLE]----VALUES IN MONITOR");
   
    $display ($time,"PORT_1 ::: Data_in1_1 = %0h , PORT_2 ::: Data_in2_1= %0h, PORT_3 ::: Data_in3_1= %0h , PORT_4 ::: Data_in4_1= %0h", 
    trans.req1_data_in,trans.req2_data_in,trans.req3_data_in,trans.req4_data_in);
   
    
    $display ($time,"PORT_1 ::: Tag1=%b,           PORT_2 ::: Tag2=%b,         PORT_3 ::: Tag3=%b,          PORT_4 ::: Tag4=%b ",
    trans.req1_tag_in,trans.req2_tag_in,trans.req3_tag_in ,trans.req4_tag_in);
    $display ($time,"Cmd1=%b,                      Cmd2= %b,                   Cmd3 =%b,                    Cmd4 =%b",
    trans.req1_cmd_in,trans.req2_cmd_in,trans.req3_cmd_in,trans.req4_cmd_in);
    
	  //second cycle operand 2  to monitor and initialize the trans handle to each variable
	  
	  @(posedge intf.c_clk);
	  
	  	trans.req1_data_in1 = intf.req1_data_in;
	  trans.req2_data_in1 = intf.req2_data_in;
	  trans.req3_data_in1=  intf.req3_data_in;
	  trans.req4_data_in1= intf.req4_data_in;
	  
      
	   intf.req1_cmd_in = 0;
	   intf.req2_cmd_in = 0;
	   intf.req3_cmd_in = 0;
    	intf.req4_cmd_in = 0;
    	
    	
    	$display("[SECOND CYCLE]----VALUES IN MONITOR");
	
	
	 $display ($time,"PORT_1 ::: Data_in1_2 = %0h , PORT_2 ::: Data_in2_2= %0h, PORT_3 ::: Data_in3_2= %0h , PORT_4 ::: Data_in4_2= %0h", 
    trans.req1_data_in1,trans.req2_data_in1,trans.req3_data_in1,trans.req4_data_in1);	
    

@(posedge intf.c_clk);
  
  repeat(3)
begin
	@(posedge intf.c_clk);
if( trans.req1_tag_in == intf.out_tag1 && intf.out_resp1 != 0)
begin

    trans.out_data1 = intf.out_data1;
	 
	  trans.out_resp1 = intf.out_resp1;
	   
	  trans.out_tag1 = intf.out_tag1;
	  
	  
//wait(intf.out_tag1 || intf.out_tag2 || intf.out_tag3 || intf.out_data4);
$display("");
$display("[OUTPUT VALUES IN MONITOR]----------------");

$display($time,"port1:output::%0h",intf.out_data1);
$display($time,"port1:resp::%0h",intf.out_resp1);
$display($time,"port1:tag::%0h",intf.out_tag1);

end

if( trans.req2_tag_in == intf.out_tag2 && intf.out_resp2 != 0)
begin

    trans.out_data2 = intf.out_data2;
	 
	  trans.out_resp2 = intf.out_resp2;
	   
	  trans.out_tag2 = intf.out_tag2;
	  
	  
//wait(intf.out_tag1 || intf.out_tag2 || intf.out_tag3 || intf.out_data4);

$display("[OUTPUT VALUES IN MONITOR]----------------");

$display($time,"port2:output::%0h",intf.out_data2);
$display($time,"port2:resp::%0h",intf.out_resp2);
$display($time,"port2:tag::%0h",intf.out_tag2);

end

if( trans.req3_tag_in == intf.out_tag3 && intf.out_resp3 != 0)
begin

    trans.out_data3 = intf.out_data3;
	 
	  trans.out_resp3= intf.out_resp3;
	   
	  trans.out_tag3 = intf.out_tag3;
	  
	  
//wait(intf.out_tag1 || intf.out_tag2 || intf.out_tag3 || intf.out_data4);

$display("[OUTPUT VALUES IN MONITOR]----------------");

$display($time,"port3:output::%0h",intf.out_data3);
$display($time,"port3:resp::%0h",intf.out_resp3);
$display($time,"port3:tag::%0h",intf.out_tag3);

end


if( trans.req4_tag_in == intf.out_tag4 && intf.out_resp4 != 0)
begin

    trans.out_data4 = intf.out_data4;
	 
	  trans.out_resp4= intf.out_resp4;
	   
	  trans.out_tag4 = intf.out_tag4;
	  
	  
//wait(intf.out_tag1 || intf.out_tag2 || intf.out_tag3 || intf.out_data4);

$display("[OUTPUT VALUES IN MONITOR]----------------");

$display($time,"port4:output::%0h",intf.out_data4);
$display($time,"port4:resp::%0h",intf.out_resp4);
$display($time,"port4:tag::%0h",intf.out_tag4);

end
end


	
	@(posedge intf.c_clk);
	/*
	  trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
	  trans.out_data3 = intf.out_data3;
	  trans.out_data4 = intf.out_data4;
	  
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp4= intf.out_resp4;
	  
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2;
	  trans.out_tag3 = intf.out_tag3;
	  trans.out_tag4 = intf.out_tag4;
	 */
	 
	 
	 
	 
	 //output after this clk cycle
	  @(posedge intf.c_clk);
	  

	  
	 // trans.out_data1 = intf.out_data1;
	 // trans.out_data2 = intf.out_data2;

	  
	  
	 // trans.out_resp1 = intf.out_resp1;
	 // trans.out_resp2 = intf.out_resp2;
	
	  
	  
	//  trans.out_tag1 = intf.out_tag1;
	//  trans.out_tag2 = intf.out_tag2;
	 // trans.out_tag3 = intf.out_tag3;
	 // trans.out_tag4 = intf.out_tag4;
	 
	 
	  
//wait(intf.out_tag1 || intf.out_tag2 || intf.out_tag3 || intf.out_data4);

//$display("[OUTPUT VALUES IN MONITOR]----------------");

//$display($time,"port1:output::%0h, port2:output::%0h, port3:output::%0h,port4:output::%0h",intf.out_data1,intf.out_data2,intf.out_data3,intf.out_data4);
//$display($time,"port1:resp::%0h,   port2:resp::%0h,   port3:resp::%0h,  port4:resp::%0h",intf.out_resp1,intf.out_resp2,intf.out_resp3,intf.out_resp4);
//$display($time,"port1:tag::%0h,    port2:tag::%0h,    port3:tag::%0h,   port4:tag::%b",intf.out_tag1,intf.out_tag2,intf.out_tag3,intf.out_tag4);


/*
$display($time," REQUIRED TAG IN :port1:::%0h, port2:::%0h, port3:::%0h,port4:::%0h",trans.req1_tag_in, trans.req2_tag_in,trans.req3_tag_in,trans.req4_tag_in);
$display($time," ACTUAL TAG OUT  :port1:::%0h, port2:::%0h, port3:::%0h,port4:::%0h",intf.out_tag1, intf.out_tag2, intf.out_tag3, intf.out_tag4);
$display($time," ACTUAL RESP OUT  :port1:::%0h, port2:::%0h, port3:::%0h,port4:::%0h",intf.out_resp1, intf.out_resp2, intf.out_resp3,intf.out_resp4);
repeat (4) 
begin 
if ( trans.req1_tag_in == intf.out_tag1 &&  trans.req2_tag_in == intf.out_tag2 && trans.req3_tag_in == intf.out_tag3 && trans.req4_tag_in == intf.out_tag4) begin

    trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
    trans.out_data3 = intf.out_data3;
	  trans.out_data4 = intf.out_data4;
	  
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp4= intf.out_resp4;
	  
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2; 
    trans.out_tag3 = intf.out_tag3;
	  trans.out_tag4 = intf.out_tag4;
  
  $display($time,"port1:output::%0h, port2:output::%0h, port3:output::%0h,port4:output::%0h",intf.out_data1,intf.out_data2,intf.out_data3,intf.out_data4);
$display($time,"port1:resp::%0h,   port2:resp::%0h,   port3:resp::%0h,  port4:resp::%0h",intf.out_resp1,intf.out_resp2,intf.out_resp3,intf.out_resp4);
$display($time,"port1:tag::%0h,    port2:tag::%0h,    port3:tag::%0h,   port4:tag::%b",intf.out_tag1,intf.out_tag2,intf.out_tag3,intf.out_tag4);

 @(posedge intf.c_clk);
    
    //mailbox to send to scoreboard and checker
      mon_to_scb.put(trans);

end 

//-----------------------------------------------------------------------------------------------------------------------------------


if ( (trans.req1_tag_in != intf.out_tag1 || trans.req1_tag_in == intf.out_tag1) &&
     intf.out_resp1 ==0 &&
    (trans.req2_tag_in != intf.out_tag2 || trans.req2_tag_in == intf.out_tag2) &&
    intf.out_resp2 ==0 &&
   (trans.req3_tag_in != intf.out_tag3 || trans.req3_tag_in == intf.out_tag3)  && 
   intf.out_resp3 ==0 && 
   (trans.req1_tag_in != intf.out_tag4 || trans.req4_tag_in == intf.out_tag4) && 
    intf.out_resp4 ==0 ) begin

    

 @(posedge intf.c_clk);
 
    trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
    trans.out_data3 = intf.out_data3;
	  trans.out_data4 = intf.out_data4;
	  
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp4= intf.out_resp4;
	  
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2; 
    trans.out_tag3 = intf.out_tag3;
	  trans.out_tag4 = intf.out_tag4;
  
  $display($time,"port1:output::%0h, port2:output::%0h, port3:output::%0h,port4:output::%0h",intf.out_data1,intf.out_data2,intf.out_data3,intf.out_data4);
  $display($time,"port1:resp::%0h,   port2:resp::%0h,   port3:resp::%0h,  port4:resp::%0h",intf.out_resp1,intf.out_resp2,intf.out_resp3,intf.out_resp4);
  $display($time,"port1:tag::%0h,    port2:tag::%0h,    port3:tag::%0h,   port4:tag::%b",intf.out_tag1,intf.out_tag2,intf.out_tag3,intf.out_tag4);
    
    //mailbox to send to scoreboard and checker
      mon_to_scb.put(trans);

end 

//--------------------------------------------------------------------------------------------------------

else if ( trans.req1_tag_in == intf.out_tag1 && 
          trans.req2_tag_in == intf.out_tag2 && 
          (trans.req3_tag_in != intf.out_tag3 || trans.req3_tag_in == intf.out_tag3)  && 
          intf.out_resp3 ==0 && 
          (trans.req1_tag_in != intf.out_tag4 || trans.req4_tag_in == intf.out_tag4) && 
          intf.out_resp4 ==0 ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2; 
	  
	  $display($time,"port1:output::%0h, port2:output::%0h",intf.out_data1,intf.out_data2);
$display($time,"port1:resp::%0h,   port2:resp::%0h",intf.out_resp1,intf.out_resp2);
$display($time,"port1:tag::%0h,    port2:tag::%0h",intf.out_tag1,intf.out_tag2);
	  
	  
    @(posedge intf.c_clk);
    
    trans.out_data3 = intf.out_data3;
	  trans.out_data4= intf.out_data4;
	  
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp4 = intf.out_resp4;
	  
	  trans.out_tag3 = intf.out_tag3;
	  trans.out_tag4 = intf.out_tag4; 
	  
$display($time,"port3:output::%0h, port4:output::%0h",intf.out_data3,intf.out_data4);
$display($time,"port3:resp::%0h,   port4:resp::%0h",intf.out_resp3,intf.out_resp4);
$display($time,"port3:tag::%0h,    port4:tag::%0h",intf.out_tag3,intf.out_tag4);

 mon_to_scb.put(trans);
 
 end
 
  //--------------------------------------------------------------------------------------------------------
 
 else if ( trans.req1_tag_in == intf.out_tag1 && 
          (trans.req2_tag_in != intf.out_tag2 || trans.req2_tag_in == intf.out_tag2) &&
           intf.out_resp2 ==0 &&
          (trans.req3_tag_in != intf.out_tag3 || trans.req3_tag_in == intf.out_tag3)  && 
          intf.out_resp3 ==0 && 
          (trans.req1_tag_in != intf.out_tag4 || trans.req4_tag_in == intf.out_tag4) && 
          intf.out_resp4 ==0 ) begin 
  
    trans.out_data1 = intf.out_data1;
	  
	  
	  trans.out_resp1 = intf.out_resp1;
	  
	  
	  trans.out_tag1 = intf.out_tag1;
	  
	  
	  $display($time,"port1:output::%0h",intf.out_data1);
$display($time,"port1:resp::%0h",intf.out_resp1);
$display($time,"port1:tag::%0h",intf.out_tag1);
	  
	  
    @(posedge intf.c_clk);
    
    trans.out_data2 = intf.out_data2;
    trans.out_data3 = intf.out_data3;
	  trans.out_data4= intf.out_data4;
	  
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp4 = intf.out_resp4;
	  trans.out_resp2 = intf.out_resp2;
	  
	  trans.out_tag3 = intf.out_tag3;
	  trans.out_tag4 = intf.out_tag4; 
	  trans.out_tag2 = intf.out_tag2; 
	  
$display($time,"port2:output::%0h,   port3:output::%0h, port4:output::%0h",intf.out_data2,intf.out_data3,intf.out_data4);
$display($time,"port2:resp::%0h,     port3:resp::%0h,   port4:resp::%0h",intf.out_resp2,intf.out_resp3,intf.out_resp4);
$display($time,"port2:tag::%0h,      port3:tag::%0h,   port4:tag::%0h",intf.out_tag2,intf.out_tag3,intf.out_tag4);

 mon_to_scb.put(trans);
 
 end
 
 //--------------------------------------------------------------------------------------------------------
 
 else if ( trans.req1_tag_in == intf.out_tag1 && 
           trans.req2_tag_in == intf.out_tag2 && 
           trans.req3_tag_in == intf.out_tag3  &&  
           (trans.req4_tag_in != intf.out_tag4 || trans.req4_tag_in == intf.out_tag4) &&  
           intf.out_resp4 ==0  ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
	  trans.out_data3 = intf.out_data3;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  trans.out_resp3 = intf.out_resp3;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2;
	  trans.out_tag3 = intf.out_tag3; 
	  
	  $display($time,"port1:output::%0h, port2:output::%0h, port3:output::%0h",intf.out_data1,intf.out_data2,intf.out_data3);
$display($time,"port1:resp::%0h,   port2:resp::%0h,port3:resp::%0h   ",intf.out_resp1,intf.out_resp2,intf.out_resp3);
$display($time,"port1:tag::%0h,    port2:tag::%0h,    port3:tag::%0h",intf.out_tag1,intf.out_tag2,intf.out_tag3);
	  
	  
    @(posedge intf.c_clk);
    
    
	  trans.out_data4= intf.out_data4;
	  
	  
	  trans.out_resp4 = intf.out_resp4;
	  
	  
	  trans.out_tag4 = intf.out_tag4; 
	  
$display($time,"port4:output::%0h",intf.out_data4);
$display($time,"port4:resp::%0h",intf.out_resp4);
$display($time,"port4:tag::%0h",intf.out_tag4);

 mon_to_scb.put(trans);
 
 end
 
 
 //-------------------------------------------------------------------------------------------------------- 3 alone
 
 else if ( trans.req1_tag_in == intf.out_tag1 && 
 trans.req2_tag_in == intf.out_tag2 && 
 (trans.req3_tag_in != intf.out_tag3 || trans.req3_tag_in == intf.out_tag3) && 
 intf.out_resp3 ==0 && 
 trans.req4_tag_in == intf.out_tag4    ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data2 = intf.out_data2;
	  trans.out_data4 = intf.out_data4;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp2 = intf.out_resp2;
	  trans.out_resp4 = intf.out_resp4;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag2 = intf.out_tag2;
	  trans.out_tag4 = intf.out_tag4; 
	  
	  $display($time,"port1:output::%0h, port2:output::%0h, port4:output::%0h",intf.out_data1,intf.out_data2,intf.out_data4);
$display($time,"port1:resp::%0h,   port2:resp::%0h,       port4:resp::%0h   ",intf.out_resp1,intf.out_resp2,intf.out_resp4);
$display($time,"port1:tag::%0h,    port2:tag::%0h,        port4:tag::%0h",intf.out_tag1,intf.out_tag2,intf.out_tag4);
	  
	  
    @(posedge intf.c_clk);
    
    
	  trans.out_data3= intf.out_data3;
	  
	  
	  trans.out_resp3 = intf.out_resp3;
	  
	  
	  trans.out_tag3 = intf.out_tag3; 
	  
$display($time,"port3:output::%0h",intf.out_data3);
$display($time,"port3:resp::%0h",intf.out_resp3);
$display($time,"port3:tag::%0h",intf.out_tag3);

 mon_to_scb.put(trans);
 
 end
 
 //--------------------------------------------------------------------------------------------------------
 
 else if ( trans.req1_tag_in == intf.out_tag1 && 
 (trans.req2_tag_in != intf.out_tag2 | trans.req2_tag_in == intf.out_tag2) &&
           intf.out_resp2 ==0 &&
 (trans.req3_tag_in != intf.out_tag3 || trans.req3_tag_in == intf.out_tag3) && 
 intf.out_resp3 ==0 && 
 trans.req4_tag_in == intf.out_tag4    ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data4 = intf.out_data4;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp4 = intf.out_resp4;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag4 = intf.out_tag4; 
	  
	  $display($time,"port1:output::%0h,    port4:output::%0h",intf.out_data1,intf.out_data4);
$display($time,"port1:resp::%0h,          port4:resp::%0h   ",intf.out_resp1,intf.out_resp4);
$display($time,"port1:tag::%0h,           port4:tag::%0h",intf.out_tag1,intf.out_tag4);
	  
	  
    @(posedge intf.c_clk);
    
    
	  trans.out_data3= intf.out_data3;
	   trans.out_data2 = intf.out_data2;
	  
	  trans.out_resp3 = intf.out_resp3;
	  trans.out_resp2 = intf.out_resp2;
	  
	  trans.out_tag3 = intf.out_tag3; 
	  trans.out_tag2 = intf.out_tag2;
	  
	  
$display($time,"port2:output::%0h,  port3:output::%0h",intf.out_data2,intf.out_data3);
$display($time,"port2:resp::%0h,    port3:output::%0h",intf.out_resp2,intf.out_resp3);
$display($time,"port2:tag::%0h,     port3:output::%0h",intf.out_tag2,intf.out_tag3);

 mon_to_scb.put(trans);
 
 end
 
  //--------------------------------------------------------------------------------------------------------
 
 else if ( trans.req1_tag_in == intf.out_tag1 && 
           (trans.req2_tag_in != intf.out_tag2 | trans.req2_tag_in == intf.out_tag2) &&
           intf.out_resp2 ==0 &&
           trans.req3_tag_in == intf.out_tag3  &&  
           (trans.req4_tag_in != intf.out_tag4 || trans.req4_tag_in == intf.out_tag4) &&  
           intf.out_resp4 ==0  ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data3 = intf.out_data3;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp3 = intf.out_resp3;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag3 = intf.out_tag3; 
	  
	  $display($time,"port1:output::%0h,    port3:output::%0h",intf.out_data1,intf.out_data3);
$display($time,"port1:resp::%0h,          port3:resp::%0h   ",intf.out_resp1,intf.out_resp3);
$display($time,"port1:tag::%0h,           port3:tag::%0h",intf.out_tag1,intf.out_tag3);
	  
	  
    @(posedge intf.c_clk);
    
    
	  trans.out_data4= intf.out_data4;
	  trans.out_data2 = intf.out_data2;
	  
	  trans.out_resp4 = intf.out_resp4;
	  trans.out_resp2 = intf.out_resp2;
	  
	  trans.out_tag4 = intf.out_tag4; 
	  trans.out_tag2 = intf.out_tag2;
	  
	  
$display($time,"port2:output::%0h,port4:output::%0h",intf.out_data2,intf.out_data4);
$display($time,"port2:resp::%0h,port4:resp::%0h",intf.out_resp2,intf.out_resp4);
$display($time,"port2:tag::%0h,port4:tag::%0h",intf.out_tag2,intf.out_tag4);

 mon_to_scb.put(trans);
 
 end
 
 //-----------------------------------------------------------------------------------
 
  else if ( trans.req1_tag_in == intf.out_tag1 && 
           (trans.req2_tag_in != intf.out_tag2 | trans.req2_tag_in == intf.out_tag2) &&
           intf.out_resp2 ==0 &&
           trans.req3_tag_in == intf.out_tag3  &&  
           trans.req4_tag_in == intf.out_tag4  
         ) begin 
  
    trans.out_data1 = intf.out_data1;
	  trans.out_data3 = intf.out_data3;
	  trans.out_data4= intf.out_data4;
	  
	  trans.out_resp1 = intf.out_resp1;
	  trans.out_resp3 = intf.out_resp3;
	   trans.out_resp4 = intf.out_resp4;
	  
	  trans.out_tag1 = intf.out_tag1;
	  trans.out_tag3 = intf.out_tag3; 
	  trans.out_tag4 = intf.out_tag4; 
	  
	  $display($time,"port1:output::%0h,    port3:output::%0h, port4:output::%0h",intf.out_data1,intf.out_data3,intf.out_data4);
$display($time,"port1:resp::%0h,          port3:resp::%0h,   port4:resp::%0h  ",intf.out_resp1,intf.out_resp3,intf.out_resp4);
$display($time,"port1:tag::%0h,           port3:tag::%0h,    port4:tag::%0h",intf.out_tag1,intf.out_tag3,intf.out_tag4);
	  
	  
    @(posedge intf.c_clk);
    
    
	  
	  trans.out_data2 = intf.out_data2;
	  
	 
	  trans.out_resp2 = intf.out_resp2;
	  
	  
	  trans.out_tag2 = intf.out_tag2;
	  
	  
$display($time,"port2:output::%0h",intf.out_data2);
$display($time,"port2:resp::%0h",intf.out_resp2);
$display($time,"port2:tag::%0h",intf.out_tag2);

 mon_to_scb.put(trans);
 
 end
 end
 
 */
 
 
 
 
	  
	  
	  
	   //----------------------------------------------------------------------------------------------
    
   // @(posedge intf.c_clk);
    //#700ns //--------------------------------- **************
    

    $display($time);
    
    //mailbox to send to scoreboard and checker
      mon_to_scb.put(trans);
      
      
      
   //   tr.display("[ Monitor ]");
     //  $display($time,"output1.1::%0h, output2::%0h, output3::%0h,output4::%0h",vif.out_data1,vif.out_data2,vif.out_data3,vif.out_data4);
        end
        
          //--------------------------------------------------------------------------------------------------
  endtask
   
endclass

`endif
	  
	 