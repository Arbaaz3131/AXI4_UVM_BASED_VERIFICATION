class axi_scoreboard extends uvm_scoreboard;

	`uvm_component_utils(axi_scoreboard)

	`uvm_analysis_imp_decl(_outmon)

	uvm_analysis_imp #(sequence_item,axi_scoreboard)h_inp_imp;
	uvm_analysis_imp #(sequence_item,axi_scoreboard)h_out_imp;
	sequence_item h_seqin,h_seqout;

	function new(string name="axi_scoreboard",uvm_component parent);
		super.new(name,parent);
		`uvm_info("SCOREBOARD_BUILT",$sformatf("SCOREBOARD_BUILT"),UVM_FULL);					
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		h_inp_imp=new("h_inp_imp",this);
		h_out_imp=new("h_out_imp",this);
	endfunction

	function write(sequence_item INDATA);
		h_seqin=INDATA;
	endfunction

	function write_outmon(sequence_item OUTDATA);
		h_seqout=OUTDATA;
	endfunction


endclass
