class charrua_base_test extends uvm_test;
    
    `uvm_component_utils(charrua_base_test)
    
    charrua_env env;

    function new(string name = "charrua_base_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = charrua_env::type_id::create("env", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info("CHARRUA_TEST", "Starting the test sequence...", UVM_HIGH)
        #(5000 * 10ns);
        phase.drop_objection(this);
        `uvm_info("CHARRUA_TEST", "Test sequence completed.", UVM_HIGH)
    endtask
endclass
