class driver;
  
  virtual intf vif;
  
  mailbox gen2driv;
  
  function new(virtual intf vif,mailbox gen2driv); 
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    
    repeat(1) 
      begin
       transaction trans;
      
        gen2driv.get(trans);
       
        vif.D     <= trans.D;
        vif.clk     <= trans.clk;
		vif.reset     <= trans.reset;
      
        
        trans.Q     = vif.Q;      
        trans.display("Driver");
        
    end
  endtask
  
endclass