class charrua_instm_agent extends uvm_agent;
	charrua_instm_driver driver; 
	charrua_instm_monitor monitor; 
	charrua_instm_scoreboard scoreboard; 
	
	`uvm_component_utils(charrua_instm_agent)
	
	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor = charrua_instm_monitor::type_id::create("monitor", this);
		scoreboard = charrua_instm_scoreboard::type_id::create("scoreboard", this);
        
		if (get_is_active() == UVM_ACTIVE) {
				driver = charrua_instm_driver::type_id::create("driver", this);
		}
		analysis_port = new("analysis_port", this); // Inicializando a porta de análise
    
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		 if (get_is_active() == UVM_ACTIVE) {
			monitor.analysis_export.connect(scoreboard.analysis_export); // Correct way to connect monitor to scoreboard
		}
	endfunction

endclass : charrua_instm_agent