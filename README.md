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


