class sequence_item extends uvm_sequence_item;

		`uvm_object_utils(sequence_item)
		
		rand bit ARESETn;
		rand bit [31:0]AWADDR,WDATA,ARADDR;
		rand bit [7:0]AWLEN,ARLEN;
		rand bit [4:0]AWID,ARID;
		rand bit [3:0]AWCACHE,ARCACHE,AWQOS,ARQOS,WSTRB,AWREGION,ARREGION;
		rand bit [2:0]AWPROT,ARPROT,AWSIZE,ARSIZE;
		rand bit [1:0]AWBURST,ARBURST;
		rand bit AWVALID,AWLOCK;
		bit AWREADY;

		rand bit WVALID,WLAST;
		bit WREADY;

		rand bit BREADY;  					//----- keep it as high or logic needs to be written from driver side
		bit BVALID,BID;
		bit [1:0]BRESP;

	  rand bit ARVALID;
		rand bit ARLOCK;
		bit ARREADY;       //d
		
		rand bit READY;
		bit [31:0]RDATA;
		bit [4:0]RID;
		bit RLAST,RVALID;
  		bit [1:0]RRESP;



		function new(string name="");
			super.new(name);
		endfunction





endclass
