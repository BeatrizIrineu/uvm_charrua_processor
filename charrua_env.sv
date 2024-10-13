class charrua_env extends uvm_env;
	charrua_instm_agent instm_agent; // Assuming you have an agent like this

	`uvm_component_utils(charrua_env)

	function new(string name = "charrua_env", uvm_component parent = null);
			super.new(name, parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);
			instm_agent = charrua_instm_agent::type_id::create("instm_agent", this);
	endfunction

	virtual function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
			//instm_agent.monitor.analysis_port.connect(instm_agent.scoreboard.analysis_export);
	endfunction

endclass : charrua_env