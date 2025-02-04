class mem_tx extends uvm_sequence_item;
//`uvm_object_utils(mem_tx)
	rand bit [7:0] addr;
	rand bit [31:0] data;
	rand bit wr_rd;
  
 `uvm_object_utils_begin(mem_tx)
 	`uvm_field_int(addr,UVM_ALL_ON)
 	`uvm_field_int(data,UVM_ALL_ON)
 	`uvm_field_int(wr_rd,UVM_ALL_ON)
 `uvm_object_utils_end
  function new(string name = "");
    super.new(name);
  endfunction
endclass

