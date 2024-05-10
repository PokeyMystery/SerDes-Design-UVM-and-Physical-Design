
module tb_piso_10bit;
    reg clk;
    reg rst;
    reg [9:0] par_in;
    reg load_en;
    wire ser_out;

    PISO dut(.*);

initial begin
clk=0;
forever #5 clk=~clk;
end
    initial begin
        rst = 1; // Active high reset
        par_in = 10'b1010101010; // Test input value
        load_en = 0;

        #10 rst = 0; // Release reset
        #10 load_en = 1; // Load test input value

        #10 load_en = 0;
        #1000 $finish;
    

        // End simulation
        $finish;
    end

endmodule

