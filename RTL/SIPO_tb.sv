module tb_SIPO;
    reg clk;
    reg rst;
    reg ser_in;
    reg shift_en;
    wire [9:0] par_out;

    SIPO dut (.*);
    
initial begin
clk=0;
forever #5 clk=~clk;
end

    initial begin
        rst = 1; // Active high reset
        ser_in = 0; // Initial serial input value
        shift_en = 1;

        // Release reset
        #10 rst = 0;

        // Load initial value
        #10 shift_en = 0;

        // Shift and verify parallel output
        

        // Test shifting without loading new input
        #10 ser_in = 1;
        #10 ser_in = 0;
        #10 ser_in = 1;
        #10 ser_in = 0;
        #10 ser_in = 1;
        #10 ser_in = 0;
        #10 ser_in = 1;
        #10 ser_in = 0;
        #10 ser_in = 1;
        #10 shift_en = 1;
        
#50 $finish;
        
    end


endmodule

