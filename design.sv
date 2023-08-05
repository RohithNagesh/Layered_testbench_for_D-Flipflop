// Code your design here
module DFF_ASRL(D,clk,reset,Q);
  input bit[2:0] D;
  input bit clk;
  input bit reset;
  output bit[2:0] Q;
  
always @(posedge clk or negedge reset) 
begin
 if(reset==1'b0)
  Q <= 1'b0; 
 else 
  Q <= D; 
end 
endmodule