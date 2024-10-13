typedef enum {
    ROM1 = 0,  // Corresponds to "rom1.txt"
    ROM2,      // Corresponds to "rom2.txt"
    ROM3,      // Corresponds to "rom3.txt"
    ROM4       // Corresponds to "rom4.txt"
} charrua_rom_t;

class charrua_transfer extends uvm_sequence_item;
	rand charrua_rom_t rom_select;

	`uvm_object_utils_begin(charrua_transfer)
		`uvm_field_enum(charrua_rom_t, rom_select, UVM_DEFAULT)
	`uvm_object_utils_end

	function new(string name);
			super.new(name);
	endfunction
endclass : charrua_transfer
