module axi_top;

	import uvm_pkg::*;
	import my_package::*;

	bit clk;
	

	inter intf(clk);

	always #2 clk++;

	initial begin
		uvm_config_db #(virtual inter)::set(null,"uvm_test_top.*","inter",intf);
		run_test();
	end




endmodule
