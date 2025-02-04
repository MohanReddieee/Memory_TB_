class mem_subs extends mem_subscriber;
`uvm_component_utils(mem_subs)
mem_tx tx;
 function new();
 	super.new(name,this);
 endfunction

covergroup mem_cg;
coverpoint tx.addr{
	option.auto_bin_max= 8;
}
coverpoint tx.wr_rd{
   bins	WRITE = {1'b1};
   bins READ = {1'b0};
}
endgroup

function new();
	mem_cg = new();
endfunction

function void write(mem_tx t);
		$cast(tx,t)
		mem_cg.sample();
endfunction
endclass
