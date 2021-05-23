
`ifndef CALC2_IF_DEFINE
`define CALC2_IF_DEFINE

interface inter_calc (input c_clk,reset);


logic [31:0] req1_data_in;
logic [31:0] req2_data_in;
logic [31:0] req3_data_in;
logic [31:0] req4_data_in;

logic [3:0] req1_cmd_in;
logic [3:0] req2_cmd_in;
logic [3:0] req3_cmd_in;
logic [3:0] req4_cmd_in;

logic [1:0] req1_tag_in;
logic [1:0] req2_tag_in;
logic [1:0] req3_tag_in;
logic [1:0] req4_tag_in;
//bit rst;
logic [31:0] out_data1;
logic [31:0] out_data2;
logic [31:0] out_data3;
logic [31:0] out_data4;

logic [1:0] out_tag1;
logic [1:0] out_tag2;
logic [1:0] out_tag3;
logic [1:0] out_tag4;

logic [1:0] out_resp1;
logic [1:0] out_resp2;
logic [1:0] out_resp3;
logic [1:0] out_resp4;


   logic 	 scan_out;
   logic 	 error_found;
   logic 	 a_clk, b_clk ,scan_in;
  // logic   c_clk;
  
 

endinterface

`endif

