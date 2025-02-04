module memory(clk,rst,addr,wdata,rdata,wr_rd,valid,ready);
  parameter DEPTH = 256;
  parameter WIDTH = 16;
  parameter ADDR_WIDTH = 8;
  input clk;
  input rst;
  input [ADDR_WIDTH-1:0] addr;
  input [WIDTH-1:0] wdata;
  input wr_rd,valid;
  output reg [WIDTH-1:0] rdata;
  output reg ready;
  integer i;
  reg [WIDTH-1:0]  mem [DEPTH-1:0];
  
  always @(posedge clk) begin
    if(rst == 1) begin
      rdata = 0;
      ready = 0;
      for(i = 0; i< DEPTH ; i=i+1) begin
        mem[i] = 0;
      end
    end
    else begin
      if(valid == 1) begin
        ready = 1;
        if(wr_rd == 1) begin
          mem[addr] = wdata;
        end
        else begin
          rdata = mem[addr];
        end
      end
        else begin
          ready = 0;
        end
    end
  end
endmodule
