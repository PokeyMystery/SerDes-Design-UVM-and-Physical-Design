class test_SerDes extends base_test;
  `uvm_component_utils(test_SerDes)
  function new(string name="test_SerDes", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    repeat(1000) begin
    seq.randomize();
    end
  endfunction
endclass
