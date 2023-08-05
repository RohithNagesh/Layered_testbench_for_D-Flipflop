class transaction;
   rand bit [2:0] D;
   rand bit reset;
   bit clk;
   bit [2:0] Q;

  function void display(string name);
    $display("*************************");
    $display(" %s ",name);
    $display("*************************");
    $display("D = %0d",D);
    $display("reset = %0d, clk= %0d",reset,clk);
	$display("Q = %0d",Q); 
    $display("*************************");
  endfunction
  
  
endclass