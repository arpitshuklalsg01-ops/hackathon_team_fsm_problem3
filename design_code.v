module teamFSM (
    input clk,
    input rst,    
    input we,      
    input [1:0]  addr,     
    input [3:0]  wdata,    
    output reg  [3:0]  rdata 
);
  reg [3:0] R_mem [0:3];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
          for (i = 0; i < 4; i = i + 1)begin
              R_mem[i] <= 4'b0000;
          end
            rdata <= 4'b0000;
        end
      else if (we)begin
            R_mem[addr] <= wdata;
      end
        else begin
            rdata <= R_mem[addr];
        end
    end
endmodule
