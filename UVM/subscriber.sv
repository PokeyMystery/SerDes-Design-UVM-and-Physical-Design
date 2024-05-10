class MyCoverage extends uvm_subscriber #(Item);
  `uvm_component_utils(MyCoverage)

  bit [31:0] data_in;
  bit rst;
  bit data_out;

covergroup item_coverage;
  option.per_instance = 1;

  // Define coverpoint for each bit of data_in
  coverpoint data_in[31:0] {
    bins ones = {[0:255]}; // To cover at least one occurrence of each bit being set
    bins zeros = {[0:255]}; // To cover at least one occurrence of each bit being clear
    // You can add more bins or coverpoints here if needed
  }

  // Cross coverpoint to capture all possible combinations of data_in values
  //data_cross : cross data_in[0], data_in[1], data_in[31];

endgroup : item_coverage

  uvm_analysis_imp #(Item, MyCoverage) analysis_export; // Declare analysis export

  function new(string name = "MyCoverage", uvm_component parent=null);
    super.new(name, parent);
    item_coverage = new();
    analysis_export = new("analysis_export", this); // Initialize analysis export
  endfunction

  virtual function void write(Item t);
        `uvm_info("SUB", $sformatf("Saw item %s", t.convert2str()), UVM_MEDIUM)
        data_in = t.data_in;
        rst = t.rst;
        data_out = t.data_out;
        item_coverage.sample();
  endfunction
endclass

