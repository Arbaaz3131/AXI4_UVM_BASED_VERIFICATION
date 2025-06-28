interface inter(input clk);

	//-------------- WRITE ADDRESS CHANNEL --------------------//
	
	logic ARESETn;
	logic AWVALID,AWREADY,AWLOCK;
	logic [31:0]AWADDR;
	logic [7:0]AWLEN;
	logic [2:0]AWSIZE;
	logic [1:0]AWBURST;
	logic [3:0]AWCACHE;
	logic [2:0]AWPROT;
	logic [3:0]AWQOS,AWREGION;
	logic [4:0]AWID;


	//-------------- WRITE DATA CHANNEL --------------------//
	
	logic WVALID,WREADY,WLAST;
	logic [31:0]WDATA;
	logic [3:0]WSTRB;


	//-------------- WRITE RESPONSE CHANNEL --------------------//
	
	logic BVALID;
	logic BREADY;
	logic [1:0]BRESP;
	logic [4:0]BID;



	//-------------- READ ADDRESS CHANNEL --------------------//
	
	logic ARVALID,ARREADY,ARLOCK;
	logic [31:0]ARADDR;
	logic [7:0]ARLEN;
	logic [2:0]ARSIZE;
	logic [1:0]ARBURST;
	logic [3:0]ARCACHE;
	logic [2:0]ARPROT;
	logic [3:0]ARQOS,ARREGION;
	logic [4:0]ARID;


	//-------------- READ DATA CHANNEL --------------------//
	
	logic RVALID,READY,RLAST;
	logic [31:0]RDATA;
	logic [1:0]RRESP;
	logic [4:0]RID;


	
	
	clocking cb_driver@(posedge clk);
		
		output AWVALID,AWADDR,AWSIZE,AWBURST,AWCACHE,AWPROT,AWID,AWLEN,AWLOCK,AWQOS,AWREGION;
		input AWREADY;

		output WVALID,WLAST,WDATA,WSTRB;
		input WREADY;

		output BREADY;
		input BVALID,BRESP,BID;

		output ARVALID,ARADDR,ARSIZE,ARBURST,ARCACHE,ARPROT,ARID,ARLEN,ARLOCK,ARQOS,ARREGION;
		input ARREADY;
		
		output READY;
		input RDATA,RLAST,RVALID,RID;

	endclocking



	clocking cb_monitor@(posedge clk);
		
		input AWVALID,AWADDR,AWSIZE,AWBURST,AWCACHE,AWPROT,AWID,AWLEN,AWLOCK,AWQOS,AWREGION;
		input AWREADY;

		input WVALID,WLAST,WDATA,WSTRB;
		input WREADY;

		input BREADY;
		input BVALID,BRESP,BID;

		input ARVALID,ARADDR,ARSIZE,ARBURST,ARCACHE,ARPROT,ARID,ARLEN,ARLOCK,ARQOS,ARREGION;
		input ARREADY;
		
		input READY;
		input RDATA,RLAST,RVALID,RID;

	endclocking




endinterface
