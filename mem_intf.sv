`define DEPTH 256
`define WIDTH 16
`define ADDR_WIDTH 8
interface mem_intf(input bit clk,rst);
  bit [`ADDR_WIDTH-1:0] addr;
  bit [`WIDTH-1:0] wdata; 
  bit wr_rd,valid;
  bit [`WIDTH-1:0] rdata; 
  bit ready;
  clocking bfm_cb@(posedge clk);
  default input #1 output #0;
  input rst;
  output addr;
  output wdata;
  output wr_rd;
  output valid;
  input rdata;
  input ready; 
  endclocking

clocking mon_cb@(posedge clk);
default input #1;
input rst;
input addr, wdata, wr_rd, valid;
input rdata, ready;
endclocking

endinterface
