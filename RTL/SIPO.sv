module SIPO(
    input logic clk,
    input logic rst,
    input logic ser_in,
    input logic shift_en,
    output logic [9:0]    par_out
);

    logic [9:0]       shift_reg;

    always @ (posedge clk)begin
        if (rst) begin
            shift_reg <= 0;
            par_out <=0;
        end
        else begin
            if (shift_en) begin
                par_out <= shift_reg;
            end
            else 
                shift_reg <= {ser_in,shift_reg[9:1] };
        end
    end

endmodule 
