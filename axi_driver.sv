class axi_driver extends uvm_driver #(sequence_item);

	`uvm_component_utils(axi_driver)

	virtual inter intf;

	function new(string name="axi_driver",uvm_component parent);
		super.new(name,parent);
		`uvm_info("DRIVER_BUILT",$sformatf("DRIVER_BUILT"),UVM_FULL);				
	endfunction

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		uvm_config_db #(virtual inter)::get(this,this.get_full_name,"inter",intf);
		forever@(intf.cb_driver)begin//{
			seq_item_port.get_next_item(req);
			
			intf.AWADDR<=req.AWADDR;
			intf.WDATA<=req.WDATA;
			intf.ARADDR<=req.ARADDR;
			intf.AWLEN<=req.AWLEN;
			intf.ARLEN<=req.ARLEN;
			intf.AWID<=req.AWID;
			intf.ARID<=req.ARID;
			intf.AWCACHE<=req.AWCACHE;
			intf.ARCACHE<=req.ARCACHE;
			intf.AWQOS<=req.AWQOS;
			intf.ARQOS<=req.ARQOS;
			intf.WSTRB<=req.WSTRB;
			intf.AWREGION<=req.AWREGION;
			intf.ARREGION<=req.ARREGION;
			intf.AWPROT<=req.AWPROT;
			intf.ARPROT<=req.ARPROT;
			intf.AWSIZE<=req.AWSIZE;
			intf.ARSIZE<=req.ARSIZE;
			intf.AWBURST<=req.AWBURST;
			intf.ARBURST<=req.ARBURST;
			intf.AWVALID<=req.AWVALID;
			intf.AWLOCK<=req.AWLOCK;
			intf.WVALID<=req.WVALID;
			intf.WLAST<=req.WLAST;
			intf.BREADY<=req.BREADY;
			intf.ARVALID<=req.ARVALID;
			intf.ARLOCK<=req.ARLOCK;
			intf.READY<=req.READY;
			intf.ARESETn<=req.ARESETn;
			
			seq_item_port.item_done();
		end//}
	endtask

	


endclass


/*



		AWADDR,WDATA,ARADDR,AWLEN,ARLEN;AWID,ARID,AWCACHE,ARCACHE,AWQOS,ARQOS,WSTRB,AWREGION,ARREGION,AWPROT,ARPROT,AWSIZE,ARSIZE,AWBURST,ARBURST;AWVALID,AWLOCK,WVALID,WLAST,BREADY,ARVALID,ARLOCK,RREADY;		



*/
