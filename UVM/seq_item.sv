class Item extends uvm_sequence_item;
   `uvm_object_utils(Item)
   rand bit [31:0] data_in;
   bit rst;
   bit [31:0] data_out;
   
   constraint new_con {data_in dist {[0:858993459]:=10,  [858993460:1717986919]:=2, [1717986920:2576980379]:=2, [2576980380:3435973839]:=2, [3435973840:4294967295]:=2};}
   virtual function string convert2str();
      return $sformatf("data_in=%0d, data_out=%0d, rst=%d", data_in, data_out,rst);
   endfunction
   
   function new(string name = "Item");
      super.new(name);
   endfunction
   
endclass
