class active_agent extends uvm_agent;

	`uvm_component_utils(active_agent)
	axi_inp_mon h_inpmon;
	axi_driver h_driver;
	axi_sequencer h_seqr;

	function new(string name="active_agent",uvm_component parent);
		super.new(name,parent);
		`uvm_info("ACTIVE_AGENT_BUILT",$sformatf("ACTIVE_AGENT_BUILT"),UVM_FULL);
	endfunction

	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		h_inpmon=axi_inp_mon::type_id::create("h_inpmon",this);
		h_driver=axi_driver::type_id::create("h_driver",this);
		h_seqr=axi_sequencer::type_id::create("h_seqr",this);
	endfunction


	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		h_driver.seq_item_port.connect(h_seqr.seq_item_export);
	endfunction





endclass
