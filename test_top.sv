

`include "interface.sv"


module test_top;
bit clk;
bit c_clk,a_clk,b_clk,scan_in,reset;

always #50
c_clk = !c_clk;

initial begin
	    a_clk = 0;
      b_clk = 0;
    //  c_clk = 0;
      scan_in = 0;
    end
	
	initial begin
    reset = 1;
    #350 reset =0;
  end
	

//connections
  
    inter_calc intf(c_clk,reset);		//interface ..connected interface with clock and reset signals.. and they are defined up
		test t1(intf);			//testbench.. we connected test block with interface.. and test block is the environment itselft
	  calc2_top calc2 (             // connecting the actualy DUT (CALC2) with the Interface
		 .out_data1(intf.out_data1), 
		.out_data2(intf.out_data2), 
		.out_data3(intf.out_data3), 
		.out_data4(intf.out_data4), 
		.out_resp1(intf.out_resp1), 
		.out_resp2(intf.out_resp2), 
		.out_resp3(intf.out_resp3), 
		.out_resp4(intf.out_resp4), 
		.out_tag1(intf.out_tag1),
.out_tag2(intf.out_tag2),
.out_tag3(intf.out_tag3),
.out_tag4(intf.out_tag4),		
		.scan_out(intf.scan_out), 
	.a_clk(intf.a_clk), 
		.b_clk(intf.b_clk), 
		.c_clk(intf.c_clk), 
		.req1_cmd_in(intf.req1_cmd_in), 
		.req1_data_in(intf.req1_data_in),
.req1_tag_in(intf.req1_tag_in),		
		.req2_cmd_in(intf.req2_cmd_in), 
		.req2_data_in(intf.req2_data_in),
.req2_tag_in(intf.req2_tag_in),		
		.req3_cmd_in(intf.req3_cmd_in), 
		.req3_data_in(intf.req3_data_in), 
		.req3_tag_in(intf.req3_tag_in),
		.req4_cmd_in(intf.req4_cmd_in), 
		.req4_data_in(intf.req4_data_in),
.req4_tag_in(intf.req4_tag_in),		
		.reset(intf.reset),
		.scan_in(intf.scan_in)
		);
		
		endmodule
		
		