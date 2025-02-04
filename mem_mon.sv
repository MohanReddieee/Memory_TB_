class mem_mon extends uvm_monitor;
uvm_analysis_port#(mem_tx) ap_port;
virtual mem_intf vintf;
mem_tx tx;

`uvm_component_utils(mem_mon)

  function new(string name,uvm_component parent);
	super.new(name,parent);
endfunction

function void build();
	ap_port = new("ap_port",this);
endfunction
task run();

vintf = top.intf;
forever begin
	@(vintf.mon_cb);
	if(vintf.mon_cb.valid  && vintf.mon_cb.ready)begin
		tx = new();
		tx.addr = vintf.mon_cb.addr;
		tx.data = vintf.mon_cb.wr_rd ? vintf.mon_cb.wdata : vintf.mon_cb.rdata;
		tx.wr_rd = vintf.mon_cb.wr_rd;
		//tx.print("tx given to the coverage");
		ap_port.write(tx);
		ap_port.write(tx);
	end
end
endtask
endclass
ndclass
