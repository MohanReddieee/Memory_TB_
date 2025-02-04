class mem_drv extends uvm_driver#(mem_tx);
  mem_tx tx;
  virtual mem_intf vintf;
`uvm_component_utils(mem_drv)
function new();
	super.new(name,parent);
endfunction

  task run();
    vintf = top.intf;
    forever begin
      //mem_common::mbox.get(tx);
      //tx.print();
	  seq_item_port.get_next_item(req);
      drive_tx(req);
	  seq_item_port.item_done();
    end
  endtask
  
  task drive_tx(mem_tx tx);
    @(vintf.bfm_cb);
    vintf.bfm_cb.addr <= tx.addr;
    if(tx.wr_rd == 1) vintf.bfm_cb.wdata <= tx.data;
    vintf.bfm_cb.wr_rd <= tx.wr_rd;
    vintf.bfm_cb.valid <= 1;
    wait(vintf.bfm_cb.ready == 1);
    
    @(vintf.bfm_cb);
    if(tx.wr_rd == 0) tx.data <= vintf.bfm_cb.rdata;
    vintf.bfm_cb.addr <= 0;
    vintf.bfm_cb.wdata <= 0;
    vintf.bfm_cb.wr_rd <= 0;
    vintf.bfm_cb.valid <= 0;
  endtask
endclass

