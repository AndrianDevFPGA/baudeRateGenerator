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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity bauderatemodule is
    port (
        clk : in std_logic;
        rst : in std_logic;
        bauderate : in std_logic_vector(16 downto 0);
        tick : out std_logic
    );
end bauderatemodule;

architecture rtl of bauderatemodule is
    signal counter : std_logic_vector(16 downto 0);
begin
    process (clk) is
    begin
        if (rst = '1') then
            tick <= '0';
            counter <= (others => '0');
        elsif (rising_edge (clk)) then
            if (counter = bauderate) then
                tick <= '1';
                counter <= (others => '0');
            else
                tick <= '0';
                counter <= counter + 1;
            end if;
        end if;
    end process;
end rtl;

*/



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
/*

module baudRate (
                clk,
                rst,
                baudeRate,
                tick
                );
    input clk;
    input rst;
    input [31:0] baudeRate;
    output reg tick;
    
    integer counter;
    
    always @ (posedge clk)
      begin
        if (rst)
          begin
            counter <= 1;
          end 
        else
          counter <= counter + 1;
          begin
            if (counter == baudeRate)
              begin
                tick <= 1;
                counter <= 1;
              end 
            else
              begin
                tick <= 0;
              end 
          end 
      end 
endmodule
*/
