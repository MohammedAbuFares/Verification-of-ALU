`ifndef CALC2_IF_DEFINE
`define CALC2_IF_DEFINE



class transaction;




   bit [0:31] out_data1, out_data2, out_data3, out_data4;
   bit [0:1]  out_resp1, out_resp2, out_resp3, out_resp4, out_tag1, out_tag2, out_tag3, out_tag4;

/*   
   bit [0:31] out_data1_PH2, out_data2_PH2, out_data3_PH2, out_data4_PH2;
   bit [0:1]  out_resp1_PH2, out_resp2_PH2, out_resp3_PH2, out_resp4_PH2, out_tag1_PH2, out_tag2_PH2, out_tag3_PH2, out_tag4_PH2;
   
   bit [0:31] out_data1_PH3, out_data2_PH3, out_data3_PH3, out_data4_PH3;
   bit [0:1]  out_resp1_PH3, out_resp2_PH3, out_resp3_PH3, out_resp4_PH3, out_tag1_PH3, out_tag2_PH3, out_tag3_PH3, out_tag4_PH3;
   
   bit [0:31] out_data1_PH4, out_data2_PH4, out_data3_PH4, out_data4_PH4;
   bit [0:1]  out_resp1_PH4, out_resp2_PH4, out_resp3_PH4, out_resp4_PH4, out_tag1_PH4, out_tag2_PH4, out_tag3_PH4, out_tag4_PH4;
   
   */
   
   bit req1_cmd_inZERO =0;
   
   
   
 //  rand bit [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
  // rand bit[0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
 //  rand bit [0:31]  req1_data_in, req2_data_in, req3_data_in, req4_data_in;
  // rand bit cmd_port[$:3];
  
  
  
  
  
  
  // FIRST cycle
  
  //                 port1         PORT2        PORT3        PORT4
  rand bit [0:3] 	 req1_cmd_in, req2_cmd_in, req3_cmd_in, req4_cmd_in;
  rand bit[0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
  rand bit [0:31]  req1_data_in, req2_data_in, req3_data_in, req4_data_in;
  
  
  
  
  // SECOND cycle
  
  //                    port1        port2             port3       port4              
  
  rand bit [0:31]  req1_data_in1, req2_data_in1, req3_data_in1, req4_data_in1;  
  
 /*
 
  //THIRD cycle

  
  rand bit [0:3] 	 req1_cmd_in2, req2_cmd_in2, req3_cmd_in2, req4_cmd_in2;
  rand bit[0:1] 	  req1_tag_in2, req2_tag_in2, req3_tag_in2, req4_tag_in2;
  rand bit [0:31]  req1_data_in2_1, req2_data_in2_1, req3_data_in2_1, req4_data_in2_1;
  
  //FORTH cycle
  
  rand bit [0:31]  req1_data_in2_2, req2_data_in2_2, req3_data_in2_2, req4_data_in2_2;
  
  
  //FIFTH cycle
  
  rand bit [0:3] 	 req1_cmd_in3, req2_cmd_in3, req3_cmd_in3, req4_cmd_in3;
  rand bit[0:1] 	  req1_tag_in3, req2_tag_in3, req3_tag_in3, req4_tag_in3;
  rand bit [0:31]  req1_data_in3_1, req2_data_in3_1, req3_data_in3_1, req4_data_in3_1;
  
  
  //SIXTH cycle
  
  rand bit [0:31]  req1_data_in3_2, req2_data_in3_2, req3_data_in3_2, req4_data_in3_2;
  
  
  //SEVENTH cycle
  
  rand bit [0:3] 	 req1_cmd_in4, req2_cmd_in4, req3_cmd_in4, req4_cmd_in4;
  rand bit[0:1] 	  req1_tag_in4, req2_tag_in4, req3_tag_in4, req4_tag_in4;
  rand bit [0:31]  req1_data_in4_1, req2_data_in4_1, req3_data_in4_1, req4_data_in4_1;
  
  
  //EIGHT cycle
  
  rand bit [0:31]  req1_data_in4_2, req2_data_in4_2, req3_data_in4_2, req4_data_in4_2;
  
*/



constraint data_in_c    { req1_data_in inside {[32'h00000000:32'hFFFFFFFF]}; } 
constraint data_in_c1    { req1_data_in1 inside {[32'h00000000:32'hFFFFFFFF] };} 

//constraint data_in_c    { req1_data_in == 32'hB2D05E00; } 
//constraint data_in_c888    { req1_data_in1 == 32'hB2D05E00;} 

constraint data_in_c2    {req2_data_in inside {[32'h00000000:32'hFFFFFFFF]}; }  
constraint data_in_c21   {req2_data_in1 inside {[32'h00000000:32'hFFFFFFFF] };} 
    
//constraint data_in_c2   {req1_data_in1 > 0 ; req1_data_in1 < 2 ; }
//constraint cmd_in_c99    {req1_cmd_in inside {1,5,6}; }
//constraint cmd_in_c99    {req1_cmd_in > 0 ; req1_cmd_in <2; }

//constraint data_in_c11    {req2_data_in inside {[2:4]};}
//constraint data_in_c12   {req2_data_in1 inside {[5:10]};}

//constraint cmd_in_c758    {req2_cmd_in < 3; req2_cmd_in >1; }

constraint data_in_c3    {req3_data_in inside {[32'h00000000:32'hFFFFFFFF]};}
constraint data_in_c31   {req3_data_in1 inside {[32'h00000000:32'hFFFFFFFF]};}

//constraint cmd_in_c22    {req3_cmd_in < 7; req3_cmd_in >5; }
//constraint cmd_in_c24    {req4_cmd_in < 7; req4_cmd_in >5; }


constraint data_in_c4    {req4_data_in inside {[32'h00000000:32'hFFFFFFFF]};}
constraint data_in_c41   {req4_data_in1 inside {[32'h00000000:32'hFFFFFFFF] };}
  
//Constraints for command
   
   
   constraint command1_c { req1_cmd_in inside  {[1:2],5,6};

                          if (req1_cmd_in==1) {req1_tag_in== 2'b00;}
                         
                          else if (req1_cmd_in== 2) {req1_tag_in== 2'b01;}
                          else if (req1_cmd_in== 5) {req1_tag_in== 2'b10;}
                          else { req1_tag_in== 2'b11;}
                          }
                                                   
                           
                           
  constraint command2_c {req2_cmd_in inside  {[1:2],5,6};

                          if (req2_cmd_in==1) {req2_tag_in== 2'b00;}
                         
                          else if (req2_cmd_in== 2) {req2_tag_in== 2'b01;}
                          else if (req2_cmd_in== 5) {req2_tag_in== 2'b10;}
                          else { req2_tag_in== 2'b11;}
                          }
                         
                           
  constraint command3_c { req3_cmd_in inside  {[1:2],5,6};

                          if (req3_cmd_in==1) {req3_tag_in== 2'b00;}
                         
                          else if (req3_cmd_in== 2) {req3_tag_in== 2'b01;}
                          else if (req3_cmd_in== 5) {req3_tag_in== 2'b10;}
                          else { req3_tag_in== 2'b11;}
                          }
                         
                         
  constraint command4_c { req4_cmd_in inside  {[1:2],5,6};

                          if (req4_cmd_in==1) {req4_tag_in== 2'b00;}
                         
                          else if (req4_cmd_in== 2) {req4_tag_in== 2'b01;}
                          else if (req4_cmd_in== 5) {req4_tag_in== 2'b10;}
                          else { req4_tag_in== 2'b11;}
                          }
                         
       
     
     
     /*
       // Constraint to test invalid command 
       constraint command1_c { req1_cmd_in inside {0,3,[7:15]};}                         
       constraint command2_c {req2_cmd_in inside {0,3,[7:15]};}                                       
       constraint command3_c { req3_cmd_in inside {0,3,[7:15]};}                      
       constraint command4_c { req4_cmd_in inside {0,3,[7:15]};}
*/
                         
                         
    function void print_all(string name);
   $display("----------------------from transaction------------");
   $display("- %s ",name);
   
   $display("----------------------------------------------------------------------");
   
   $display("[Input Values of Calc2]");
   
    $display ("PORT_1 ::: Data_in1_1 = %0h , PORT_2 ::: Data_in2_1= %0h, PORT_3 ::: Data_in3_1= %0h , PORT_4 ::: Data_in4_1= %0h", 
    req1_data_in,req2_data_in,req3_data_in,req4_data_in);
    $display ("PORT_1 ::: Data_in1_2 = %0h , PORT_2 ::: Data_in2_2= %0h, PORT_3 ::: Data_in3_2= %0h , PORT_4 ::: Data_in4_2= %0h", 
    req1_data_in1,req2_data_in1,req3_data_in1,req4_data_in1);
    
    $display ("PORT_1 ::: Tag1=%b, PORT_2 ::: Tag2=%b, PORT_3 ::: Tag3=%b, PORT_4 ::: Tag4=%b ",
    req1_tag_in,req2_tag_in,req3_tag_in ,req4_tag_in);
    $display ("Cmd1=%b,  Cmd2= %b, Cmd3 =%b, Cmd4 =%b",
    req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in);
    
     $display("----------------------------------------------------------------------");
  
       endfunction
       
       function void printt();
         
         
  $display("----------------------------------------------------------------------");
   
   $display("[CHECKING VALUES IN SCOREBOARD]");
   $display("");
   $display("INPUT VALUES");
   
    $display ("PORT_1 ::: Data_in1_1 = %0h , PORT_2 ::: Data_in2_1= %0h, PORT_3 ::: Data_in3_1= %0h , PORT_4 ::: Data_in4_1= %0h", 
    req1_data_in,req2_data_in,req3_data_in,req4_data_in);
    $display ("PORT_1 ::: Data_in1_2 = %0h , PORT_2 ::: Data_in2_2= %0h, PORT_3 ::: Data_in3_2= %0h , PORT_4 ::: Data_in4_2= %0h", 
    req1_data_in1,req2_data_in1,req3_data_in1,req4_data_in1);
    
    $display ("PORT_1 ::: Tag1=%b,                PORT_2 ::: Tag2=%b,               PORT_3 ::: Tag3=%b,               PORT_4 ::: Tag4=%b ",
    req1_tag_in,req2_tag_in,req3_tag_in ,req4_tag_in);
    $display ("Cmd1=%b,                         Cmd2= %b,                      Cmd3 =%b,                       Cmd4 =%b",
    req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in);
    
     $display("");
   $display("OUTPUT VALUES");
     
     $display($time,"port1:output::%0h,  port2:output::%0h, port3:output::%0h, port4:output::%0h",out_data1,out_data2,out_data3,out_data4);
     $display($time,"port1:resp::%0h,        port2:resp::%0h,  port3:resp::%0h,    port4:resp::%0h",out_resp1,out_resp2,out_resp3,out_resp4);
     $display($time,"port1:tag::%0h,         port2:tag::%0h,   port3:tag::%0h,     port4:tag::%0h",out_tag1,out_tag2,out_tag3,out_tag4);
     
     $display("----------------------------------------------------------------------");

endfunction
  
endclass


`endif