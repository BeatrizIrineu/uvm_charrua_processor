`include "charrua_pkg.sv"
`include "charrua_dummy.v"
`include "charrua_if.sv"

module charrua_tb_top;
	import uvm_pkg::*;
	import charrua_pkg::*;
	`include "test_lib.sv"
	
	charrua_if vif;

	charrua_dummy #(rom_filename) dut(
		.clk(vif.clk),
		.reset_n(vif.reset_n),
		.hold_n(vif.hold_n),
		.im_data(vif.im_data),
		.im_addr(vif.im_addr),
		.im_CEn(vif.im_CEn),
		.im_OEn(vif.im_OEn),
		.dm_CEn(vif.dm_CEn),
		.dm_OEn(vif.dm_OEn),
		.dm_WEn(vif.dm_WEn),
		.dm_in_data(vif.dm_in_data),
		.dm_out_data(vif.dm_out_data)
	);

	initial begin
		uvm_config_db#(virtual charrua_if)::set(uvm_root::get(), "*", "vif", vif);
		run_test();

		if (!uvm_config_db #(string)::get(uvm_root::get(), "*", "rom_filename", rom_filename)) begin
			$display("ROM filename not set. TEST FAIL");
		end
		else begin 
			$display("ROM filename set %s. TEST PASSED", rom_filename);
		end
	end

endmodule