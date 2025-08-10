class axi_inp_mon extends uvm_monitor;

	`uvm_component_utils(axi_inp_mon)

  	uvm_analysis_port #(sequence_item)inp_port;

	sequence_item h_seqitem;

	virtual inter intf;

	bit [7:0]memory[4096];   								//------------------ MEMORY

	typedef struct { bit [31:0]AWADDR;bit [7:0]AWLEN;bit [2:0]AWSIZE;bit [1:0]AWBURST;bit [4:0]AWID;bit[31:0]wr_addrq[$]; }WR_CTRL_DATA;
	typedef struct { bit [31:0]ARADDR;bit [7:0]ARLEN;bit [2:0]ARSIZE;bit [1:0]ARBURST;bit [4:0]ARID;bit[31:0]rd_addrq[$]; }RD_CTRL_DATA;

	WR_CTRL_DATA info_wr[$];  							//--------------- STRUCT_BASED_QUEUE_FOR_WRITE
	RD_CTRL_DATA info_rd[$];  							//--------------- STRUCT_BASED_QUEUE_FOR_READ

	WR_CTRL_DATA temp_struct_wr;   					//------------ write struct for storing control signals parallelly even when another transaction is in progress
	RD_CTRL_DATA temp_struct_rd;   					//------------ read struct for storing control signals parallelly even when another transaction is in progress

	bit [31:0]temp_addr;   									//-------------- ADDRESS CALCULATIONS FOR INCR,WRAP
	bit [31:0] wrap_bndry,high_bndry;

	bit [31:0]wr_addr,rd_addr;             //-------------- FOR POPING ADDRESSES STORED IN WRITE AND READ ADDRESS QUEUE respectively

	bit [31:0]addrq[$];										//-------------TEMP_QUEUE_FOR_ADDRESS_CALCULATION
	
	bit [31:0]aligned_ad;									//------------- aligned_address

	bit [1:0]wr_index;                    //--------------- FOR WRITING INTO THE MEMORY BASED ON STROBE  ( changes required based on aligned and unaligned address in future )

	typedef bit[1:0]RESP[$];

	typedef bit[4:0]five_bits;

	RESP wr_resp[five_bits];							//----- QUEUE_BASED_ASSOCIATIVE_ARRAY_TO_STORE_WRITE_RESPONSES

	five_bits wid_q[$];										//----- TO_STORE_WID_AND_PICK_A_RANDOM_WID_BY_SHUFFLING_TO_SUPPORT_OUT_OF_ORDER

	bit [7:0]rd_index;												//----- FOR_TRACKING_READ_CONTROL_DATA_STRUCT



	function new(string name="axi_inp_mon",uvm_component parent);
		super.new(name,parent);
		uvm_config_db #(virtual inter)::get(this,this.get_full_name,"inter",intf);
		
		`uvm_info("INPMON_BUILT",$sformatf("INPMON_BUILT"),UVM_FULL);	
			inp_port=new("inp_port",this);

	endfunction



	function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      h_seqitem=sequence_item::type_id::create("h_seqitem",this);
	endfunction


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//



	task run_phase(uvm_phase phase);
      super.run_phase(phase);
		forever@(intf.cb_monitor)begin//{ 1
			
			h_seqitem.AWADDR=intf.AWADDR;
			h_seqitem.WDATA=intf.WDATA;
			h_seqitem.ARADDR=intf.ARADDR;
			h_seqitem.AWLEN=intf.AWLEN;
			h_seqitem.ARLEN=intf.ARLEN;
			h_seqitem.AWID=intf.AWID;
			h_seqitem.ARID=intf.ARID;
			h_seqitem.AWCACHE=intf.AWCACHE;
			h_seqitem.ARCACHE=intf.ARCACHE;
			h_seqitem.AWQOS=intf.AWQOS;
			h_seqitem.ARQOS=intf.ARQOS;
			h_seqitem.WSTRB=intf.WSTRB;
			h_seqitem.AWREGION=intf.AWREGION;
			h_seqitem.ARREGION=intf.ARREGION;
			h_seqitem.AWPROT=intf.AWPROT;
			h_seqitem.ARPROT=intf.ARPROT;
			h_seqitem.AWSIZE=intf.AWSIZE;
			h_seqitem.ARSIZE=intf.ARSIZE;
			h_seqitem.AWBURST=intf.AWBURST;
			h_seqitem.ARBURST=intf.ARBURST;
			h_seqitem.AWVALID=intf.AWVALID;
			h_seqitem.AWLOCK=intf.AWLOCK;
			h_seqitem.WVALID=intf.WVALID;
			h_seqitem.WLAST=intf.WLAST;
			h_seqitem.BREADY=intf.BREADY;
			h_seqitem.ARVALID=intf.ARVALID;
			h_seqitem.ARLOCK=intf.ARLOCK;
			h_seqitem.READY=intf.READY;
			h_seqitem.ARESETn=intf.ARESETn;


			$display($time,"\t WRITE_ADDRESS_CHANNEL -----  ARESETn=%0d AWADDR=%0d AWLEN=%0d AWID=%0d AWSIZE=%0d AWBURST=%0d AWVALID=%0d",h_seqitem.ARESETn,h_seqitem.AWADDR,h_seqitem.AWLEN,h_seqitem.AWID,h_seqitem.AWSIZE,h_seqitem.AWBURST,h_seqitem.AWVALID);
			$display($time,"\t WRITE_DATA_CHANNEL  -----  WDATA=%0h WSTRB=%0b WVALID=%0d WLAST=%0d",h_seqitem.WDATA,h_seqitem.WSTRB,h_seqitem.WVALID,h_seqitem.WLAST);						
			$display($time,"\t READ_ADDRESS_CHANNEL -----  ARADDR=%0d ARLEN=%0d ARID=%0d ARSIZE=%0d ARBURST=%0d ARVALID=%d",h_seqitem.ARADDR,h_seqitem.ARLEN,h_seqitem.ARID,h_seqitem.ARSIZE,h_seqitem.ARBURST,h_seqitem.ARVALID);
			$display($time,"\t READ_DATA_CHANNEL 		READY=%d -----  ",h_seqitem.READY);			
			$display($time,"\t RESPONSE_READY        -----  BREADY=%0d  READY=%0d ",h_seqitem.BREADY,h_seqitem.READY);



			if(!h_seqitem.ARESETn)begin//{ 2
				h_seqitem.ARREADY=0;
				h_seqitem.RDATA=0;
				h_seqitem.RID=0;
				h_seqitem.RLAST=0;
				h_seqitem.RVALID=0;
				h_seqitem.BVALID=0;
				h_seqitem.BID=0;
				h_seqitem.BRESP=0;
				h_seqitem.AWREADY=0;
				h_seqitem.WREADY=0;

				
				for(int i=0;i<4096;i++)begin//{
					if(i%2==1)	
						memory[i]='h45;
					else 	
						memory[i]='h18;
				end//}
				//$display("memory=%0p",memory);
				$display("\n");
			end//} 2


			else begin//{ 3
				h_seqitem.AWREADY=1;
				h_seqitem.ARREADY=1;				
				h_seqitem.WREADY=1;
				h_seqitem.BVALID=1;
				h_seqitem.RVALID=1;
				ctrl_info_push;
				write_operation;
				read_operation;
				if(h_seqitem.RVALID==1 && h_seqitem.READY==1)$display($time,"\t READ IN PROGRESS\n\n");
				else $display($time,"\t   NO_READ*******************  RVALID=%0d READY=%0d RLAST=%0d  ***********************\n\n",h_seqitem.RVALID,h_seqitem.READY,h_seqitem.RLAST);


			end//} 3








			

		end//} 1

	endtask





//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//



	//----------===	TASK_TO_PUSH_CONTROL_INFORMATION	===----------//

	task ctrl_info_push;
		
		if(h_seqitem.AWVALID && h_seqitem.AWREADY)begin//{ 1
			
			temp_struct_wr.AWADDR=h_seqitem.AWADDR;
			temp_struct_wr.AWLEN=h_seqitem.AWLEN;
			temp_struct_wr.AWSIZE=h_seqitem.AWSIZE;
			temp_struct_wr.AWBURST=h_seqitem.AWBURST;
			temp_struct_wr.AWID=h_seqitem.AWID;
          	addr_calculation(h_seqitem.AWADDR,h_seqitem.AWSIZE,h_seqitem.AWBURST,h_seqitem.AWLEN,1);
			temp_struct_wr.wr_addrq=addrq;
			info_wr.push_back(temp_struct_wr);
			addrq.delete();																																						//-----CLEARING_QUEUE_FOR_REUSE
			$display($time,"\t check_if_the_queue_is_getting_empty addrq=%0p",addrq);									//------	check_if_the_queue_is_getting_empty
			`uvm_info("NEW_CONTROL_INFO_WR",$sformatf("NEW CONTROL_INFO_PUSH FOR WRITE"),UVM_NONE);

		end//} 1



		if(h_seqitem.ARVALID && h_seqitem.ARREADY)begin//{ 1
			
			temp_struct_rd.ARADDR=h_seqitem.ARADDR;
			temp_struct_rd.ARLEN=h_seqitem.ARLEN;
			temp_struct_rd.ARSIZE=h_seqitem.ARSIZE;
			temp_struct_rd.ARBURST=h_seqitem.ARBURST;
			temp_struct_rd.ARID=h_seqitem.ARID;
          	addr_calculation(h_seqitem.ARADDR,h_seqitem.ARSIZE,h_seqitem.ARBURST,h_seqitem.ARLEN,0);
			temp_struct_rd.rd_addrq=addrq;
			info_rd.push_back(temp_struct_rd);
			addrq.delete();																																						//-----CLEARING_QUEUE_FOR_REUSE
			$display($time,"\t check_if_the_queue_is_getting_empty addrq=%0p",addrq);									//------	check_if_the_queue_is_getting_empty
			`uvm_info("NEW_CONTROL_INFO_RD",$sformatf("NEW CONTROL_INFO_PUSH FOR READ"),UVM_NONE);

		end//} 1


	endtask




//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//




	//----------===	TASK_TO_PUSH_CONTROL_INFORMATION	===----------//

  	//----wr_rd_enable var for using same task for read,write sub-address calculations
  	// unaligned is present for write,so to calculate unaligned addresses for write only using "wr_rd_enable"

  	task addr_calculation(input bit[31:0]addr,bit[2:0]size,bit[1:0]burst,bit[7:0]len,bit wr_rd_enable);
		

		//	-----------		INCREMENT	----------- //

		if(burst=='d1)begin//{ 1  
			
			`uvm_info("INCREMENT_OPERATION",$sformatf("INCREMENT OPERATION STARTED\n"),UVM_NONE);						
			temp_addr=addr;	
			addrq.push_back(temp_addr);
			$display($time,"****************** addr=%0d size=%0d len=%0d",temp_addr,size,len);			
			aligned_ad=(addr/(2**size)) * (2**size);
			
			for(int i=0;i<(len)-1;i++)begin//{   "(len)-1" because starting address is sent already
				
              	if(i==0 && (addr-aligned_ad)>0 && wr_rd_enable)begin//{
					temp_addr=temp_addr+(addr-aligned_ad);
					addrq.push_back(temp_addr);
					`uvm_info("NON_ALIGNED_ADDRESS",$sformatf("aligned_ad=%0d\n",aligned_ad),UVM_NONE);						
				end//}
				else begin//{
					temp_addr=temp_addr+(2**size);
					addrq.push_back(temp_addr);
				end//}

			end//}

			$display($time,"\t address queue=%p",addrq);
		
		end//} 1
		


		//	-----------		WRAP	----------- //

		else if(burst=='d2)begin//{ 2  
			
			`uvm_info("WRAP_OPERATION",$sformatf("WRAP OPERATION STARTED\n"),UVM_NONE);									
			temp_addr=addr;	
			wrap_bndry = (temp_addr/((2**size) * (len))) *(2**size) * (len);
			high_bndry = wrap_bndry +(2**size * len);
			$display($time,"****************** addr=%0d size=%0d len=%0d wrap_bndry===%0d high_bndry=%0d====",temp_addr,size,len,wrap_bndry,high_bndry);
				

    	for(int i=0;i<(len);i++)begin//{
      	
				if(temp_addr>=high_bndry)begin//{
        	temp_addr=wrap_bndry;
        	addrq.push_back(temp_addr);  
        	temp_addr=temp_addr+(2**size);
      	end//}
      	else begin//{
        	addrq.push_back(temp_addr);
        	temp_addr=temp_addr+(2**size);
      	end//}
      
    	end//}
		

		$display($time,"\t address queue=%p",addrq);


		end//} 2



	endtask			// addr_calculation




//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//



	//------------------ TASK_FOR_WRITING_DATA_INTO_MEMORY ---------------------------------//

	task write_operation;
		
		//------------------------- CONDITION_FOR_WRITE -------------------------//
			five_bits temp_wid;	 //----tempo_variable_for_wid

		if(h_seqitem.WVALID && h_seqitem.WREADY)begin//{ 1
			
			wr_addr=info_wr[0].wr_addrq.pop_front();			
			
			for(int i=0;i<$bits(h_seqitem.WSTRB);i++)begin//{
				
				if(h_seqitem.WSTRB[i])begin//{
					
					memory[wr_addr+wr_index]=h_seqitem.WDATA[(i*8)+:8];
				  $display($time,"\t i=%0d  memory[%0d]=%0h",i,wr_addr+wr_index,memory[wr_addr+wr_index]);					
					wr_index++;
					
				end//}
				else begin //{
					$display($time,"\t STOBE IS NOT HIGH FOR %0dth byte",i);
				end//}
			
			end//}
			wr_index=0;
			

			if(h_seqitem.WLAST)begin//{ 2
				
				if(wr_addr<4096)begin 
					wr_resp[info_wr[0].AWID].push_back(0);
					$display($time,"\t wr_resp[%0d]=%0p",info_wr[0].AWID,wr_resp[info_wr[0].AWID]);
				end
				
				if(wr_addr>4096)begin
					wr_resp[info_wr[0].AWID].push_back(2);
					$display($time,"\t wr_resp[%0d]=%0p",info_wr[0].AWID,wr_resp[info_wr[0].AWID]);
				end

				//----------		pushing_awid_here_so_that_this_can_be_later_used_as_key_to_access_response_queue_based_assoc_array_when_BVALID_and_BREADY_are_high	----------//				
				wid_q.push_back(info_wr[0].AWID);

				//---------------		deleting_0th_index_in_the_control_signals_queue,so_that_next_control_signals_data_comes_to_0th	---------------//
				info_wr.delete(0);

				

			end//} 2
			
		end//} 1




		//------------------------- CONDITION_FOR_WRITE_RESP -------------------------//
		
	//	five_bits temp_wid;	 //----tempo_variable_for_wid

		if(h_seqitem.BVALID &&	h_seqitem.BREADY)begin//{ 3
			
			wid_q.shuffle;
			temp_wid=wid_q.pop_front;										//---- i.e; 0th_index_is_popped
			h_seqitem.BRESP=wr_resp[temp_wid].pop_front;	//---- pop_front_because_to_get_resp_in_order_address_arrived,helpful_when_multiple_transactions_with_same_AWID			
			h_seqitem.BID=temp_wid;
			`uvm_info("WRITE_RESP",$sformatf("\t ------- BRESP=%0d BID=%0d-------",h_seqitem.BRESP,h_seqitem.BID),UVM_NONE);			
			
			//----------	deleting_the_queue_in_associative_array_if_it_is_empty	----------//
			
			if( wr_resp[temp_wid].size==0 )begin//{
				wr_resp.delete(temp_wid);
			end//}


		end//} 3





	endtask




//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//




	//------------------ TASK_FOR_WRITING_AND_READING_DATA_INTO_MEMORY ---------------------------------//

	task read_operation;
		
		if(h_seqitem.RLAST)	h_seqitem.RLAST=0;


		if(h_seqitem.RVALID && h_seqitem.READY)begin//{ 1
				
			rd_addr=info_rd[rd_index].rd_addrq.pop_front();			
          	if(rd_addr<4096)begin
          		for(int i=0;i<2**(info_rd[rd_index].ARSIZE);i++)begin//{
					h_seqitem.RDATA[(i*8)+:8]=memory[rd_addr+i];
					$display($time,"\t CURRENT_READ_ADDRESS is %0d  memory[%0d]=%0h",rd_addr+i,rd_addr+i,memory[rd_addr+i]);									
				end//}
            end
          	else begin//{
              `uvm_info("RD_ADDR__OUT_OF_REACH",$sformatf(" rd_addr=%0d ADDRESS OUT OF BOUNDARY",rd_addr),UVM_NONE);
          	end//}
			h_seqitem.RID=info_rd[rd_index].ARID;

			//-----incrementing_to_next_index_for_interleaving_based_on_arlen,checks_if_half_of_address_are_done_moves_to_next_transaction(different_address)
			if( (info_rd[rd_index].rd_addrq.size==(info_rd[rd_index].ARLEN)/2 && info_rd[rd_index].ARLEN%2==0)||(info_rd[rd_index].rd_addrq.size-1==(info_rd[rd_index].ARLEN)/2 && info_rd[rd_index].ARLEN%2==1))begin//{ 2
				

				//-----	rd_index_should_not_increment_when_arlen_is_0_it_gets_deleted_while_asserting_rlast_and_new_queue_comes_at_present_index,so_rd_index_should_remain_same	-----//
				if(info_rd[rd_index].ARLEN>1)begin//{
					
					//------------	once_the_index_reachs_last_element_in_the_queue_it_comes_back_to_0th_so_that_remaining_address_transfers_can_complete	------------//
					if(	rd_index==(info_rd.size)-1	)
						rd_index=0;
					else
						rd_index++;

				end//}


			end//} 2

			//--------- ASSERTING_RLAST --------------//
			if(	info_rd[rd_index].rd_addrq.size==0 )begin//{
				info_rd.delete(rd_index);
				h_seqitem.RLAST=1;
			end//}


			//---------- RESPONSE ---------------//
			if(rd_addr<4096)begin//{ 
				h_seqitem.RRESP='d0;
              `uvm_info("READ_NO_ERROR",$sformatf(" RDATA=%0h  RRESP=%0d RLAST=%0d RID=%0d",h_seqitem.RDATA,h_seqitem.RRESP,h_seqitem.RLAST,h_seqitem.RID),UVM_NONE);
              
			end//}
			else begin//{
				h_seqitem.RRESP='d2;
              `uvm_info("READ_ERROR",$sformatf(" RDATA=%0h  RRESP=%0d RLAST=%0d RID=%0d",h_seqitem.RDATA,h_seqitem.RRESP,h_seqitem.RLAST,h_seqitem.RID),UVM_NONE);

			end//}
			

			//`uvm_info("READ_DATA",$sformatf(" RDATA=%0h  RRESP=%0d RLAST=%0d RID=%0d",h_seqitem.RDATA,h_seqitem.RRESP,h_seqitem.RLAST,h_seqitem.RID),UVM_NONE);




		end//} 1




	endtask





//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

	

endclass
