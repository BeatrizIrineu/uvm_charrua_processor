class charrua_instm_sequencer extends uvm_sequencer #(charrua_transfer)
  `uvm_component_utils(charrua_memory_sequencer)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

endclass: charrua_instm_sequencer