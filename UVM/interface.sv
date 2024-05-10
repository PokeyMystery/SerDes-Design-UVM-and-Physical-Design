interface SerDes_if(input bit clk);
   logic rst;
   logic [31:0] data_in;
   logic [31:0] data_out;
   
   clocking cb@(posedge clk);
      default input #1step output #1ns;
      input data_out;
      output data_in;
   endclocking
endinterface
