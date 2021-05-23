

`include "environment.sv"

program test(inter_calc intf);
   
  //declaring environment instance
  environment env;
    
  
  initial begin
    //creating environment
    
    env = new(intf);
    
  env.gen.repeat_count = 200;
   
    //calling run task of env
    env.run();
  end
endprogram

