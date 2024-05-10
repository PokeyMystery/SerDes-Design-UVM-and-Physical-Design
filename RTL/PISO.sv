module PISO(
    input logic clk,
    input logic rst,
    input logic [9:0] par_in,
    input logic load_en,
    output logic ser_out
);

    logic [9:0] shift_reg;

    always @ (posedge clk)begin
        if (rst) begin
            shift_reg <= 0;
        end 
        else begin 
            if (load_en) begin
                shift_reg <= par_in;
            end
            else begin
                ser_out <= shift_reg[0];
                shift_reg <= {1'b0, shift_reg[9:1]};  
                end
        end
    end

endmodule
