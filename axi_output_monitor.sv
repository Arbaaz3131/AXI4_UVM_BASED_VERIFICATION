class axi_out_mon extends uvm_monitor;

	`uvm_component_utils(axi_out_mon)

	uvm_analysis_port #(sequence_item)out_port;
	
	sequence_item h_seqitem;

	function new(string name="axi_out_mon",uvm_component parent);
		super.new(name,parent);
		`uvm_info("OUTMON_BUILT",$sformatf("OUTMON_BUILT"),UVM_FULL);				
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		h_seqitem=sequence_item::type_id::create("h_seqitem",this);
		out_port=new("out_port",this);
	endfunction


endclass
