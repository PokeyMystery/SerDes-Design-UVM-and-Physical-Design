`include"package.sv"
class base_test extends uvm_test;
  `uvm_component_utils(base_test)
  function new(string name = "base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  env  				e0;
  gen_item		seq;
  virtual  SerDes_if vif;
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    e0 = env::type_id::create("e0", this);
    
    if (!uvm_config_db#(virtual SerDes_if)::get(this, "", "SerDes_vif", vif))
      `uvm_fatal("TEST", "Did not get vif")      
    uvm_config_db#(virtual SerDes_if)::set(this, "e0.a0.*", "des_vif", vif);
    
    seq = gen_item::type_id::create("seq");
    seq.randomize();
    
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    apply_reset();
    seq.start(e0.a0.s0);
    #14;
    phase.drop_objection(this);
  endtask
  
  virtual task apply_reset();
    vif.rst <= 1;
    vif.data_in <= 0;
    repeat(1) @ (posedge vif.clk);
    repeat(1) @ (posedge vif.clk);
    vif.rst <= 0;    
    repeat(1) @ (posedge vif.clk);
  endtask
endclass
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
