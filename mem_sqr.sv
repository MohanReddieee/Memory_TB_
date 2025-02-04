class mem_sqr extends uvm_sequencer#(mem_tx);
  mem_tx tx,tx_t;
  mem_tx txQ[$];
  `uvm_component_utils(mem_sqr)
  function new(string name,uvm_component parent);
  	super.new(name,parent);
  endfunction
 endclass

