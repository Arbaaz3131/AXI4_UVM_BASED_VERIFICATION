//*********************************************************//
//                    UVM_AXI_PACKAGE                      //
//*********************************************************//
package my_package;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "axi_sequence_item.sv"
  `include "axi_sequence.sv"
  `include "axi_sequencer.sv"
  `include "axi_driver.sv"
  `include "axi_input_monitor.sv"
  `include "axi_output_monitor.sv"
  `include "axi_active_agent.sv"
  `include "axi_passive_agent.sv"
  `include "axi_scoreboard.sv"
  `include "axi_coverage.sv"
  `include "axi_environment.sv"
  `include "axi_test.sv"
endpackage
