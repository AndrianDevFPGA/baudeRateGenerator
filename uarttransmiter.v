/*
  Name : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Transmitter state machine uart
*/

module transmitter(
                    clk,
                    rst,
                    start,
                    dataIn,
                    dataOut

    );
    
    input clk;
    input rst;
    input start;
    input dataIn;
    output reg dataOut;
    
    integer counter;
    
    integer state ;
    
    always @ (posedge clk)
      begin
        if (!rst)
          begin
            dataOut <= 1;
            state <= 0;
            counter <= 0;
          end 
        else 
          begin
            counter <= counter +1;
            case (state)
              0:
                begin
                  if (start)
                    begin
                      state <=1;
                    end 
                end 
              1:
                begin
                  state <=2;
                  counter <=0;
                end 
              2:
                begin
                  if (counter ==32'd15)
                    begin
                      state <=3;
                    end       
                end 
              3:
                begin
                  state <= 0;
                end 
            endcase
          end 
      end 
    
    always @ (negedge clk)
      begin
        case (state)
          0:
            begin
              dataOut <=1;;
            end 
          1:
            begin
              dataOut <=0;
            end
          2:
            begin
              dataOut <= dataIn;
            end 
          3:
            begin
              dataOut <=1;
            end 
        endcase
      end 
      
endmodule
