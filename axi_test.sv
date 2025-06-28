class axi_test extends uvm_test;

	`uvm_component_utils(axi_test)

	axi_environment h_env;
	axi_sequence h_sequence;


	function new(string name="axi_test",uvm_component parent);
		super.new(name,parent);
		`uvm_info("TEST_BUILT",$sformatf("TEST_BUILT"),UVM_FULL);					
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		h_env=axi_environment::type_id::create("h_env",this);
		h_sequence=axi_sequence::type_id::create("h_sequence");
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
    print();
  endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		phase.raise_objection(this,"objection_raised");
		h_sequence.start(h_env.h_active.h_seqr);
		#8;		
		phase.drop_objection(this,"objection_dropped");
	endtask



endclass
