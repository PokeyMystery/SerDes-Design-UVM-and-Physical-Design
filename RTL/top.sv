`include"SerDes.sv"
module top(input logic [31:0] data_in, output logic [31:0] data_out, input logic clk, rst);
   
   wire s1, s2, s3, s4;
   wire start;
   
   SerDes S1(
    .data_in(data_in),
    .data_out(data_out),
    .clk(clk),
    .rst(rst),
    .ser_out(ser_out),
    .ser_out2(ser_out2),
    .ser_out3(ser_out3),
    .ser_out4(ser_out4),
    .ser_in(s1),
    .ser_in2(s2),
    .ser_in3(s3),
    .ser_in4(s4),
    .start_o(start_o),
    .start_i(start)
);

assign s1 = ser_out;
assign s2 = ser_out2 ;
assign s3 = ser_out3;
assign s4 = ser_out4;
assign start = start_o;

endmodule

