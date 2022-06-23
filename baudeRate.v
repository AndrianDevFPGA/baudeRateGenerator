/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Bauderate generator code in Verilog
  This code is inspired by this link :  http://electronoobs.com/eng_circuitos_tut26_code1.php
*/

module baudeRate(
                 clk,
                 rst,
                 baudeRate,
                 tick

    );
    input clk;
    input rst;
    input [16:0] baudeRate;
    output tick;
    
    reg [16:0] baudeRatecompter;
    
    assign tick = (baudeRatecompter ==baudeRate)?1:0;
    
    always @ (posedge clk or negedge rst)
      begin
        if (!rst)
          begin
            baudeRatecompter <= 1;
          end 
        else if (tick)
          begin
            baudeRatecompter <= 1;
          end 
        else
          begin
            baudeRatecompter <= baudeRatecompter +1;
          end 
      end 
    
endmodule
/*
// Test bench code for bauderate generator

module tbBaudeRateGenerator(

    );
    reg clk;
    reg rst;
    reg [16:0] baudeRate;
    wire tick;
    
    baudeRate dut(
                 clk,
                 rst,
                 baudeRate,
                 tick

    );
    
    initial
      begin
        clk = 0;
        rst = 0;
        baudeRate = 16'd10;
        #10
        rst = 1;
        #300
        baudeRate = 16'd30;
        #300
        baudeRate = 16'd80;
      end 
      
    always 
      begin
        #5 clk = !clk;
      end 

endmodule

*/
