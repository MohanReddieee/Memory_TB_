class mem_wr_rd_seq extends uvm_sequence#(mem_tx);
  mem_tx tx_t;
  `uvm_object_utils(mem_wr_rd_seq)//since it is an object it won't have parent
  task body();
    `uvm_do_with(req,{req.wr_rd == 1'b1;});
	tx_t = new req;
    `uvm_do_with(req,{req.wr_rd == 1'b1; req.addr == tx_t.addr;});
  endtask
