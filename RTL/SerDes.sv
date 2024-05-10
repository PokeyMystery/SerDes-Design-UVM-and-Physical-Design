`include "SIPO.sv"
`include "PISO.sv"
`include "encoder.sv"
`include "decoder.sv"

module SerDes(
    input logic [31:0] data_in,
    output logic [31:0] data_out,
    input logic clk,
    input logic rst,
    output logic ser_out, 
    output logic ser_out2,
    output logic ser_out3,
    output logic ser_out4,
    input logic ser_in,
    input logic ser_in2,
    input logic ser_in3,
    input logic ser_in4,
    output logic start_o,
    input logic start_i
);

   logic [9:0] en_out, en_out2, en_out3, en_out4;
   logic [9:0] si_out, si_out2, si_out3, si_out4;

   logic en_en, de_en, p_en, s_en;
   reg [2:0] s_state, s_next;
   reg [3:0] d_state, d_next;
   logic [3:0] count, count_2;
   
   encoder E1(.clk(clk), .rst(rst), .data_8b_in(data_in[7:0]), .ser_en(en_en), .data_10b_out(en_out));
   PISO P1S01(.clk(clk), .rst(rst), .par_in(en_out), .load_en(p_en), .ser_out(ser_out));  
   
   SIPO S1P01(.clk(clk), .rst(rst), .ser_in(ser_in), .shift_en(s_en), .par_out(si_out));
   decoder D1(.clk(clk), .rst(rst), .data_10b_in(si_out), .par_en(de_en), .data_8b_out(data_out[7:0]));
   
   encoder E2(.clk(clk), .rst(rst), .data_8b_in(data_in[15:8]), .ser_en(en_en), .data_10b_out(en_out2));
   PISO P1S02(.clk(clk), .rst(rst), .par_in(en_out2), .load_en(p_en), .ser_out(ser_out2));  
   
   SIPO S1P02(.clk(clk), .rst(rst), .ser_in(ser_in2), .shift_en(s_en), .par_out(si_out2));
   decoder D2(.clk(clk), .rst(rst), .data_10b_in(si_out2), .par_en(de_en), .data_8b_out(data_out[15:8]));
    
   encoder E3(.clk(clk), .rst(rst), .data_8b_in(data_in[23:16]), .ser_en(en_en), .data_10b_out(en_out3));
   PISO P1S03(.clk(clk), .rst(rst), .par_in(en_out3), .load_en(p_en), .ser_out(ser_out3));  
   
   SIPO S1P03(.clk(clk), .rst(rst), .ser_in(ser_in3), .shift_en(s_en), .par_out(si_out3));
   decoder D3(.clk(clk), .rst(rst), .data_10b_in(si_out3), .par_en(de_en), .data_8b_out(data_out[23:16]));
   
   encoder E4(.clk(clk), .rst(rst), .data_8b_in(data_in[31:24]), .ser_en(en_en), .data_10b_out(en_out4));
   PISO P1S04(.clk(clk), .rst(rst), .par_in(en_out4), .load_en(p_en), .ser_out(ser_out4));  
   
   SIPO S1P04(.clk(clk), .rst(rst), .ser_in(ser_in4), .shift_en(s_en), .par_out(si_out4));   
   decoder D4(.clk(clk), .rst(rst), .data_10b_in(si_out4), .par_en(de_en), .data_8b_out(data_out[31:24]));
  
   parameter S0 = 4'b0000;
   parameter S1 = 4'b0001;
   parameter S2 = 4'b0010;
   parameter S3 = 4'b0011;
   parameter S4 = 4'b0100;
   
   parameter P0 = 4'b0101;
   parameter P1 = 4'b0110;
   parameter P2 = 4'b0111;
   parameter P3 = 4'b1000;
      
   always@(posedge clk)begin
      if(rst)begin
            s_state <= S0;
            d_state <= P0;
         end
      else begin 
         s_state <= s_next;
         d_state <= d_next;
         end
   end
   
   always@(posedge clk)
   begin 
      case(s_state)
         S0 :  begin    
                 en_en = 1;
                 p_en = 0;
                 start_o = 0;
                 s_next = S1; 
                 end        
         S1 :  begin 
                 en_en = 0;
                 p_en = 0;
                 count = 4'b0000;
                 start_o = 0;
                 s_next = S2;
                 end             
         S2 : begin 
                 p_en = 1;
                 s_next = S3;  
                 start_o=1;            
              end
         S3 : begin 
                 p_en = 0;              
                 s_next = S4;           
              end
         S4 : if(count == 4'b1010) begin 
                 start_o = 0;
                 en_en=1;
                 s_next = S1;            
              end 
              else begin 
                 count = count + 4'b001;                    
                 s_next = S4; 
                 end
      endcase  

      case(d_state)
          P0 : if (start_i == 1) begin 
                  s_en = 0;
                  de_en = 0;
                  count_2 = 4'b0000;
                  d_next = P1;     
               end else begin 
                  s_en = 1;
                  d_next = P0;
               end     
          P1 : if(count_2 == 4'b1010)begin 
                  s_en = 1;
                  count_2 = 4'b0000;
                  d_next = P2;        
               end else begin                  
                  count_2 = count_2 + 4'b0001;
                  d_next = P1;                  
               end           
          P2 : begin 
                  s_en = 0;
                  de_en = 1;
                  d_next = P3;                
               end         
          P3 : begin 
                  de_en = 0;
                  d_next = P0;                  
               end            
       endcase
    end        
endmodule
