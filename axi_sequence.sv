//---------- WRAP4_write
class axi_sequence extends uvm_sequence #(sequence_item);
	
	`uvm_object_utils(axi_sequence)

	function new(string name="axi_sequence");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D40;AWBURST=='d2;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;});
			
		//#50;
		
	endtask




endclass






class incr_len4 extends axi_sequence;

	`uvm_object_utils(incr_len4)

	function new(string name="axi_sequence");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D22;AWBURST=='d1;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1010;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		#50;
		
	endtask




endclass





class incr_len4_strb extends axi_sequence;

	`uvm_object_utils(incr_len4_strb)

	function new(string name="axi_sequence");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D20;AWBURST=='d1;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1010;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b0011;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b0101;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1100;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		#50;
		
	endtask




endclass


//---------- WRAP4_write_read_new_address_while_write_is_in_progress(d)
//---------- out_of_order_transaction
class wrap4_multi_wr extends axi_sequence;
	
	`uvm_object_utils(wrap4_multi_wr)

	function new(string name="axi_sequence");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D40;AWBURST=='d2;AWID=='d1;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='d90;AWBURST=='d2;AWID=='d2;AWLEN=='d4;AWSIZE=='d2;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});//
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D22;AWBURST=='d1;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1010;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==0;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});			
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==1;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==1;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==1;WDATA=='h12345678;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		
	endtask




endclass








//---------- WRAP4_write_read
class wrap4_wr_rd extends axi_sequence;
	
	`uvm_object_utils(wrap4_wr_rd)

	function new(string name="wrap4_wr_rd");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			
			//----------------------- WRITE	------------------------------------//			
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D40;AWBURST=='d2;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});

			//----------------------- READ	------------------------------------//
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D40;ARBURST=='d2;ARID=='d5;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		//#50;
		
	endtask




endclass




//---------- WRAP4_write_read
class wrap4_wr_rd_sameaddr extends axi_sequence;
	
	`uvm_object_utils(wrap4_wr_rd_sameaddr)

	function new(string name="wrap4_wr_rd_sameaddr");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			
			//----------------------- WRITE	------------------------------------//			
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D40;AWBURST=='d2;AWID=='d5;AWLEN=='d4;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;ARADDR=='D40;ARBURST=='d2;ARID=='d10;ARLEN=='d4;ARSIZE=='d2;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==1;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==1;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==1;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;READY==1;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});

		//#50;
		
	endtask




endclass




//---------- WRAP8_write(d)
class wrap8_wr_multi_rd extends axi_sequence;
	
	`uvm_object_utils(wrap8_wr_multi_rd)

	function new(string name="wrap8_wr_multi_rd");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
			`uvm_do_with(req,{ARESETn==0;});
			
			//----------------------- WRITE	------------------------------------//			
			`uvm_do_with(req,{ARESETn==1;AWVALID==1;AWADDR=='D400;AWBURST=='d2;AWID=='d5;AWLEN=='d8;AWSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==1;WLAST==1;BREADY==1;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;WDATA=='h12345678;READY==0;WSTRB=='b1111;ARVALID==0;});


			//----------------------- READ	------------------------------------//
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D400;ARBURST=='d2;ARID=='d31;ARLEN=='d8;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
			//----------------------- READ	------------------------------------//
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D400;ARBURST=='d2;ARID=='d9;ARLEN=='d8;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			

		//#50;
		
	endtask




endclass








//---------- WRAP4,INCR4_read
class multi_rd extends axi_sequence;
	
	`uvm_object_utils(multi_rd)

	function new(string name="multi_rd");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D40;ARBURST=='d2;ARID=='d5;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D92;ARBURST=='d1;ARID=='d10;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		//#50;
		
	endtask




endclass





//---------- sending_new_Address_when_first_transaction_is_half_completed
class multi_rd_out_standing extends axi_sequence;
	
	`uvm_object_utils(multi_rd_out_standing)

	function new(string name="multi_rd_out_standing");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D40;ARBURST=='d2;ARID=='d5;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D92;ARBURST=='d1;ARID=='d10;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});		
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		//#50;
		
	endtask




endclass




//---------- sending_new_Address_when_first_transaction_is_half_completed
class multi_rd_len_1_4 extends axi_sequence;
	
	`uvm_object_utils(multi_rd_len_1_4)

	function new(string name="multi_rd_len_1_4");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D4000;ARBURST=='d2;ARID=='d5;ARLEN=='d1;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D92;ARBURST=='d1;ARID=='d10;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});		
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		
	endtask




endclass





//---------- incr_wrap_incr_with_len_4_1_8
class multi_rd_len_4_1_8 extends axi_sequence;
	
	`uvm_object_utils(multi_rd_len_4_1_8)

	function new(string name="multi_rd_len_4_1_8");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D920;ARBURST=='d1;ARID=='d10;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});				
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D4000;ARBURST=='d2;ARID=='d5;ARLEN=='d1;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D92;ARBURST=='d1;ARID=='d15;ARLEN=='d8;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});		
		for(int i=0;i<13;i++)begin//{
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		end//}
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		
	endtask


endclass




//---------- incr_multi_transaction_with_odd_beats
class incr_multi_rd_odd_beats extends axi_sequence;
	
	`uvm_object_utils(incr_multi_rd_odd_beats)

	function new(string name="incr_multi_rd_odd_beats");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D920;ARBURST=='d1;ARID=='d5;ARLEN=='d7;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});				
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D4000;ARBURST=='d1;ARID=='d10;ARLEN=='d1;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D100;ARBURST=='d1;ARID=='d15;ARLEN=='d10;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});		
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D0;ARBURST=='d1;ARID=='d20;ARLEN=='d9;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});		
		
		for(int i=0;i<27;i++)begin//{
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		end//}
		
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		
	endtask




endclass





//---------- incr,with_multiple_transactions_with_same_id,one_address_is_out_of_boundary
class incr_with_same_awid extends axi_sequence;
	
	`uvm_object_utils(incr_with_same_awid)

	function new(string name="incr_with_same_awid");
		super.new(name);
	endfunction

	task body;
		req=sequence_item::type_id::create("axi_sequence");
		`uvm_do_with(req,{ARESETn==0;});
			

		//----------------------- READ	------------------------------------//
      `uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D4000;ARBURST=='d1;ARID=='d5;ARLEN=='d4;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});				
      `uvm_do_with(req,{ARESETn==1;AWVALID==0;ARADDR=='D4090;ARBURST=='d1;ARID=='d5;ARLEN=='d8;ARSIZE=='d2;WVALID==0;WLAST==0;BREADY==0;ARVALID==1;READY==0;});
		
      for(int i=0;i<12;i++)begin//{
			`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==1;WSTRB=='b1111;});
		end//}
		
		`uvm_do_with(req,{ARESETn==1;AWVALID==0;WVALID==0;WLAST==0;BREADY==0;ARVALID==0;READY==0;WSTRB=='b1111;});
			
		
	endtask




endclass
