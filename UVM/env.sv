class env extends uvm_env;
    `uvm_component_utils(env)

    agent a0;
    scoreboard sb; 

    function new(string name="env", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        a0 = agent::type_id::create("a0", this);
        sb = scoreboard::type_id::create("sb", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        // Connect the monitor's analysis port to the scoreboard's analysis export
        a0.m0.mon_analysis_port.connect(sb.m_analysis_imp);
    endfunction
endclass

