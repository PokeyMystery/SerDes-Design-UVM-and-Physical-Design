class scoreboard extends uvm_scoreboard;
	`uvm_component_utils(scoreboard)

	logic [31:0] fifo [0:9];
	int unsigned push_ptr = 0;
	int unsigned pop_ptr = 1;
	logic [31:0] prev = 32'bx;

	function new(string name="scoreboard", uvm_component parent=null);
    	super.new(name, parent);
	endfunction

	uvm_analysis_imp #(Item, scoreboard) m_analysis_imp;

	virtual function void build_phase(uvm_phase phase);
    	super.build_phase(phase);
    	m_analysis_imp = new("m_analysis_imp", this);
    	foreach (fifo[i]) begin
       	fifo[i] = 32'b0;
    	end
	endfunction

	virtual function void write(Item item);
	if(item.rst) begin
	pop_ptr = pop_ptr+1;
	end
	else if(!item.rst) begin
    	if (item.data_in != fifo[push_ptr]) begin
        	push_ptr = (push_ptr == 9) ? 0 : push_ptr + 1;
        	fifo[push_ptr] = item.data_in;
    	end
    	if (item.data_out != prev) begin
        	if (pop_ptr > 9)
        	   pop_ptr = 1;
        	else if (pop_ptr ==9)
        	   pop_ptr = 0;
        	else
        	pop_ptr = pop_ptr+1;
        	if (fifo[pop_ptr] != item.data_out) begin
            	`uvm_error("SCBD", $sformatf("FAIL! data_out=%0d expected=%0d", item.data_out, fifo[pop_ptr]))
        	end else begin
            	`uvm_info("SCBD", $sformatf("PASS! data_out=%0d expected=%0d", item.data_out, fifo[pop_ptr]), UVM_MEDIUM)
        	end  
    	end
    	prev = item.data_out;
    	end
	endfunction
endclass


