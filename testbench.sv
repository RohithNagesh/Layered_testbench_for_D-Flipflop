
`include "interface.sv"
`include "test"
module tbench_top;
 
  bit clk;
  initial clk = 0;
 
  always #2 clk = !clk ;
  
  intf i_intf(clk);
  test t1(i_intf);
  
  DFF_ASRL d1 (
    .D(i_intf.D),
    .clk(i_intf.clk),
    .reset(i_intf.reset),
    .Q(i_intf.Q)
   );
    
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule