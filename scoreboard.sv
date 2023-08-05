class scoreboard;
  
  mailbox mon2scb;
  
  
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    transaction trans;
    repeat(1)
      begin
      mon2scb.get(trans);
        
        if((trans.reset==0) && trans.Q==0)
          $display("Result is as Expected");
        
        else if((trans.reset==1) && (trans.clk==1) && (trans.Q==trans.D))
			$display("Result is as Expected");
        
        else
		  $error("Wrong Result");
           
         trans.display("Scoreboard");
    end
  endtask
  
endclass

