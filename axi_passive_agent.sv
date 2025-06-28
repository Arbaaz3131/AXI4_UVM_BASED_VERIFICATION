class passive_agent extends uvm_agent;

	`uvm_component_utils(passive_agent)

	axi_out_mon h_outmon;


	function new(string name="passive_agent",uvm_component parent);
		super.new(name,parent);
		`uvm_info("PASSIVE_AGENT_BUILT",$sformatf("PASSIVE_AGENT_BUILT"),UVM_FULL);		
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		h_outmon=axi_out_mon::type_id::create("h_outmon",this);
	endfunction


endclass
