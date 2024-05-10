class gen_item extends uvm_sequence;
   `uvm_object_utils(gen_item)
   
   function new(string name="gen_item");
      super.new(name);
   endfunction
   
   rand int num;
   
   //constraint c1 {soft num inside {[1000:1500]}; }
   
   virtual task body();
      for(int i=0; i < 10000; i++) begin
         Item m_item = Item::type_id::create("m_item");
         start_item(m_item);
         m_item.randomize();
         
         `uvm_info("SEQ", $sformatf("Generate new item: %s", m_item.convert2str()), UVM_MEDIUM);
         finish_item(m_item);
         
      end
      
      `uvm_info("SEQ", $sformatf("Done generation of %0d items", num), UVM_LOW)
      
   endtask
endclass
