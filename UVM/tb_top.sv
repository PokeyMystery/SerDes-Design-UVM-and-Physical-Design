`include "uvm_macros.svh"
import uvm_pkg::*;
`include "base_test.sv"

module tb;
    reg clk;
    /* pragma state_vector s_state next_state_vector s_next */
    // Clock generation
    always #0.5 clk = ~clk; // Adjusted clock period to 1 time unit

    // Instantiation of interface and DUT
    SerDes_if _if (clk);
    top u0 (
        .clk(clk),
        .rst(_if.rst),
        .data_in(_if.data_in),
        .data_out(_if.data_out)
    );

    // Covergroups
    covergroup cg_data @(posedge clk);
        option.per_instance = 1;

        // Value range cover points
        valid_data : coverpoint _if.data_in {
            bins default_bin = default; // Default bin to capture unspecified values
            bins till_eightG = {[0:858993459]};
            bins till_one_SevenG = {[858993460:1717986919]};
            bins till_remaining = {[1717986920:$]};
        }
    endgroup : cg_data;

    covergroup cg_FSM_1 @ (posedge clk);
        option.per_instance = 1;
        valid_ser : coverpoint u0.s_state iff (_if.rst == 0){
            bins valid_state[] = {u0.S0, u0.S1, u0.S2, u0.S3, u0.S4};
            bins valid_tran_ser[] = (u0.S1 => u0.S2 ), (u0.S2 => u0.S3), (u0.S3 => u0.S4), (u0.S4 => u0.S4), (u0.S4 => u0.S1);
            bins reset_ser = (u0.S1, u0.S2, u0.S3, u0.S4 => u0.S0);
            bins others_ser[] = default;
        }

        valid_des : coverpoint u0.d_state iff (_if.rst == 0) {
            bins valid_des[] = {u0.P0, u0.P1, u0.P2, u0.P3};
            bins valid_tran_des[] = (u0.P0 => u0.P1),(u0.P1 => u0.P1), (u0.P1 => u0.P2), (u0.P2 => u0.P3), (u0.P3 => u0.P0);
            bins reset_des = (u0.P1, u0.P2, u0.P3 => u0.P0);
            bins others_des[] = default;
        }
        
        cross_cov : cross u0.s_state , u0.d_state;
    endgroup : cg_FSM_1;

    // u0.Properties
    property start_goes_low_after_11_clocks;
        @(posedge clk)
        disable iff(_if.rst)
        ($rose(u0.start) |-> ##11 $fell(u0.start));
    endproperty

    property en_equals_si_on_change_after_rst;
        @(posedge clk)
        disable iff (_if.rst)
        ($changed(u0.si_out) && !$past(_if.rst,2)) |-> (u0.si_out == u0.en_out);
    endproperty


    // Assertions
    assert property (start_goes_low_after_11_clocks)
        else $error("Assertion failed: start did not go low after 11 clocks");

    assert property (en_equals_si_on_change_after_rst)
        else $error("Assertion failed: en_out is not equal to si_out");

    // Covergroup sampling
    cg_FSM_1 fc_inst = new;
    cg_data fc_inst2 = new;

    always @(posedge clk) begin
        fork
        fc_inst.sample();
        fc_inst2.sample();
        join
    end

    // Testbench initialization
    initial begin
        clk = 0;
        uvm_config_db#(virtual SerDes_if)::set(null, "uvm_test_top", "SerDes_vif", _if);
        run_test("test_SerDes");
    end

    // Dumpvars for simulation
    initial begin
        $dumpvars;
        $dumpfile("dump.vcd");
    end
endmodule

