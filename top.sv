`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "memory.sv"
`include "mem_common.sv"
`include "mem_tx.sv"
`include "mem_intf.sv"
`include "mem_drv.sv"
`include "mem_sqr.sv"
`include "mem_mon.sv"
`include "mem_subs.sv"
`include "mem_agent.sv"
`include "mem_seq_lib.sv"
`include "mem_env.sv"
`include "test_lib.sv"

module top;
  reg clk,rst;
 // mem_env env = new();
  mem_intf intf(clk,rst);
  memory dut(
    .clk(intf.clk),
    .rst(intf.rst),
    .addr(intf.addr),
    .wr_rd(intf.wr_rd),
    .wdata(intf.wdata),
    .rdata(intf.rdata),
    .valid(intf.valid),
    .ready(intf.ready)
  );
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    rst = 1;
    repeat(2) @(posedge clk);
    rst = 0;
    //env.run();
  end
    initial begin
	run_test("mem_wr_rd_test");
end
  initial begin
    $dumpfile("1.vcd");
    $dumpvars(0);
  end
endmodule


