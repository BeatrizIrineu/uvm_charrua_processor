//responsável por comparar os resultados esperados com os resultados observados
class charrua_scoreboard extends uvm_scoreboard;
	//permite a um componente receber transações ou dados de análise
	uvm_analysis_imp #(charrua_transfer, charrua_scoreboard) item_collected_export;

	protected bit disable_scoreboard = 0;

	`uvm_component_utils_begin(charrua_scoreboard)
		`uvm_field_int(disable_scoreboard, UVM_DEFAULT)
	`uvm_component_utils_end

	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		item_collected_export = new("item_collected_export", this);
	endfunction : build_phase

	virtual function void report_phase(uvm_phase phase);
		if (!disable_scoreboard) begin
			`uvm_info(get_type_name(), $sformat("Reporting scoreboard information...\n%s", this.sprint()), UVM_LOW)
		end
	endfunction: report_phase
endclass : charrua_scoreboard
