`timescale 1ns/10ps
module top_tb();
    logic [31:0] data_in;
    logic [31:0] data_out;
    logic clk;
    logic rst;


    top T(.*);

    initial begin
        clk = 0;
        forever #0.5 clk = ~clk;
    end


    initial begin
        rst = 1;
        data_in = 32'b10101010_10101010_10101010_10101010;
        #2 rst = 0;

        #13 data_in = 32'b01010101_01010101_01010101_01010101;
        repeat (10) begin
            #13 data_in = $random;
        end
        #13 $finish;
    end

    initial begin
        $monitor($time, " clk: %0d, rst: %0d, data_in: %0h, data_out: %0h", clk, rst, data_in, data_out);
        $dumpfile("top.vcd");
        $dumpvars;
    end

endmodule

