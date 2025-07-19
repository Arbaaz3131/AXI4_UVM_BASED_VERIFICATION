# AXI4_UVM_BASED_VERIFICATION

• Performed functional verification of the AXI4 protocol, targeting its application in high-performance and high-bandwidth system designs.

• Developed a UVM-based testbench to verify AXI4 with single master-to-slave communication, supporting burst, interleaving, out-of-order, and outstanding transactions.

• Implemented a self-checking slave environment and a functional coverage model to ensure thorough verification of the design under test (DUT).


Key Features of the Verification Environment:

 • Independent read and write channels.

 • Separate address/control and data phases.

 • Parallel execution of read and write transactions.

 • Support for outstanding transactions with no fixed timing relationship between address and data phases.

 • Handling of burst types such as INCR and WRAP.

 • Proper verification of OKAY and SLVERR responses.

 • Support for unaligned and narrow transfers.

 • Verification of out-of-order transactions and read interleaving scenarios.










-> Worked on functional verification of the AXI4 protocol, focusing on its role in high-performance and high-bandwidth systems.

-> Built a UVM-based testbench for AXI4 with support for single master-slave communication, including burst, interleaving, out-of-order, and outstanding transactions.

-> Implemented a functional coverage model, and a self-checking slave environment to verify DUT functionality

The project focused on developing a slave verification environment with the following key features:
• Independent read and write channels.
• Separate address/control and data phases.
• Parallel read and write transfers.
• Support for outstanding transactions.
• No strict timing relationship between address and data phases.
• Handling of different burst types (INCR, WRAP).
• Proper handling of OKAY and SLAVE ERROR responses.
• Support for unaligned address transfers.
• Support for narrow transfers.
• Out-of-order transactions and read interleaving.
