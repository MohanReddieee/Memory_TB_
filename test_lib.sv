class mem_wr_rd_test extends uvm_test;
mem_env env;
	`uvm_component_utils(mem_wr_rd_test)

  function new(string name , uvm_component parent);
    super.new(name,parent);
	endfunction

	function void buid();
		env = mem_env::type_id::create("env",this);
		//mem_wr_rd_test = new("mem_wr_rd_test",this)
	endfunction

	task run_phase(uvm_phase phase);
		mem_wr_rd_seq seq = new("seq");
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
		seq.start(env.agent.sqr);
		phase.drop_objection(this);
	endtask

	 function void end_of_elaboration();
	 	uvm_top.print_topology();
	 endfunction
endclass
	
