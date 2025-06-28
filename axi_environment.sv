class axi_environment extends uvm_env;

	`uvm_component_utils(axi_environment)
		
		axi_scoreboard h_scrb;
		active_agent h_active;
		passive_agent h_passive;
        coverage h_cover;

		function new(string name="axi_environment",uvm_component parent);
			super.new(name,parent);
		`uvm_info("ENVIRONMENT_BUILT",$sformatf("ENVIRONMENT_BUILT"),UVM_FULL);			
		endfunction

		function void build_phase(uvm_phase phase);
			super.build_phase(phase);
			h_scrb=axi_scoreboard::type_id::create("h_scrb",this);
			h_active=active_agent::type_id::create("h_active",this);
			h_passive=passive_agent::type_id::create("h_passive",this);
			h_cover=coverage::type_id::create("h_cover",this);
		endfunction

		function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
			h_active.h_inpmon.inp_port.connect(h_scrb.h_inp_imp);
			h_passive.h_outmon.out_port.connect(h_scrb.h_inp_imp);
			h_active.h_inpmon.inp_port.connect(h_cover.scr_imp);
		endfunction

endclass
