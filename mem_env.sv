class mem_env extends uvm_env;
  mem_agent agent;
  //mem_ref ref_i;
`uvm_component_utils(mem_env)

function new(string name, uvm_component parent);
	super.new(name,parent);
endfunction

function void build();
	agent = new("agent",this);
	//ref_i = new("ref_i",this);
endfunction

  task run();
    fork
    	agent.run();
		//ref_i.run();
    join
  endtask
endclass
