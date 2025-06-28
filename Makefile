home = /home/chicago/tools/Questa_2021.4_3/questasim/linux_x86_64/../modelsim.ini

pack = package.sv

top = axi_top.sv
#dut = axi_dut.sv
interface = axi_interface.sv

work:
	vlib work
map:
	vmap work work 

comp:
	vlog -work work +cover +acc -sv $(pack) $(top)  $(interface) $(dut)


sim:
	vsim -coverage -sva -c -do "log -r /*;coverage save -onexit cover_file.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l single.log -wlf single.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_FULL +uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_INCR4:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit INCR4.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l INCR4.log -wlf INCR4.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,incr_len4	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_INCR4_strb:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit INCR4_strb.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l INCR4_strb.log -wlf INCR4_strb.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,incr_len4_strb	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1



sim_wrap4_multi_wr:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit wrap4_multi_wr.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l wrap4_multi_wr.log -wlf wrap4_multi_wr.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,wrap4_multi_wr	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1



sim_wrap4_wr_rd:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit wrap4_wr_rd.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l wrap4_wr_rd.log -wlf wrap4_wr_rd.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,wrap4_wr_rd	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_wrap4_wr_rd_sameaddr:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit wrap4_wr_rd_sameaddr.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l wrap4_wr_rd_sameaddr.log -wlf wrap4_wr_rd_sameaddr.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,wrap4_wr_rd_sameaddr	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_wrap8_wr_multi_rd:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit wrap8_wr_multi_rd.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l wrap8_wr_multi_rd.log -wlf wrap8_wr_multi_rd.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,wrap8_wr_multi_rd	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_multi_rd:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit multi_rd.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l multi_rd.log -wlf multi_rd.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,multi_rd	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_multi_rd_out_standing:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit multi_rd_out_standing.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l multi_rd_out_standing.log -wlf multi_rd_out_standing.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,multi_rd_out_standing	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_multi_rd_len_1_4:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit multi_rd_len_1_4.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l multi_rd_len_1_4.log -wlf multi_rd_len_1_4.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,multi_rd_len_1_4	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1


sim_multi_rd_len_4_1_8:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit multi_rd_len_4_1_8.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l multi_rd_len_4_1_8.log -wlf multi_rd_len_4_1_8.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,multi_rd_len_4_1_8	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1



sim_incr_multi_rd_odd_beats:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit incr_multi_rd_odd_beats.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l incr_multi_rd_odd_beats.log -wlf incr_multi_rd_odd_beats.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,incr_multi_rd_odd_beats	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1



sim_incr_with_same_awid:
	vsim -debugdb -coverage -sva -c -do "log -r /*;coverage save -onexit incr_multi_rd_odd_beats.ucdb -assert -directive -cvg -codeAll ;run -all ;exit" -coverage -sva -l incr_with_same_awid.log -wlf incr_with_same_awid.wlf work.axi_top +UVM_TESTNAME=axi_test +svSeed=RANDOM +UVM_VERBOSITY=UVM_HIGH +uvm_set_type_override=axi_sequence,incr_with_same_awid	+uvm_set_type_override=axi_inp_mon,axi_inp_mon1

wave: 
	vsim -view vsim.wlf

merge:
	vcover merge all_cover.ucdb *.ucdb
	
clean:
	rm -rf *.ini transcript work regression_status_list *.log merge_list_file *.wlf .goutputstream* *.swp *.dbg wlf* *.vstf *.ucdb





