`timescale 1ns/1ps
module tb;
    reg clk, rst, we;
    reg  [1:0] addr;
    reg  [3:0] wdata;
    wire [3:0] rdata;

   teamFSM uut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | rst=%b | we=%b | addr=%b | wdata=%h | rdata=%h", $time, rst, we, addr, wdata, rdata);

        rst = 1; we = 0; addr = 0; wdata = 0;
        #7 rst = 0;

      //data writing
        @(negedge clk); we = 1; addr = 2'b00; wdata = 4'b1010;
        @(posedge clk); #1;

        @(negedge clk); we = 1; addr = 2'b01; wdata = 4'b1011;
        @(posedge clk); #1;

        @(negedge clk); we = 1; addr = 2'b10; wdata = 4'b1100;
        @(posedge clk); #1;

        @(negedge clk); we = 1; addr = 2'b11; wdata = 4'b1101;
        @(posedge clk); #1;

      //data reading
        @(negedge clk); we = 0; addr = 2'b00;
        @(posedge clk); #1;

        @(negedge clk); we = 0; addr = 2'b01;
        @(posedge clk); #1;
      
        @(negedge clk); we = 0; addr = 2'b10;
        @(posedge clk); #1;

        @(negedge clk); we = 0; addr = 2'b11;
        @(posedge clk); #1;
      
      //checking reset
        rst = 1; 
      #7 rst = 0;
        @(negedge clk); we = 0; addr = 2'b00;
        @(posedge clk); #1;

        $finish;
    end
endmodule
