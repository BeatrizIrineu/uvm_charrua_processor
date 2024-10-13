typedef struct {
    bit [15:0] instruction;
    bit [15:0] data_in;
    bit [15:0] data_out;
} signal_bundle_t;

// Extend uvm_object to make it compatible with UVM transactions if needed
class signal_bundle extends uvm_object 
    signal_bundle_t data;

    `uvm_object_utils_begin(signal_bundle)
        `uvm_field_int(data.instruction, UVM_ALL_ON)
        `uvm_field_int(data.data_in, UVM_ALL_ON)
        `uvm_field_int(data.data_out, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "signal_bundle");
        super.new(name);
    endfunction

endclass : signal_bundle

class charrua_instm_monitor extends uvm_monitor;
	protected virtual charrua_if vif;
	
	`uvm_component_utils(charrua_instm_monitor)

	uvm_analysis_port #(signal_bundle) analysis_port;

	function new(string name, uvm_component parent);
		super.new(name, parent);
		analysis_port = new("analysis_port", this);
	endfunction

	virtual task run_phase(uvm_phase phase);
			super.run_phase(phase);
				signal_bundle bundle;
			forever begin
					@(posedge vif.sig_clk);
					bundle = signal_bundle::type_id::create("bundle");
					bundle.data.instruction = vif.sig_im_data;
					bundle.data.data_in = vif.sig_dm_in_data;
					bundle.data.data_out = vif.sig_dm_out_data;
					analysis_port.write(bundle);
			end
	endtask

endclass : charrua_instm_monitor


