class inst_memory_seq extends uvm_sequence #(charrua_transfer);
	
	`uvm_object_utils(instm_memory_seq)
	`uvm_declare_p_sequencer(charrua_memory_sequencer);

	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	virtual task body();
		charrua_transfer trans;
		`uvm_create(trans);
		trans.randomize();
		//envia sequência para o sequencer 
		`uvm_send(trans);

		string filename;

		case (trans.rom_select)
				charrua_rom_t::ROM1: filename = "rom1.txt";
				charrua_rom_t::ROM2: filename = "rom2.txt";
				charrua_rom_t::ROM3: filename = "rom3.txt";
				charrua_rom_t::ROM4: filename = "rom4.txt";
		endcase
		
		uvm_config_db #(string)::set(uvm_root::get(), "*.v", "rom_filename", filename);
		`uvm_info(get_type_name(), $sformat("Loading file %s", filename), UVM_HIGH)

	endtask : body
endclass : inst_memory_seq