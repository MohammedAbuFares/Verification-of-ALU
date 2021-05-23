

`include "transaction.sv"
`include "monitor.sv"
//`include "interface.sv"

class score; 
  
  int num_of_trans=0;
  
  int error1,correct1, error2,correct2, error3,correct3, error4,correct4  = 0; 
  
  bit sum;
bit [0:3] command1,command2,command3,command4;

bit [0:31] expected_result1, expected_result2, expected_result3, expected_result4;
bit [0:63] overflow1,  overflow2, overflow3, overflow4;
bit [0:31] data_in11,data_in12,  data_in21,data_in22, data_in31,data_in32, data_in41,data_in42; 

bit [0:1] rsp_exp1 , rsp_exp2, rsp_exp3, rsp_exp4,  TAG_exp1 , TAG_exp2, TAG_exp3, TAG_exp4 ,TAG1, TAG2, TAG3, TAG4 ;

int shft1, shft2, shft3, shft4;

bit [0:31] output_data1, output_data2, output_data3, output_data4;

  
  
  
  bit [0:31] test_data,test_data1;
 // int repeat_count=10;
  
  
//  virtual inter_calc intf;
  mailbox mon_to_scb;
  
  
  function new(mailbox mon_to_scb);
 
    this.mon_to_scb = mon_to_scb;
    
  endfunction
  
  task main();
    
    transaction trans;
  //  trans=new();
    
    forever begin
    
    trans=new();
    
    //getting the mailbox values from monitor
      mon_to_scb.get(trans);
      
     
     // declaring variables for values 
     
     command1 = trans.req1_cmd_in;
     command2 = trans.req2_cmd_in;
     command3 = trans.req3_cmd_in;
     command4 = trans.req4_cmd_in;
     
     
     TAG1 = trans.req1_tag_in;
     TAG2 = trans.req2_tag_in;
     TAG3 = trans.req3_tag_in;
     TAG4 = trans.req4_tag_in;
     
     
     data_in11 = trans.req1_data_in;
     data_in12 = trans.req1_data_in1;
     
     data_in21 = trans.req2_data_in;
     data_in22 = trans.req2_data_in1;
     
     data_in31 = trans.req3_data_in;
     data_in32 = trans.req3_data_in1;
     
     data_in41 = trans.req4_data_in; 
     data_in42 = trans.req4_data_in1; 
     
     output_data1 = trans.out_data1;
     output_data2 = trans.out_data2;
     output_data3 = trans.out_data3;
     output_data4 = trans.out_data4;
     
     
     //required for shift values
     
     shft1 = data_in12 [27:31];   
     shft2 = data_in22 [27:31];
     shft3 = data_in32 [27:31];
     shft4 = data_in42 [27:31];
     
     
     
      trans.printt();
 
 
 // ------------------------- calculating expected values 
 
 //cases 
 
      case(command1)
        
        4'b0001:  // addition
        
         begin
          
          
          overflow1= data_in11 + data_in12;  
        //  $display ("%d", data_in11);  
      //   $display ("%d", data_in12); 
      
      if (overflow1 < 32'hFFFFFFFF ) begin //incase of no overflow
        expected_result1 = data_in11 + data_in12;
            rsp_exp1 = 2'b01;
            TAG_exp1 = 2'b00;
          $display ( " expected result addition 1 = %0h", expected_result1);
        end
        else if (overflow1> 32'hFFFFFFFF ) begin //incase of  overflow
            rsp_exp1 = 2'b10;
            TAG_exp1 = 2'b00;
           $display ( " expected result addition 1 is OVERFLOW"); 
            
       end 
        end
        
        
        4'b0010:
        
         begin
          
        if (data_in11 >= data_in12) //incase of no underflow
         begin
          
          expected_result1 = data_in11 - data_in12;
          
          rsp_exp1 = 2'b01;
          TAG_exp1 = 2'b01;
          
          $display ( " expected result subtraction 1 = %0h", expected_result1);
        end
        else if (data_in11 < data_in12) begin  //incase of underflow
          
          $display ( " expected result subtraction 1 is UNDERFLOW ");
          expected_result1 = 0;  
          rsp_exp1 = 2'b10;
          TAG_exp1 = 2'b01;
       end 
        end
        
      
        
        4'b0101: 
        
        begin
          
        expected_result1 = data_in11 << shft1; //shift left 
        rsp_exp1 = 2'b01;
        TAG_exp1 = 2'b10;
        
        $display ( " expected result shift left 1 = %0h", expected_result1);
        // $display ("%b", data_in12); 
        
      end
      
      
      4'b0110:
      
      begin
        
        
       expected_result1 = data_in11 >> shft1; //shift right
       rsp_exp1 = 2'b01;
       TAG_exp1 = 2'b11;
       
       $display ( " expected result shift right 1  = %0h", expected_result1) ;
        
    end
    
  endcase
  
  
  case(command2)
        
        4'b0001:
        
         begin
          
       
          
          overflow2 = data_in21 + data_in22;
           
          
          if (overflow2 < 32'hFFFFFFFF ) begin  //incase of no overflow
            expected_result2 = data_in21 + data_in22;
            rsp_exp2 = 2'b01;
            TAG_exp2 = 2'b00;
          $display ( " expected result addition 2 = %0h", expected_result2);
        end
        else if (overflow2 > 32'hFFFFFFFF ) begin //incase of  overflow
            rsp_exp2 = 2'b10;
            TAG_exp2 = 2'b00;
           $display ( " expected result addition 2 is OVERFLOW"); 
        end
      end
        
        4'b0010:
        
        begin 
          
        if (data_in21 >= data_in22)  //incase of no underflow
          begin
          
          expected_result2 = data_in21 - data_in22; 
          
          rsp_exp2 = 2'b01;
           TAG_exp2 = 2'b01;
          
          $display ( " expected result subtraction 2= %0h", expected_result2);
        end
        else if (data_in21 < data_in22) begin   //incase of  underflow
          
          $display ( " expected result subtraction 2 is UNDERFLOW");
          expected_result2 = 0;   
          rsp_exp2 = 2'b10;
          TAG_exp2 = 2'b01;
        end
        end
        
        4'b0101: 
        
        begin
          
        expected_result2 = data_in21 << shft2; //shift left
        rsp_exp2 = 2'b01;
        TAG_exp2 = 2'b10;
        
        $display ( " expected result shift left 2= %0h", expected_result2);
        
      end
      
      
      default:
      
      begin
        
        
       expected_result2 = data_in21 >> shft2; //shift right
       rsp_exp2 = 2'b01;
       TAG_exp2 = 2'b11;
       
       $display ( " expected result shift right 2 = %0h", expected_result2) ;
        
    end
    
  endcase
  
  
  
  
  case(command3)
        
        4'b0001:
        
         begin
          
          
          overflow3 =   data_in31 + data_in32;
          
          if (overflow3 < 32'hFFFFFFFF ) begin   //incase of no overflow
            expected_result3 = data_in31 + data_in32;
            rsp_exp3 = 2'b01;
            TAG_exp3 = 2'b00;
          $display ( " expected result addition 3 = %0h", expected_result3);
        end
        else if (overflow3 > 32'hFFFFFFFF ) begin //incase of  overflow
            rsp_exp3 = 2'b10;
            TAG_exp3 = 2'b00;
           $display ( " expected result addition 3 is OVERFLOW"); 
        end
      end
        
        
        4'b0010:
        
        begin 
          
        if (data_in31 >= data_in32) begin   //incase of no underflow
          
          expected_result3 = data_in31 - data_in32;
          
          rsp_exp3 = 2'b01;
          TAG_exp3 = 2'b01;
          
          $display ( " expected result subtraction 3= %0h", expected_result3);
        end
        else if (data_in31 < data_in32) begin   //incase of  underflow
          
          $display ( " expected result subtraction 3 is UNDERFLOW");
          
          expected_result3 = 0;   
          rsp_exp3 = 2'b10;
          TAG_exp3 = 2'b01;
        end
        end
        
        4'b0101: 
        
        begin
         
        expected_result3 = data_in31 << shft3; //shift left
        rsp_exp3 = 2'b01;
        TAG_exp3 = 2'b10;
        
        $display ( " expected result shift left 3= %0h", expected_result3);
        
      end
      
      
      4'b0110:
      
      begin
        
      // $display ( " shift value= %d", shft3);  
       expected_result3 = data_in31 >> shft3;  //shift right
       rsp_exp3 = 2'b01;
       TAG_exp3 = 2'b11;
       
       $display ( " expected result shift right 3 = %0h", expected_result3); 
        
    end
    
  endcase
        
          
          case(command4)
        
        4'b0001:
        
         begin
          
          
          
          overflow4=   data_in41 + data_in42;
          if (overflow4 < 32'hFFFFFFFF ) begin  //incase of no overflow
            expected_result4 = data_in41 + data_in42;
            rsp_exp4 = 2'b01;
            TAG_exp4 = 2'b00;
          $display ( " expected result addition 4 = %0h", expected_result4);
        end
        else if (overflow4 > 32'hFFFFFFFF ) begin  //incase of  overflow
          
          
            rsp_exp4 = 2'b10;
            TAG_exp4 = 2'b00;
           $display ( " expected result addition 4 is OVERFLOW");
         end
        end
        
        
        4'b0010:
        
        begin 
          
        if (data_in41 >= data_in42) begin
          
          expected_result4 = data_in41 - data_in42; //incase of no underflow
          
          rsp_exp4 = 2'b01;
          TAG_exp4 = 2'b01;
          
          $display ( " expected result subtraction 4= %0h", expected_result4);
        end
            
        else if (data_in41 < data_in42) begin   //incase of  underflow
          $display ( " expected result subtraction 4 is UNDERFLOW");
          expected_result4 = 0;   
          rsp_exp4 = 2'b10;
          TAG_exp4 = 2'b01;
          
        end
          
        end
        
        4'b0101: 
        
        begin
          
        expected_result4 = data_in41 << shft4; //shift left
        rsp_exp4 = 2'b01;
        TAG_exp4 = 2'b10;
        
        $display ( " expected result shift left 4= %0h", expected_result4);
        
      end
      
      
      4'b0110:
      
      begin
        
        
       expected_result4 = data_in41 >> shft4; //shift right
       rsp_exp4 = 2'b01;
       TAG_exp4 = 2'b11;
       
       $display ( " expected result shift right 4 = %0h", expected_result4); 
        
    end
    
  endcase
        
        
        //displaying actual and expected values
        
        
        $display ( "--------------------------------------------"); 
        $display ( " expected response 1 = %d ", rsp_exp1); 
        $display ( " actual response 1 = %d ", trans.out_resp1);
        $display ( " expected result 1 = %0h ", expected_result1); 
        $display ( " actual outpu 1 = %d ", output_data1);
        $display ( " expected tag 1 = %d ", TAG_exp1); 
        $display ( " actual tag 1 = %d ", TAG1);
        $display ( "--------------------------------------------"); 
        
        $display ( " expected response 2 = %d ", rsp_exp2); 
        $display ( " actual response 2 = %d ", trans.out_resp2);
        $display ( " expected result 2 = %0h ", expected_result2); 
        $display ( " actual outpu 2 = %d ", output_data2);
        $display ( " expected tag 2 = %d ", TAG_exp2); 
        $display ( " actual tag 2 = %d ", TAG2);
        $display ( "--------------------------------------------"); 
        
        $display ( " expected response 3 = %d ", rsp_exp3);
        $display ( " actual response 3 = %d ", trans.out_resp3); 
        $display ( " expected result 3 = %0h ", expected_result3); 
        $display ( " actual outpu 3 = %d ", output_data3);
        $display ( " expected tag 3 = %d ", TAG_exp3); 
        $display ( " actual tag 3 = %d ", TAG3);
        $display ( "--------------------------------------------"); 
        
        $display ( " expected response 4 = %d ", rsp_exp4); 
        $display ( " actual response 4 = %d ", trans.out_resp4); 
        $display ( " expected result 4 = %0h ", expected_result4); 
        $display ( " actual outpu 4 = %d ", output_data4);
        $display ( " expected tag 4 = %d ", TAG_exp4); 
        $display ( " actual tag 4 = %d ", TAG4);
        $display ( "--------------------------------------------"); 
        
    
        //Port 1 correct and error count
        
        if (rsp_exp1 == trans.out_resp1 && expected_result1 == output_data1 && TAG_exp1 == TAG1) begin  // general case
          
              correct1++;
            end          
          else if (rsp_exp1 == trans.out_resp1 && overflow1 > 32'hFFFFFFFF && TAG_exp1 == TAG1) begin // in case of overflow
            correct1++;
          end
        else if ( rsp_exp1 == trans.out_resp1 && data_in11 < data_in12 && TAG_exp1 == TAG1 && command1 == 4'b0010) begin // in case of undeflow
          
            correct1++;
          end
        else
          begin
            error1++;
          end
          
          
          
          // Port 2 correct and error count
          
          if (rsp_exp2 == trans.out_resp2 && expected_result2 == output_data2 && TAG_exp2 == TAG2) begin //general case
          
              correct2++;
            end          
          else if (rsp_exp2 == trans.out_resp2 && overflow2 > 32'hFFFFFFFF && TAG_exp2 == TAG2) begin // incase of overflow
            correct2++;
          end
        else if ( rsp_exp2 == trans.out_resp2 && data_in21 < data_in22 && TAG_exp2 == TAG2 && command2 == 4'b0010) begin //incase of underflow
          
            correct2++;
          end
        else
          begin
            error2++;
          end
          
         // Port 3 correct and error count
          
           if (rsp_exp3 == trans.out_resp3 && expected_result3 == output_data3 && TAG_exp3 == TAG3) begin // general case
          
              correct3++;
            end          
          else if (rsp_exp3 == trans.out_resp3 && overflow3 > 32'hFFFFFFFF && TAG_exp3 == TAG3) begin //incase of overflow
            correct3++;
          end
        else if ( rsp_exp3 == trans.out_resp3 && data_in31 < data_in32 && TAG_exp3 == TAG3 && command3 == 4'b0010) begin //incase of underflow
          
            correct3++;
          end
        else
          begin
            error3++;
          end
          
          //Port 4 correct and error count
          
          
          if (rsp_exp4 == trans.out_resp4 && expected_result4 == output_data4 && TAG_exp4 == TAG4) begin  //general case
          
              correct4++;
            end          
          else if (rsp_exp4 == trans.out_resp4  && overflow4 > 32'hFFFFFFFF && TAG_exp4 == TAG4) begin // incase of overflow
            correct4++;
          end
        else if ( rsp_exp4 == trans.out_resp4  && data_in41 < data_in42 && TAG_exp4 == TAG4 && command4 == 4'b0010) begin //incase of underflow
          
            correct4++;
          end
        else
          begin
            error4++;
          end
          
          
          //print of error and correct counting
          
        $display ( "--------------------------------------------");  
        
      $display("Correct1= %d, error1 = %d",correct1,error1);
      $display("Correct2= %d, error2 = %d",correct2,error2);
      $display("Correct3= %d, error3 = %d",correct3,error3);
      $display("Correct4= %d, error4 = %d",correct4,error4);
      
       $display ( "--------------------------------------------"); 
      
      num_of_trans++;
      $display("NUMBER OF TEST = %d",num_of_trans);
      
      
      $display ( "--------------------------------------------------ENDED ENDED----------------------------------------------------"); 
      $display ( "--------------------------------------------------ENDED ENDED----------------------------------------------------");
   //   $display("TEST = %d",test_data);
    

  //    num_of_trans++;
      
      
    end
    
  endtask
  
endclass

