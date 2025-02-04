class mem_agent extends uvm_agent;//child class Extends from uvm_agent
 mem_drv drv;
 mem_sqr sqr;
 mem_mon mon;
 mem_subs subs;
`uvm_component_utils(mem_agent) // Factory registration

function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction
//creating the children like instantiating the child class
function void build();
	drv = new("drv",this); // refers to mem_agent
	sqr = new("sqr",this);
	mon = new("mon",this);
	subs = new("subs",this);
endfunction
function void connect();
    drv.seq_item_port.connect(sqr.seq_item_export);
  endfunction 
  
  function void end_of_elaboration();
  uvm_top.print_topology();
endfunction
   
  //task run();
   // fork
      //sqr.run();
      //drv.run();
	  //mon.run();
	//  subs.run();
  //  join
//  endtask
  
endclass
