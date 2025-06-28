class coverage extends uvm_component;

  `uvm_component_utils(coverage)
  
  uvm_analysis_imp #(sequence_item,coverage) scr_imp;

  sequence_item h_seqitem;





  covergroup cvrgrp;
  
   RESET:coverpoint h_seqitem.ARESETn{  
                                        bins reset_0={0};
                                        bins reset_1={1};
                                      }
    

    //---------------------- SINGLE BIT ------------------------------//

    AWVALID:coverpoint h_seqitem.AWVALID{ 
                                          bins  awvalid_0={0};
                                          bins  awvalid_1={1};
                                        }

    WVALID:coverpoint h_seqitem.WVALID{ 
                                          bins  wvalid_0={0};
                                          bins  wvalid_1={1};
                                        }
    
    WLAST:coverpoint h_seqitem.WLAST{ 
                                          bins  wlast_0={0};
                                          bins  wlast_1={1};
                                        }
    
    BREADY:coverpoint h_seqitem.BREADY{ 
                                          bins  bready_0={0};
                                          bins  bready_1={1};
                                        }


    ARVALID:coverpoint h_seqitem.ARVALID{ 
                                          bins  arvalid_0={0};
                                          bins  arvalid_1={1};
                                        }
    
    READY:coverpoint h_seqitem.READY{ 
                                          bins  ready_0={0};
                                          bins  ready_1={1};
                                        }
    
    
    //---------------------- MULTI_BIT ------------------------------//

    AWBURST:coverpoint h_seqitem.AWBURST{ 
                                          bins  awburst_0={0};
                                          bins  awburst_1={1};
                                          bins  awburst_2={2};
                                          bins  awburst_3={3};
                                        }


    ARBURST:coverpoint h_seqitem.ARBURST{ 
                                          bins  arburst_0={0};
                                          bins  arburst_1={1};
                                          bins  arburst_2={2};
                                          bins  arburst_3={3};
                                        }

    AWSIZE:coverpoint h_seqitem.AWSIZE{ 
                                          bins  awsize_0={0};
                                          bins  awsize_1={1};
                                          bins  awsize_2={2};
                                          bins  awsize_3={3};
                                          bins  awsize[]={[4:7]};
                                        }
    
    ARSIZE:coverpoint h_seqitem.ARSIZE{ 
                                          bins  arsize_0={0};
                                          bins  arsize_1={1};
                                          bins  arsize_2={2};
                                          bins  arsize_3={3};
                                          bins  arsize[]={[4:7]};
                                        }
    
    WSTRB:coverpoint h_seqitem.WSTRB{ 
                                          bins  wstrb_0={0};
                                          bins  wstrb_1={1};
                                          bins  wstrb[]={[2:$]};
                                        }
     
    AWID:coverpoint h_seqitem.AWID{ 
                                          bins  awid_low={[0:9]};
                                          bins  awid_mid={[10:20]};
                                          bins  awid_high={[21:$]};
                                        }

    ARID:coverpoint h_seqitem.ARID{ 
                                          bins  arid_low={[0:9]};
                                          bins  arid_mid={[10:20]};
                                          bins  arid_high={[21:$]};
                                        }
 
 
    AWLEN:coverpoint h_seqitem.AWLEN{ 
                                          bins  awlen[6]={[0:127]};
                                        }
    
    ARLEN:coverpoint h_seqitem.ARLEN{ 
                                          bins  arlen[6]={[0:127]};
                                        }
    
    AWADDR:coverpoint h_seqitem.AWADDR{ 
                                          bins  awaddr_low1={[0:500]};
                                          bins  awaddr_low2={[501:1000]};
                                          bins  awaddr_mid1={[1001:2000]};
                                          bins  awaddr_mid2={[2001:3000]};
                                          bins  awaddr_high1={[3001:4000]};
                                          bins  awaddr_high2={[4001:$]};
                                        }

  
 
  
  
    //---------------------- TRANSITION BINS ------------------------------//

    AWVALID_TRAN:coverpoint h_seqitem.AWVALID{ 
                                          bins  awvalid_0_0=(0=>0);
                                          bins  awvalid_0_1=(0=>1);
                                          bins  awvalid_1_0=(1=>0);
                                          bins  awvalid_1_1=(1=>1);
                                        }

    WVALID_TRAN:coverpoint h_seqitem.WVALID{ 
                                          bins  wvalid_0_0=(0=>0);
                                          bins  wvalid_0_1=(0=>1);
                                          bins  wvalid_1_0=(1=>0);
                                          bins  wvalid_1_1=(1=>1);    
                                        }
    
    WLAST_TRAN:coverpoint h_seqitem.WLAST{ 
                                          bins  wlast_0_0=(0=>0);
                                          bins  wlast_0_1=(0=>1);
                                          bins  wlast_1_0=(1=>0);  
                                          //illegal_bins wlast_1_1=(1=>1);
                                        }
    
    BREADY_TRAN:coverpoint h_seqitem.BREADY{ 
                                          bins  bready_0_0=(0=>0);
                                          bins  bready_0_1=(0=>1);
                                          bins  bready_1_0=(1=>0);
                                          bins  bready_1_1=(1=>1);                                            
                                        }


    ARVALID_TRAN:coverpoint h_seqitem.ARVALID{ 
                                          bins  arvalid_0_0=(0=>0);
                                          bins  arvalid_0_1=(0=>1);
                                          bins  arvalid_1_0=(1=>0);
                                          bins  arvalid_1_1=(1=>1);
                                        }
    
    READY_TRAN:coverpoint h_seqitem.READY{ 
                                          bins  ready_0_0=(0=>0);
                                          bins  ready_0_1=(0=>1);
                                          bins  ready_1_0=(1=>0);
                                          bins  ready_1_1=(1=>1);                                             
                                        }
  
  
  
  
  endgroup

  function new(string name="coverage",uvm_component parent);
    super.new(name,parent);
		cvrgrp=new();
		
    //h_seqitem=new("h_seqitem",this);
  endfunction


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    h_seqitem=sequence_item::type_id::create("",this);    
		scr_imp=new("implementation port",this);
  endfunction
  
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever #2 cvrgrp.sample;
  endtask

	function write(sequence_item INDATA);
		h_seqitem=INDATA;
	endfunction


endclass


