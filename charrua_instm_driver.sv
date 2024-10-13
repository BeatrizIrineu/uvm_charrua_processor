class charrua_instm_driver extends uvm_driver #(charrua_transfer);

	`uvm_component_utils(charrua_instm_driver)
		
	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual charrua_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".vif"});
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
	super.run_phase(phase);
	fork
		drive_clock();
		assert_reset();
	join
	endtask: run_phase	

	task drive_clock();	
		forever begin
			vif.sig_clock <= 0;
			#10; 
			vif.sig_clock <= 1;
			#10;
		end
  endtask : drive_clock

	task assert_reset();	
		this.vif.sig_reset <= 1'b0;
		#250; 
		this.vif.sig_reset <= 1'b1;
	endtask : assert_reset

endclass : charrua_instm_driver
