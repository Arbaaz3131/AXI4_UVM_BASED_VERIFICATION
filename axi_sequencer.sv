class axi_sequencer extends uvm_sequencer #(sequence_item);

	`uvm_component_utils(axi_sequencer)


	function new(string name="axi_sequencer",uvm_component parent);
		super.new(name,parent);
		`uvm_info("SEQUENCER_BUILT",$sformatf("SEQUENCER_BUILT"),UVM_FULL);
	endfunction




endclass
